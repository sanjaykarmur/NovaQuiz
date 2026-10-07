using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NovaQuiz_3
{
    public partial class editExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int examId = Convert.ToInt32(Request.QueryString["?examId"]);
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ListView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void ApplyEditButton_Click(object sender, EventArgs e)
        {

            string cs = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);
            con.Open();

            foreach (ListViewDataItem item in ListView1.Items)
            {
                Label qIdLabel = (Label)item.FindControl("Q_IDLabel");

                int qid = Convert.ToInt32(qIdLabel.Text);

                TextBox qText = (TextBox)item.FindControl("Q_TEXTTextBox");
                TextBox optionA = (TextBox)item.FindControl("OPTION_ATextBox");
                TextBox optionB = (TextBox)item.FindControl("OPTION_BTextBox");
                TextBox optionC = (TextBox)item.FindControl("OPTION_CTextBox");
                TextBox optionD = (TextBox)item.FindControl("OPTION_DTextBox");
                DropDownList correctOption = (DropDownList)item.FindControl("CorrectOptionDropDownList");

                string Q_TEXT = qText.Text;
                string OPTION_A = optionA.Text;
                string OPTION_B = optionB.Text;
                string OPTION_C = optionC.Text;
                string OPTION_D = optionD.Text;

                string CORRECT_OPTION = correctOption.SelectedValue;

                string updateQuery = "UPDATE QUESTIONS SET Q_TEXT = N'" + Q_TEXT + "', OPTION_A = N'" + OPTION_A + "', OPTION_B = N'" + OPTION_B + "', OPTION_C = N'" + OPTION_C + "', OPTION_D = N'" + OPTION_D + "', CORRECT_OPTION = N'" + CORRECT_OPTION + "' WHERE Q_ID = " + qid;

                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.ExecuteNonQuery();
            }
            //update The scoRe in the dAtabase
            con.Close();



            Response.Write("<script>alert('Updates saved successfully!');</script>");
        }
    }
}