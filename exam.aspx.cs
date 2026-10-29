using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovaQuiz_3
{
    public partial class exam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            int examId;

            if (!int.TryParse(Request.QueryString["id"], out examId)
                || examId <= 0)
            {
                btnSubmit.Enabled = false;
                examTitle.Text = "Invalid exam";
                return;
            }

            if (!IsPostBack)
            {
                string cs = ConfigurationManager
                    .ConnectionStrings["dbcon"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT EXAM_TITLE FROM EXAMS WHERE EXAM_ID = " + examId,
                    con))
                {
                    con.Open();

                    object title = cmd.ExecuteScalar();

                    if (title == null || title == DBNull.Value)
                    {
                        btnSubmit.Enabled = false;
                        examTitle.Text = "Exam not found";
                        return;
                    }

                    examTitle.Text = Convert.ToString(title);
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = Convert.ToString(Session["UserName"]);

            int examId;

            if (string.IsNullOrWhiteSpace(email))
            {
                ShowMessage("Your session has expired. Please log in again.");
                return;
            }

            if (!int.TryParse(Request.QueryString["id"], out examId)
                || examId <= 0)
            {
                ShowMessage("Invalid exam.");
                return;
            }

            if (lvQuestions.Items.Count == 0)
            {
                ShowMessage("No questions are available for this exam.");
                return;
            }

            string cs = ConfigurationManager
                .ConnectionStrings["dbcon"].ConnectionString;

            Dictionary<int, string> correctAnswers =
                new Dictionary<int, string>();

            Dictionary<string, string> selectedAnswers =
                new Dictionary<string, string>();

            int score = 0;
            int total = lvQuestions.Items.Count;
            int resultId = 0;

            JavaScriptSerializer serializer =
                new JavaScriptSerializer();

            // Escape apostrophes in string values used in SQL.
            string safeEmail = email.Replace("'", "''");

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                using (SqlTransaction transaction = con.BeginTransaction())
                {
                    try
                    {
                        // 1. Get the logged-in user's ID.
                        int userId;

                        string userQuery =
                            "SELECT ID FROM USERS WHERE EMAIL = '" +
                            safeEmail + "'";

                        using (SqlCommand userCmd =
                            new SqlCommand(userQuery, con, transaction))
                        {
                            object userResult = userCmd.ExecuteScalar();

                            if (userResult == null ||
                                userResult == DBNull.Value)
                            {
                                throw new InvalidOperationException(
                                    "The logged-in user was not found.");
                            }

                            userId = Convert.ToInt32(userResult);
                        }

                        // 2. Fetch correct answers from the database.
                        string questionQuery =
                            "SELECT Q_ID, CORRECT_OPTION " +
                            "FROM QUESTIONS WHERE E_ID = " + examId;

                        using (SqlCommand questionCmd =
                            new SqlCommand(questionQuery, con, transaction))
                        using (SqlDataReader reader =
                            questionCmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                int questionId =
                                    Convert.ToInt32(reader["Q_ID"]);

                                string correctOption =
                                    reader["CORRECT_OPTION"] == DBNull.Value
                                    ? ""
                                    : Convert.ToString(
                                        reader["CORRECT_OPTION"]).Trim();

                                correctAnswers[questionId] = correctOption;
                            }
                        }

                        if (correctAnswers.Count != total)
                        {
                            throw new InvalidOperationException(
                                "The question list has changed. " +
                                "Please reload the exam and try again.");
                        }

                        // 3. Collect selected answers and calculate score.
                        foreach (ListViewDataItem item in lvQuestions.Items)
                        {
                            int questionId = Convert.ToInt32(
                                lvQuestions.DataKeys[item.DisplayIndex].Value);

                            if (!correctAnswers.ContainsKey(questionId))
                            {
                                throw new InvalidOperationException(
                                    "An invalid question was submitted.");
                            }

                            RadioButton rbA =
                                (RadioButton)item.FindControl("rbA");

                            RadioButton rbB =
                                (RadioButton)item.FindControl("rbB");

                            RadioButton rbC =
                                (RadioButton)item.FindControl("rbC");

                            RadioButton rbD =
                                (RadioButton)item.FindControl("rbD");

                            string selected = null;

                            if (rbA != null && rbA.Checked)
                                selected = "A";
                            else if (rbB != null && rbB.Checked)
                                selected = "B";
                            else if (rbC != null && rbC.Checked)
                                selected = "C";
                            else if (rbD != null && rbD.Checked)
                                selected = "D";

                            selectedAnswers.Add(
                                questionId.ToString(
                                    CultureInfo.InvariantCulture),
                                selected);

                            if (selected != null &&
                                string.Equals(
                                    selected,
                                    correctAnswers[questionId],
                                    StringComparison.OrdinalIgnoreCase))
                            {
                                score++;
                            }
                        }

                        // 4. Convert selected answers to JSON.
                        string answersJson =
                            serializer.Serialize(selectedAnswers);

                        // Escape apostrophes in JSON before inserting.
                        string safeAnswersJson =
                            answersJson.Replace("'", "''");

                        // 5. Insert result and retrieve generated RESULT_ID.
                        string insertQuery =
                            "INSERT INTO EXAM_RESULTS " +
                            "(USER_ID, EXAM_ID, SCORE, TOTAL_MARKS, SELECTED_ANSWERS) " +
                            "OUTPUT INSERTED.RESULT_ID " +
                            "VALUES (" +
                            userId + ", " +
                            examId + ", " +
                            score + ", " +
                            total + ", " +
                            "N'" + safeAnswersJson + "')";

                        using (SqlCommand insertCmd =
                            new SqlCommand(insertQuery, con, transaction))
                        {
                            object insertedId = insertCmd.ExecuteScalar();

                            if (insertedId == null ||
                                insertedId == DBNull.Value)
                            {
                                throw new InvalidOperationException(
                                    "Could not retrieve the result ID.");
                            }

                            resultId = Convert.ToInt32(insertedId);
                        }

                        // 6. Commit after the result is saved.
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            transaction.Rollback();
                        }
                        catch (SqlException)
                        {
                            // Preserve the original exception.
                        }

                        System.Diagnostics.Trace.TraceError(
                            "Exam submission failed: " + ex);

                        ShowMessage(
                            "Your result could not be saved. Please try again.");

                        return;
                    }
                }
            }

            // 7. Redirect to the result page using the actual RESULT_ID.
            string resultUrl =
                ResolveUrl("~/viewResult.aspx?RESULT_ID=" +
                resultId.ToString(CultureInfo.InvariantCulture));

            Response.Redirect(resultUrl, false);
            Context.ApplicationInstance.CompleteRequest();
        }

        private void ShowMessage(string message)
        {
            string script =
                "alert('" +
                System.Web.HttpUtility.JavaScriptStringEncode(message) +
                "');";

            ClientScript.RegisterStartupScript(
                GetType(),
                "ExamMessage",
                script,
                true);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        protected void lvQuestions_SelectedIndexChanged(
            object sender, EventArgs e)
        {
        }
    }
}