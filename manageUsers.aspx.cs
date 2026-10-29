
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace NovaQuiz_3
{
    public partial class manageUsers : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(
            ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString
        );

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserStatistics();
            }
        }

        void LoadUserStatistics()
        {
            con.Open();

            // Total Users
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM USERS", con);
            lblTotalUsers.Text = Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");

            // Users With Email
            cmd = new SqlCommand("SELECT COUNT(*) FROM USERS WHERE EMAIL IS NOT NULL AND LTRIM(RTRIM(EMAIL)) <> ''", con);
            lblUsersWithEmail.Text = Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");

            // Users With Mobile
            cmd = new SqlCommand("SELECT COUNT(*) FROM USERS WHERE MOBILE IS NOT NULL AND LTRIM(RTRIM(MOBILE)) <> ''", con);
            lblUsersWithMobile.Text = Convert.ToInt32(cmd.ExecuteScalar()).ToString("N0");

            con.Close();
        }

        protected void btnSearchUser_Click(object sender, EventArgs e)
        {
            string search = txtSearchUser.Text.Trim().Replace("'", "''");

            dsUsers.SelectCommand = "SELECT ID, FULLNAME, USERNAME, EMAIL, MOBILE FROM USERS WHERE FULLNAME LIKE '%" + search + "%' OR USERNAME LIKE '%" + search + "%' OR EMAIL LIKE '%" + search + "%' OR MOBILE LIKE '%" + search + "%' ORDER BY ID DESC";

            GridViewUsers.PageIndex = 0;
            GridViewUsers.DataBind();
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            txtSearchUser.Text = "";

            dsUsers.SelectCommand = "SELECT ID, FULLNAME, USERNAME, EMAIL, MOBILE FROM USERS ORDER BY ID DESC";

            GridViewUsers.PageIndex = 0;
            GridViewUsers.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}
