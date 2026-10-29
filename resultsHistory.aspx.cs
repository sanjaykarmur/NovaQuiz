using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace NovaQuiz_3
{
    public partial class resultsHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load results history.
            LoadResultsHistory();
        }

        void LoadResultsHistory()
        {
            string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Get the logged-in user's ID from the email stored in the session.
                if (Session["UserName"] == null)
                {
                    Response.Redirect("login.aspx");
                    return;
                }

                SqlCommand userCmd = new SqlCommand(
                    "SELECT ID FROM USERS WHERE EMAIL = '" +
                    Session["UserName"].ToString().Replace("'", "''") + "'", con);

                object userIdResult = userCmd.ExecuteScalar();

                if (userIdResult == null || userIdResult == DBNull.Value)
                {
                    Response.Redirect("login.aspx");
                    return;
                }

                int userId = Convert.ToInt32(userIdResult);

                // Fetch this user's exam history.
                string query = @"
                    SELECT
                        er.RESULT_ID,
                        er.EXAM_ID,
                        e.EXAM_TITLE,
                        er.SCORE,
                        er.TOTAL_MARKS,
                        er.SUBMITTED_AT,
                        CASE
                            WHEN er.TOTAL_MARKS > 0
                            THEN CAST(
                                er.SCORE * 100.0 / er.TOTAL_MARKS
                                AS DECIMAL(10,2)
                            )
                            ELSE 0
                        END AS ACCURACY
                    FROM EXAM_RESULTS er
                    INNER JOIN EXAMS e
                        ON er.EXAM_ID = e.EXAM_ID
                    WHERE er.USER_ID = " + userId + @"
                    ORDER BY er.SUBMITTED_AT DESC";

                DataTable dt = new DataTable();

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    da.Fill(dt);
                }

                //// Calculate summary values.
                //int totalAttempts = dt.Rows.Count;

                //decimal totalAccuracy = 0;
                //decimal bestScorePercentage = -1;
                //decimal bestScore = 0;
                //decimal bestTotalMarks = 0;

                //foreach (DataRow row in dt.Rows)
                //{
                //    decimal accuracy = Convert.ToDecimal(row["ACCURACY"]);
                //    decimal score = Convert.ToDecimal(row["SCORE"]);
                //    decimal totalMarks = Convert.ToDecimal(row["TOTAL_MARKS"]);

                //    totalAccuracy += accuracy;

                //    if (accuracy > bestScorePercentage)
                //    {
                //        bestScorePercentage = accuracy;
                //        bestScore = score;
                //        bestTotalMarks = totalMarks;
                //    }
                //}

                //decimal averageAccuracy = totalAttempts > 0
                //    ? totalAccuracy / totalAttempts
                //    : 0;

                //// Update summary cards.
                ////lblTotalAttempts.Text = totalAttempts.ToString("N0");

                //lblAverageAccuracy.Text =
                //    averageAccuracy.ToString("0.00") + "%";

                //lblBestScore.Text = totalAttempts > 0
                //    ? bestScore.ToString("0.##") + "/" +
                //      bestTotalMarks.ToString("0.##")
                //    : "0/0";

                //lblAttemptCount.Text = totalAttempts.ToString("N0");

                // Bind exam history to GridView.
                gvResultsHistory.DataSource = dt;
                gvResultsHistory.DataBind();
            }
        }

        protected void gvResultsHistory_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].CssClass = "history-exam";
                e.Row.Cells[2].CssClass = "history-score";
                e.Row.Cells[3].CssClass = "history-total";
            }
        }

        protected void gvResultsHistory_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewResult")
            {
                int resultId;

                if (int.TryParse(
                    Convert.ToString(e.CommandArgument), out resultId))
                {
                    Response.Redirect(
                        "viewResult.aspx?resultId=" + resultId);
                }
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
