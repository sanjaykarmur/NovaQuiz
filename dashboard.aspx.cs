
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace NovaQuiz_3
{
    public partial class dashboard : System.Web.UI.Page
    {
        private readonly string connectionString =
            ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboard();
            }
        }

        private void LoadDashboard()
        {
            string email = Convert.ToString(Session["UserName"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // 1. Fetch the logged-in user.
                int userId;

                using (SqlCommand userCmd = new SqlCommand(
                    @"SELECT ID, FULLNAME
                      FROM USERS
                      WHERE EMAIL = @Email", con))
                {
                    userCmd.Parameters.Add(
                        "@Email", SqlDbType.NVarChar, 256).Value = email;

                    using (SqlDataReader reader = userCmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            reader.Close();

                            Session.Clear();
                            Session.Abandon();

                            Response.Redirect("~/login.aspx", false);
                            Context.ApplicationInstance.CompleteRequest();
                            return;
                        }

                        userId = Convert.ToInt32(reader["ID"]);

                        Label1.Text = Convert.ToString(reader["FULLNAME"]);
                    }
                }

                // 2. Calculate examination statistics.
                string statisticsQuery = @"
                    SELECT
                        COUNT(*) AS TotalExams,

                        ISNULL(
                            AVG(
                                CASE
                                    WHEN TOTAL_MARKS > 0
                                    THEN SCORE * 100.0 / TOTAL_MARKS
                                    ELSE NULL
                                END
                            ), 0
                        ) AS AverageScore,

                        ISNULL(
                            MAX(
                                CASE
                                    WHEN TOTAL_MARKS > 0
                                    THEN SCORE * 100.0 / TOTAL_MARKS
                                    ELSE NULL
                                END
                            ), 0
                        ) AS BestScore,

                        ISNULL(SUM(SCORE), 0) AS MarksEarned

                    FROM EXAM_RESULTS
                    WHERE USER_ID = @UserID";

                using (SqlCommand statsCmd =
                    new SqlCommand(statisticsQuery, con))
                {
                    statsCmd.Parameters.Add(
                        "@UserID", SqlDbType.Int).Value = userId;

                    using (SqlDataReader reader = statsCmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int totalExams =
                                Convert.ToInt32(reader["TotalExams"]);

                            double averageScore =
                                Convert.ToDouble(reader["AverageScore"]);

                            double bestScore =
                                Convert.ToDouble(reader["BestScore"]);

                            decimal marksEarned =
                                Convert.ToDecimal(reader["MarksEarned"]);

                            // Main statistics cards.
                            lblTotalExams.Text =
                                totalExams.ToString();

                            avgScoreLabel.Text =
                                averageScore.ToString("0.00") + "%";

                            lblBestScore.Text =
                                bestScore.ToString("0.00") + "%";

                            lblMarksEarned.Text =
                                marksEarned.ToString("0.##");

                            // Performance summary.
                            lblSummaryAttempts.Text =
                                totalExams.ToString();

                            lblSummaryAverage.Text =
                                averageScore.ToString("0.00") + "%";

                            lblSummaryBest.Text =
                                bestScore.ToString("0.00") + "%";

                            lblSummaryMarks.Text =
                                marksEarned.ToString("0.##");
                        }
                    }
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
