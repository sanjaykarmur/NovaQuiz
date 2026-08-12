using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NovaQuiz_3
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string fullname, username, email, mobile, password;
            bool isName = false;
            bool isUsername = false;
            bool isEmail = false;
            bool isMobile = false;
            bool isPassword = false;

            //full name
            if (TextBox1.Text == "")
            {
                Label1.Text = "Please enter your full name";
            }
            else
            {
                isName = true;
                Label1.Text = "";
            }

            //username
            if (TextBox2.Text == "")
            {
                Label2.Text = "Please enter your username";
            }
            else
            {
                isUsername = true;
                Label2.Text = "";
            }

            //email
            if (TextBox3.Text == "")
            {
                Label3.Text = "Please enter your email";
            }
            else
            {
                isEmail = true;
                Label3.Text = "";
            }

            //mobile number

            if (TextBox4.Text == "")
            {
                Label4.Text = "Please enter your mobile number";
            }
            else if (!(TextBox4.Text.All(Char.IsDigit) && TextBox4.Text.Length == 10))
            {
                Label4.Text = "Mobile number must be 10 digits";
            }
            else
            {
                isMobile = true;
                Label4.Text = "";
            }

            //password
            if (TextBox5.Text == "" || TextBox6.Text == "")
            {
                Label5.Text = "Please enter password to both fields";
            }
            else if (TextBox5.Text != TextBox6.Text)
            {
                Label5.Text = "Password do not match";
            }
            else if (TextBox5.Text.Length < 8)
            {
                Label5.Text = "Password should have at least 8 characters";
            }
            else
            {
                isPassword = true;
                Label5.Text = "";
            }



            if (isName == true && isUsername == true && isEmail == true &&  isMobile == true && isPassword == true)
            {
                fullname = TextBox1.Text;
                username = TextBox2.Text;
                email = TextBox3.Text;
                mobile = TextBox4.Text;
                mobile = TextBox4.Text;
                password = TextBox5.Text;

                string s = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\sanju\\Desktop\\NovaQuiz_3\\App_Data\\NV_DB.mdf;Integrated Security=True";
                string query = "INSERT INTO USERS (FULLNAME, USERNAME, EMAIL, MOBILE, PASSWORD) VALUES('"+fullname+"', '"+username+"', '"+email+"', '"+mobile+"', '"+password+"')";

                SqlConnection con = new SqlConnection(s);
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
            }
        }
    }
}