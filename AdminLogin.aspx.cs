using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NovaQuiz_3
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        // Hardcoded credentials for the college project.
        private const string AdminUsername = "admin";
        private const string AdminPassword = "Admin@123";

        protected void Page_Load(object sender, EventArgs e)
        {
            // If the admin is already logged in, open the dashboard.
            if (Session["IsAdmin"] is bool &&
                (bool)Session["IsAdmin"])
            {
                Response.Redirect("~/adminDashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string enteredUsername = txtUsername.Text.Trim();
            string enteredPassword = txtPassword.Text;

            if (enteredUsername == AdminUsername &&
                enteredPassword == AdminPassword)
            {
                // Establish the admin session.
                Session["AdminID"] = 1;
                Session["IsAdmin"] = true;

                // Redirect to the admin dashboard.
                Response.Redirect("~/adminDashboard.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
                lblMessage.Visible = true;
            }
        }
    }
}