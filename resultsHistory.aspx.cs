
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovaQuiz_3
{
    public partial class resultsHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load history only on the initial page request.
            // GridView events can trigger postbacks separately.
            if (!IsPostBack)
            {
                LoadResultsHistory();
            }
        }

        private void LoadResultsHistory()
        {
            // Check the login session first.
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            string email = Session["UserName"].ToString();

            string cs = ConfigurationManager
                .ConnectionStrings["dbcon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                // Fetch only the logged-in user's exam history.
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
                    FROM dbo.EXAM_RESULTS AS er
                    INNER JOIN dbo.EXAMS AS e
                        ON er.EXAM_ID = e.EXAM_ID
                    INNER JOIN dbo.USERS AS u
                        ON er.USER_ID = u.ID
                    WHERE u.EMAIL = @Email
                    ORDER BY er.SUBMITTED_AT DESC";

                DataTable dt = new DataTable();

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@Email", SqlDbType.NVarChar, 256).Value = email;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }

                gvResultsHistory.DataSource = dt;
                gvResultsHistory.DataBind();
            }
        }

        protected void gvResultsHistory_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Keep the existing table styling.
                if (e.Row.Cells.Count > 1)
                    e.Row.Cells[1].CssClass = "history-exam";

                if (e.Row.Cells.Count > 2)
                    e.Row.Cells[2].CssClass = "history-score";

                if (e.Row.Cells.Count > 3)
                    e.Row.Cells[3].CssClass = "history-total";
            }
        }

        protected void gvResultsHistory_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewResult")
            {
                int resultId;

                if (!int.TryParse(
                    Convert.ToString(e.CommandArgument),
                    out resultId) || resultId <= 0)
                {
                    return;
                }

                // Forward the selected result ID to the review page.
                Response.Redirect(
                    "viewResult.aspx?RESULT_ID=" + resultId,
                    false);

                Context.ApplicationInstance.CompleteRequest();
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
