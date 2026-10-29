
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NovaQuiz_3
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboard();
            }
        }

        void LoadDashboard()
        {
            try
            {
                con.Open();

                // Total Exams
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM EXAMS", con);
                lblTotalExams.Text = Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");

                // Total Users
                cmd = new SqlCommand("SELECT COUNT(*) FROM USERS", con);
                int totalUsers = Convert.ToInt32(cmd.ExecuteScalar());
                lblTotalUsers.Text = totalUsers.ToString("N0");

                // Total Exam Attempts
                cmd = new SqlCommand("SELECT COUNT(*) FROM EXAM_RESULTS", con);
                int totalAttempts = Convert.ToInt32(cmd.ExecuteScalar());
                lblTotalAttempts.Text = totalAttempts.ToString("N0");

                // Average Accuracy
                cmd = new SqlCommand("SELECT ISNULL(AVG(SCORE * 100.0 / NULLIF(TOTAL_MARKS, 0)), 0) FROM EXAM_RESULTS WHERE TOTAL_MARKS > 0", con);
                decimal averageAccuracy = Convert.ToDecimal(cmd.ExecuteScalar());
                lblAverageAccuracy.Text = averageAccuracy.ToString("0.00") + "%";

                // Average Score
                cmd = new SqlCommand("SELECT ISNULL(AVG(CAST(SCORE AS DECIMAL(18, 2))), 0) FROM EXAM_RESULTS", con);
                decimal averageScore = Convert.ToDecimal(cmd.ExecuteScalar());
                lblAverageScore.Text = averageScore.ToString("0.00");

                // Average Attempts Per User
                decimal examsPerUser = totalUsers > 0 ? (decimal)totalAttempts / totalUsers : 0m;
                lblExamsPerUser.Text = examsPerUser.ToString("0.00");
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

            // Recent Exam Attempts
            LoadRecentAttempts();
        }

        void LoadRecentAttempts()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT TOP 10 USER_ID, EXAM_ID, SCORE, TOTAL_MARKS FROM EXAM_RESULTS ORDER BY SUBMITTED_AT DESC", con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvRecentAttempts.DataSource = dt;
                gvRecentAttempts.DataBind();
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
