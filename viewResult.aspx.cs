using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace NovaQuiz_3
{
    public partial class viewResult : System.Web.UI.Page
    {
        protected void btnDownloadCertificate_Click(object sender, EventArgs e)
        {
            int resultId;

            if (!int.TryParse(Request.QueryString["RESULT_ID"], out resultId) ||
                resultId <= 0)
            {
                lblMessage.Text = "Invalid result ID.";
                lblMessage.Visible = true;
                return;
            }

            if (Session["UserName"] == null)
            {
                lblMessage.Text = "Your session has expired. Please log in again.";
                lblMessage.Visible = true;
                return;
            }

            string email = Convert.ToString(Session["UserName"]);
            string cs = ConfigurationManager
                .ConnectionStrings["dbcon"].ConnectionString;

            string fullName;
            string examTitleText;
            decimal percentage;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query =
                    "SELECT U.FULLNAME, E.EXAM_TITLE, ER.SCORE, ER.TOTAL_MARKS " +
                    "FROM EXAM_RESULTS ER " +
                    "INNER JOIN USERS U ON ER.USER_ID = U.ID " +
                    "INNER JOIN EXAMS E ON ER.EXAM_ID = E.EXAM_ID " +
                    "WHERE ER.RESULT_ID = " + resultId +
                    " AND U.EMAIL = '" + email.Replace("'", "''") + "'";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            lblMessage.Text = "Result not found or access denied.";
                            lblMessage.Visible = true;
                            return;
                        }

                        fullName = Convert.ToString(reader["FULLNAME"]);
                        examTitleText = Convert.ToString(reader["EXAM_TITLE"]);

                        decimal score = Convert.ToDecimal(reader["SCORE"]);
                        decimal totalMarks = Convert.ToDecimal(reader["TOTAL_MARKS"]);

                        if (totalMarks <= 0)
                        {
                            lblMessage.Text = "Certificate cannot be generated for this result.";
                            lblMessage.Visible = true;
                            return;
                        }

                        percentage = score * 100m / totalMarks;
                    }
                }
            }

            // Certificate eligibility: minimum 60%.
            if (percentage < 60m)
            {
                lblMessage.Text =
                    "A certificate requires a minimum score of 60%. " +
                    "Your score is " + percentage.ToString("0.00") + "%.";

                lblMessage.Visible = true;
                return;
            }

            using (MemoryStream memoryStream = new MemoryStream())
            {
                Document document = new Document(PageSize.A4.Rotate(), 45, 45, 35, 35);

                PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);

                document.Open();

                // Certificate colors and fonts.
                BaseColor purple = new BaseColor(105, 77, 224);
                BaseColor dark = new BaseColor(45, 40, 75);
                BaseColor muted = new BaseColor(115, 110, 135);

                Font brandFont = FontFactory.GetFont(
                    FontFactory.HELVETICA_BOLD, 26, purple);

                Font headingFont = FontFactory.GetFont(
                    FontFactory.HELVETICA_BOLD, 13, muted);

                Font bodyFont = FontFactory.GetFont(
                    FontFactory.HELVETICA, 15, dark);

                Font nameFont = FontFactory.GetFont(
                    FontFactory.HELVETICA_BOLD, 29, dark);

                Font examFont = FontFactory.GetFont(
                    FontFactory.HELVETICA_BOLD, 20, purple);

                Font percentageFont = FontFactory.GetFont(
                    FontFactory.HELVETICA_BOLD, 25, purple);

                Font footerFont = FontFactory.GetFont(
                    FontFactory.HELVETICA, 10, muted);

                // Decorative certificate border.
                PdfContentByte canvas = writer.DirectContent;

                // Main certificate content.
                Paragraph brand = new Paragraph("NovaQuiz", brandFont);
                brand.Alignment = Element.ALIGN_CENTER;
                brand.SpacingAfter = 12;
                document.Add(brand);

                Paragraph heading = new Paragraph(
                    "CERTIFICATE OF COMPLETION", headingFont);
                heading.Alignment = Element.ALIGN_CENTER;
                heading.SpacingAfter = 28;
                document.Add(heading);

                Paragraph introduction = new Paragraph(
                    "This certificate is awarded to", bodyFont);
                introduction.Alignment = Element.ALIGN_CENTER;
                introduction.SpacingAfter = 12;
                document.Add(introduction);

                Paragraph student = new Paragraph(
                    fullName, nameFont);
                student.Alignment = Element.ALIGN_CENTER;
                student.SpacingAfter = 18;
                document.Add(student);

                Paragraph completion = new Paragraph(
                    "Who successfully completed the examination", bodyFont);
                completion.Alignment = Element.ALIGN_CENTER;
                completion.SpacingAfter = 12;
                document.Add(completion);

                Paragraph exam = new Paragraph(
                    examTitleText, examFont);
                exam.Alignment = Element.ALIGN_CENTER;
                exam.SpacingAfter = 20;
                document.Add(exam);

                Paragraph result = new Paragraph(
                    "with " + percentage.ToString("0.00") + "%", percentageFont);
                result.Alignment = Element.ALIGN_CENTER;
                result.SpacingAfter = 30;
                document.Add(result);

                Paragraph message = new Paragraph(
                    "Keep learning, Keep improving And keep achieving",
                    bodyFont);
                message.Alignment = Element.ALIGN_CENTER;
                message.SpacingAfter = 45;
                document.Add(message);

                Paragraph footer = new Paragraph(
                    "NovaQuiz - A Modern Online examination platform",
                    footerFont);
                footer.Alignment = Element.ALIGN_CENTER;
                document.Add(footer);

                document.Close();

                byte[] pdfBytes = memoryStream.ToArray();

                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader(
                    "Content-Disposition",
                    "attachment; filename=NovaQuiz_Certificate.pdf");

                Response.BinaryWrite(pdfBytes);
                Response.Flush();

                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            if (!IsPostBack)
            {
                LoadResult();
            }
        }

        private void LoadResult()
        {
            // Get RESULT_ID from the URL query string.
            string resultIdValue = Request.QueryString["RESULT_ID"];

            // Also accept ?id=123 if that parameter is used.
            if (string.IsNullOrWhiteSpace(resultIdValue))
            {
                resultIdValue = Request.QueryString["id"];
            }

            int resultId;

            if (!int.TryParse(resultIdValue, out resultId) || resultId <= 0)
            {
                ShowError("Invalid result ID.");
                return;
            }

            string email = Session["UserName"].ToString();

            string cs = ConfigurationManager
                .ConnectionStrings["dbcon"].ConnectionString;

            int examId;
            int score;
            int totalMarks;
            string examTitle;
            string answersJson;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Retrieve only a result belonging to the logged-in user.
                string resultQuery = @"
                    SELECT
                        ER.EXAM_ID,
                        ER.SCORE,
                        ER.TOTAL_MARKS,
                        ER.SELECTED_ANSWERS,
                        E.EXAM_TITLE
                    FROM dbo.EXAM_RESULTS AS ER
                    INNER JOIN dbo.USERS AS U
                        ON U.ID = ER.USER_ID
                    INNER JOIN dbo.EXAMS AS E
                        ON E.EXAM_ID = ER.EXAM_ID
                    WHERE ER.RESULT_ID = @ResultID
                      AND U.EMAIL = @Email";

                using (SqlCommand cmd = new SqlCommand(resultQuery, con))
                {
                    cmd.Parameters.Add(
                        "@ResultID", SqlDbType.Int).Value = resultId;

                    cmd.Parameters.Add(
                        "@Email", SqlDbType.NVarChar, 256).Value = email;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            ShowError(
                                "Result not found, or you do not have permission to view it.");
                            return;
                        }

                        examId = Convert.ToInt32(reader["EXAM_ID"]);
                        score = Convert.ToInt32(reader["SCORE"]);
                        totalMarks = Convert.ToInt32(reader["TOTAL_MARKS"]);
                        examTitle = Convert.ToString(reader["EXAM_TITLE"]);

                        answersJson =
                            reader["SELECTED_ANSWERS"] == DBNull.Value
                            ? null
                            : Convert.ToString(reader["SELECTED_ANSWERS"]);
                    }
                }

                // Deserialize the previously saved answers.
                Dictionary<string, string> selectedAnswers =
                    new Dictionary<string, string>();

                if (!string.IsNullOrWhiteSpace(answersJson))
                {
                    try
                    {
                        JavaScriptSerializer serializer =
                            new JavaScriptSerializer();

                        selectedAnswers =
                            serializer.Deserialize<Dictionary<string, string>>(
                                answersJson);

                        if (selectedAnswers == null)
                        {
                            selectedAnswers =
                                new Dictionary<string, string>();
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Trace.TraceError(
                            "Could not read saved answers for RESULT_ID " +
                            resultId + ": " + ex);

                        ShowError(
                            "The saved answers for this result could not be read.");
                        return;
                    }
                }

                // Prepare the question review data.
                DataTable reviewTable = new DataTable();

                reviewTable.Columns.Add("QUESTION_NUMBER", typeof(int));
                reviewTable.Columns.Add("QUESTION_ID", typeof(int));
                reviewTable.Columns.Add("QUESTION_TEXT", typeof(string));
                reviewTable.Columns.Add("OPTION_A", typeof(string));
                reviewTable.Columns.Add("OPTION_B", typeof(string));
                reviewTable.Columns.Add("OPTION_C", typeof(string));
                reviewTable.Columns.Add("OPTION_D", typeof(string));
                reviewTable.Columns.Add("SELECTED_OPTION", typeof(string));
                reviewTable.Columns.Add("CORRECT_OPTION", typeof(string));

                string questionQuery = @"
                    SELECT
                        Q_ID,
                        Q_TEXT,
                        OPTION_A,
                        OPTION_B,
                        OPTION_C,
                        OPTION_D,
                        CORRECT_OPTION
                    FROM dbo.QUESTIONS
                    WHERE E_ID = @ExamID
                    ORDER BY Q_ID";

                int questionNumber = 0;

                using (SqlCommand cmd = new SqlCommand(questionQuery, con))
                {
                    cmd.Parameters.Add(
                        "@ExamID", SqlDbType.Int).Value = examId;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int questionId =
                                Convert.ToInt32(reader["Q_ID"]);

                            string questionKey = questionId.ToString(
                                CultureInfo.InvariantCulture);

                            string selected = null;
                            string savedOption;

                            if (selectedAnswers.TryGetValue(
                                questionKey, out savedOption)
                                && !string.IsNullOrWhiteSpace(savedOption))
                            {
                                savedOption = savedOption
                                    .Trim()
                                    .ToUpperInvariant();

                                if (savedOption == "A" ||
                                    savedOption == "B" ||
                                    savedOption == "C" ||
                                    savedOption == "D")
                                {
                                    selected = savedOption;
                                }
                            }

                            string correct =
                                reader["CORRECT_OPTION"] == DBNull.Value
                                ? ""
                                : Convert.ToString(
                                    reader["CORRECT_OPTION"])
                                    .Trim()
                                    .ToUpperInvariant();

                            DataRow row = reviewTable.NewRow();

                            row["QUESTION_NUMBER"] = ++questionNumber;
                            row["QUESTION_ID"] = questionId;

                            row["QUESTION_TEXT"] =
                                GetDatabaseText(reader["Q_TEXT"]);

                            row["OPTION_A"] =
                                GetDatabaseText(reader["OPTION_A"]);

                            row["OPTION_B"] =
                                GetDatabaseText(reader["OPTION_B"]);

                            row["OPTION_C"] =
                                GetDatabaseText(reader["OPTION_C"]);

                            row["OPTION_D"] =
                                GetDatabaseText(reader["OPTION_D"]);

                            row["SELECTED_OPTION"] =
                                selected ?? "";

                            row["CORRECT_OPTION"] = correct;

                            reviewTable.Rows.Add(row);
                        }
                    }
                }

                if (questionNumber == 0)
                {
                    ShowError("No questions were found for this exam.");
                    return;
                }

                // Populate the ASPX controls.
                lblExamTitle.Text = examTitle;
                lblScore.Text = score + " / " + totalMarks;
                lblCorrectCount.Text = score + " / " + totalMarks;

                rptQuestions.DataSource = reviewTable;
                rptQuestions.DataBind();

                pnlResult.Visible = true;
                lblMessage.Visible = false;
            }
        }

        private string GetDatabaseText(object value)
        {
            return value == DBNull.Value
                ? ""
                : Convert.ToString(value);
        }

        protected string GetOptionCss(
            object selectedValue,
            object correctValue,
            string option)
        {
            string selected = Convert.ToString(selectedValue);
            string correct = Convert.ToString(correctValue);

            bool isSelected = selected == option;
            bool isCorrect = correct == option;

            if (isSelected && isCorrect)
                return "vr-answer selected correct";

            if (isCorrect)
                return "vr-answer correct";

            if (isSelected)
                return "vr-answer selected";

            return "vr-answer";
        }

        protected string GetOptionBadge(
            object selectedValue,
            object correctValue,
            string option)
        {
            string selected = Convert.ToString(selectedValue);
            string correct = Convert.ToString(correctValue);

            bool isSelected = selected == option;
            bool isCorrect = correct == option;

            if (isSelected && isCorrect)
            {
                return "<span class=\"vr-answer-badge\">Your answer · Correct</span>";
            }

            if (isSelected)
            {
                return "<span class=\"vr-answer-badge selected-badge\">Your answer</span>";
            }

            if (isCorrect)
            {
                return "<span class=\"vr-answer-badge\">Correct answer</span>";
            }

            return "";
        }

        protected string GetFeedbackCss(
            object selectedValue,
            object correctValue)
        {
            string selected = Convert.ToString(selectedValue);
            string correct = Convert.ToString(correctValue);

            if (string.IsNullOrEmpty(selected))
                return "vr-feedback vr-feedback-unanswered";

            if (selected == correct)
                return "vr-feedback vr-feedback-right";

            return "vr-feedback vr-feedback-wrong";
        }

        protected string GetFeedbackIcon(
            object selectedValue,
            object correctValue)
        {
            string selected = Convert.ToString(selectedValue);
            string correct = Convert.ToString(correctValue);

            if (string.IsNullOrEmpty(selected))
                return "○";

            return selected == correct ? "✓" : "✕";
        }

        protected string GetFeedbackTitle(
            object selectedValue,
            object correctValue)
        {
            string selected = Convert.ToString(selectedValue);
            string correct = Convert.ToString(correctValue);

            if (string.IsNullOrEmpty(selected))
                return "Not answered";

            return selected == correct
                ? "Correct answer!"
                : "Incorrect answer";
        }

        protected string GetFeedbackText(
            object selectedValue,
            object correctValue)
        {
            string selected = Convert.ToString(selectedValue);
            string correct = Convert.ToString(correctValue);

            if (string.IsNullOrEmpty(selected))
            {
                return "You did not select an option. " +
                       "The correct answer is " + correct + ".";
            }

            if (selected == correct)
            {
                return "You selected the correct option: " +
                       correct + ".";
            }

            return "You selected " + selected +
                   ". The correct option is " + correct + ".";
        }

        private void ShowError(string message)
        {
            pnlResult.Visible = false;
            lblMessage.Text = HttpUtility.HtmlEncode(message);
            lblMessage.Visible = true;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}