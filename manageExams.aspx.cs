
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovaQuiz_3
{
    public partial class manageExams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Session["IsAdmin"] is bool &&
                  (bool)Session["IsAdmin"]) ||
                Session["AdminID"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
                return;
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
