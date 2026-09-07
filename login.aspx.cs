using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NovaQuiz_3
{
    public partial class login : System.Web.UI.Page
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

        int  i;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }


        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!(String.IsNullOrEmpty(TextBox1.Text)) && !(String.IsNullOrEmpty(TextBox2.Text)))
            { 
                cmd = new SqlCommand("SELECT COUNT(*) FROM USERS WHERE EMAIL ='" + TextBox1.Text + "' AND PASSWORD ='" + TextBox2.Text + "'", con);
                i = Convert.ToInt32(cmd.ExecuteScalar());
                if (i > 0)
                { 
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    Response.Write("Invalid email or password");
                }
            }
        }
    }
}