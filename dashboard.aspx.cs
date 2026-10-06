using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



namespace NovaQuiz_3
{
    public partial class dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        string nm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                getcon();
                da = new SqlDataAdapter("SELECT * FROM USERS WHERE EMAIL='" + Session["UserName"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                nm = ds.Tables[0].Rows[0]["FULLNAME"].ToString();
                Label1.Text = nm;

                cmd = new SqlCommand("SELECT AVG(SCORE * 100.0 / TOTAL_MARKS) FROM EXAM_RESULTS WHERE USER_ID=" + ds.Tables[0].Rows[0]["ID"], con);
                avgScoreLabel.Text = Convert.ToDouble(cmd.ExecuteScalar()).ToString("0.00") + "%";
            }
            else
            {
                Response.Redirect("login.aspx");
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