
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NovaQuiz_3
{
    public partial class addExam : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int examId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["examId"] != null)
            {
                if (!int.TryParse(Request.QueryString["examId"], out examId) || examId <= 0)
                {
                    Response.Redirect("manageExams.aspx");
                    return;
                }
            }

            if (!IsPostBack)
            {
                if (examId > 0)
                {
                    LoadExam();
                    btnAddExam.Text = "Update Exam";
                }
                else
                {
                    btnAddExam.Text = "Create Exam";
                }
            }
        }

        void LoadExam()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT EXAM_ID, EXAM_TITLE, EXAM_MARKS, TIME_LIMIT, IS_PUBLISHED FROM EXAMS WHERE EXAM_ID = " + examId,
                    con
                );

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        txtExamTitle.Text = dr["EXAM_TITLE"].ToString();
                        txtExamMarks.Text = dr["EXAM_MARKS"].ToString();
                        txtTimeLimit.Text = dr["TIME_LIMIT"].ToString();
                        chkIsPublished.Checked = Convert.ToBoolean(dr["IS_PUBLISHED"]);
                    }
                    else
                    {
                        Response.Redirect("manageExams.aspx");
                    }
                }
            }
        }

        protected void btnAddExam_Click(object sender, EventArgs e)
        {
            string examTitle = txtExamTitle.Text.Trim().Replace("'", "''");
            int examMarks;
            int timeLimit;

            if (string.IsNullOrWhiteSpace(examTitle))
            {
                ShowMessage("Please enter the exam title.", false);
                return;
            }

            if (!int.TryParse(txtExamMarks.Text, out examMarks) || examMarks <= 0)
            {
                ShowMessage("Please enter valid total marks greater than zero.", false);
                return;
            }

            if (!int.TryParse(txtTimeLimit.Text, out timeLimit) || timeLimit <= 0)
            {
                ShowMessage("Please enter a valid time limit greater than zero.", false);
                return;
            }

            int isPublished = chkIsPublished.Checked ? 1 : 0;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query;

                if (examId > 0)
                {
                    query = "UPDATE EXAMS SET EXAM_TITLE = '" + examTitle +
                            "', EXAM_MARKS = " + examMarks +
                            ", TIME_LIMIT = " + timeLimit +
                            ", IS_PUBLISHED = " + isPublished +
                            " WHERE EXAM_ID = " + examId;
                }
                else
                {
                    query = "INSERT INTO EXAMS (EXAM_TITLE, EXAM_MARKS, TIME_LIMIT, IS_PUBLISHED) VALUES ('" +
                            examTitle + "', " + examMarks + ", " + timeLimit + ", " + isPublished + ")";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    if (examId > 0)
                    {
                        ShowMessage("Exam updated successfully.", true);
                        btnAddExam.Text = "Update Exam";
                    }
                    else
                    {
                        ShowMessage("Exam created successfully.", true);

                        txtExamTitle.Text = "";
                        txtExamMarks.Text = "";
                        txtTimeLimit.Text = "";
                        chkIsPublished.Checked = false;

                        btnAddExam.Text = "Create Exam";
                    }
                }
                else
                {
                    ShowMessage("No exam was changed. Please check whether the exam still exists.", false);
                }
            }
        }

        void ShowMessage(string message, bool success)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = success
                ? "add-exam-message success"
                : "add-exam-message error";
        }

        protected void btnResetExam_Click(object sender, EventArgs e)
        {
            if (examId > 0)
            {
                LoadExam();
                btnAddExam.Text = "Update Exam";
                ShowMessage("Original exam details restored.", true);
            }
            else
            {
                txtExamTitle.Text = "";
                txtExamMarks.Text = "";
                txtTimeLimit.Text = "";
                chkIsPublished.Checked = false;
                lblMessage.Text = "";
                btnAddExam.Text = "Create Exam";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}
