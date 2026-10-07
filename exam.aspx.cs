using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovaQuiz_3
{
    public partial class exam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
                Response.Redirect("login.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = Session["UserName"]?.ToString();
            int examId = Convert.ToInt32(Request.QueryString["id"]);



            int score = 0;
            int total = lvQuestions.Items.Count;

            string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);
            con.Open();

            string userQuery = "SELECT ID FROM USERS WHERE EMAIL = '" + email + "'";
            SqlCommand userCmd = new SqlCommand(userQuery, con);

            int userId = Convert.ToInt32(userCmd.ExecuteScalar());

            foreach (ListViewDataItem item in lvQuestions.Items)
            {
                RadioButton rbA = (RadioButton)item.FindControl("rbA");
                RadioButton rbB = (RadioButton)item.FindControl("rbB");
                RadioButton rbC = (RadioButton)item.FindControl("rbC");
                RadioButton rbD = (RadioButton)item.FindControl("rbD");

                HiddenField hfCorrect = (HiddenField)item.FindControl("hfCorrect");

                string selected = "";

                if (rbA.Checked)
                    selected = "A";
                else if (rbB.Checked)
                    selected = "B";
                else if (rbC.Checked)
                    selected = "C";
                else if (rbD.Checked)
                    selected = "D";

                string correct = hfCorrect.Value;

                if (selected == correct)
                    score++;
                
            }

            //Store The scoRe in the dAtabase

            string insertQuery = "INSERT INTO EXAM_RESULTS (USER_ID, EXAM_ID, SCORE, TOTAL_MARKS) VALUES (" + userId + ", " + examId + ", " + score + ", " + total + ")";

            SqlCommand cmd = new SqlCommand(insertQuery, con);
            cmd.ExecuteNonQuery();


            Response.Write("<script>alert('Your Score: " + score + "');</script>");
   
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }

        protected void lvQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}