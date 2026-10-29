
using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace NovaQuiz_3
{
    public partial class updateUser : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        int userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out userId) || userId <= 0)
            {
                Response.Redirect("manageUsers.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUser();
            }
        }

        void LoadUser()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT ID, FULLNAME, USERNAME, EMAIL, MOBILE FROM USERS WHERE ID = " + userId, con);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        lblUserID.Text = dr["ID"].ToString();
                        txtFullName.Text = dr["FULLNAME"].ToString();
                        txtUsername.Text = dr["USERNAME"].ToString();
                        txtEmail.Text = dr["EMAIL"].ToString();
                        txtMobile.Text = dr["MOBILE"].ToString();
                    }
                    else
                    {
                        Response.Redirect("manageUsers.aspx");
                    }
                }
            }
        }

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim().Replace("'", "''");
            string username = txtUsername.Text.Trim().Replace("'", "''");
            string email = txtEmail.Text.Trim().Replace("'", "''");
            string mobile = txtMobile.Text.Trim().Replace("'", "''");

            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(mobile))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.CssClass = "update-user-message error";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "UPDATE USERS SET FULLNAME = '" + fullName +
                    "', USERNAME = '" + username +
                    "', EMAIL = '" + email +
                    "', MOBILE = '" + mobile +
                    "' WHERE ID = " + userId;

                SqlCommand cmd = new SqlCommand(query, con);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "User details updated successfully.";
                    lblMessage.CssClass = "update-user-message success";
                }
                else
                {
                    lblMessage.Text = "User not found or no changes were saved.";
                    lblMessage.CssClass = "update-user-message error";
                }
            }
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM USERS WHERE ID = " + userId, con);

                try
                {
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Redirect("manageUsers.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "User not found or already deleted.";
                        lblMessage.CssClass = "update-user-message error";
                    }
                }
                catch (SqlException)
                {
                    lblMessage.Text = "Unable to delete this user. Related exam results may exist.";
                    lblMessage.CssClass = "update-user-message error";
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
