<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="exam.aspx.cs" Inherits="NovaQuiz_3.exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NovaQuiz — Online Examination Platform</title>
        <meta name="description" content="NovaQuiz is a modern online examination platform for timed practice tests, instant results and progress tracking.">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/exams.css">
        <style>
    .exam-title {
        text-align: center;
        margin: 45px 0 35px;
        font-size: 34px;
        font-weight: 800;
        color: var(--text);
    }

    .exam-title::after {
        content: "";
        display: block;
        width: 55px;
        height: 4px;
        margin: 14px auto 0;
        border-radius: 10px;
        background: var(--grad-aurora);
    }

    .questions-container {
        width: 100%;
        margin: 0 auto;
    }

    .question-card {
        width: min(650px, 90%);
        margin: 0 auto 20px;
        padding: 22px 24px;
        box-sizing: border-box;
        border: 1px solid var(--border);
        border-radius: 16px;
        background: var(--surface);
        box-shadow: 0 8px 24px rgba(0,0,0,0.07);
        transition: 0.25s ease;
    }

    .question-card:hover {
        transform: translateY(-2px);
        border-color: rgba(124,111,240,0.4);
        box-shadow: 0 12px 30px rgba(124,111,240,0.12);
    }

    .question-text {
        display: block;
        margin-bottom: 16px;
        color: var(--text);
        font-size: 17px;
        font-weight: 700;
        line-height: 1.4;
    }

    .question-option {
        display: block;
        width: 100%;
        box-sizing: border-box;
        padding: 11px 14px;
        margin: 7px 0;
        border: 1px solid var(--border);
        border-radius: 10px;
        background: var(--surface-hover);
        color: var(--text);
        cursor: pointer;
        transition: 0.2s ease;
    }

    .question-option:hover {
        border-color: rgba(124,111,240,0.5);
        background: rgba(124,111,240,0.08);
        transform: translateX(2px);
    }

    .question-option input[type="radio"] {
        accent-color: #7c6ff0;
        margin-right: 10px;
        cursor: pointer;
    }

    .question-option label {
        color: var(--text);
        cursor: pointer;
        font-size: 15px;
    }

    .submit-exam-btn {
        display: block;
        margin: 35px auto 70px;
        padding: 12px 30px;
        border: none;
        border-radius: 11px;
        background: var(--grad-aurora);
        color: #0A0D1A;
        font-size: 14px;
        font-weight: 800;
        cursor: pointer;
        box-shadow: 0 7px 20px rgba(124,111,240,0.22);
        transition: 0.2s ease;
    }

    .submit-exam-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 26px rgba(124,111,240,0.32);
    }

    .submit-exam-btn:active {
        transform: translateY(0);
    }

    @media (max-width: 700px) {
        .exam-title {
            font-size: 27px;
            margin-top: 30px;
        }

        .question-card {
            width: 94%;
            padding: 20px 17px;
        }

        .question-text {
            font-size: 16px;
        }
    }
</style>
       <script>
document.addEventListener("click", function (e) {
    var option = e.target.closest(".question-option");

    if (option) {
        var radio = option.querySelector("input[type='radio']");

        if (radio) {
            radio.checked = true;
        }
    }
});
</script>
    </head>
    <body>
        <div class="page-loader" aria-hidden="true">
            <div class="loader-ring">
            </div>
        </div>

        <!-- ===================== NAVBAR ===================== -->
        <header class="navbar">
            <div class="container nav-inner">
                <a href="index.aspx" class="nav-logo"><span class="logo-dot"></span>NovaQuiz</a>
                <nav class="nav-links" id="navLinks" aria-label="Primary">
                    <a href="index.aspx" data-page="index.aspx">Home</a> <a href="about.aspx" data-page="about.aspx">About</a> <a href="dashboard.aspx" data-page="dashboard.aspx">Dashboard</a> <a href="exams.aspx" data-page="exams.aspx">Exams</a> <a href="contact.aspx" data-page="contact.aspx">Contact Us</a>
                </nav>
                <div class="nav-actions">
                    <button class="theme-toggle" data-theme-toggle aria-label="Toggle dark and light mode">
                        <svg class="icon-moon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" />
                        </svg>
                        <svg class="icon-sun" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="4" />
                            <path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41" />
                        </svg>
                    </button>
                    <div id="authButtons" runat="server">
                       <%-- <a href="login.aspx" class="btn btn-ghost">Login</a> <a href="signup.aspx" class="btn btn-primary btn-sm">Sign Up</a>--%>
                         <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-primary btn-sm" Click="btnLogout_Click" OnClick="btnLogout_Click" />
                    </div>
                </div>
                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <%--Main--%>
    <h1>Your Exam</h1>


    <br>
    <br>

<asp:ListView ID="lvQuestions" runat="server" DataSourceID="DsQuestions">
    <ItemTemplate>

        <div class="question-card">

            <asp:Label ID="lblQuestion" runat="server"
                CssClass="question-text"
                Text='<%# Eval("Q_TEXT") %>' />

            <br />

            <asp:RadioButton ID="rbA" runat="server"
                CssClass="question-option"
                Text='<%# Eval("OPTION_A") %>'
                GroupName='<%# "Q" + Eval("Q_ID") %>' />

            <br />

            <asp:RadioButton ID="rbB" runat="server"
                CssClass="question-option"
                Text='<%# Eval("OPTION_B") %>'
                GroupName='<%# "Q" + Eval("Q_ID") %>' />

            <br />

            <asp:RadioButton ID="rbC" runat="server"
                CssClass="question-option"
                Text='<%# Eval("OPTION_C") %>'
                GroupName='<%# "Q" + Eval("Q_ID") %>' />

            <br />

            <asp:RadioButton ID="rbD" runat="server"
                CssClass="question-option"
                Text='<%# Eval("OPTION_D") %>'
                GroupName='<%# "Q" + Eval("Q_ID") %>' />

            <asp:HiddenField ID="hfCorrect" runat="server"
                Value='<%# Eval("CORRECT_OPTION") %>' />

        </div>

    </ItemTemplate>
</asp:ListView>
    <asp:SqlDataSource ID="DsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Q_ID], [OPTION_A], [E_ID], [Q_TEXT], [OPTION_B], [OPTION_C], [OPTION_D], [CORRECT_OPTION] FROM [QUESTIONS] WHERE ([E_ID] = @E_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="E_ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnSubmit" runat="server" CssClass="submit-exam-btn" Text="Submit" OnClick="btnSubmit_Click" />
</asp:Content>
<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ===================== FOOTER ===================== -->


    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    <script src="js/timer.js"></script>
    <script src="js/exams.js"></script>
    </body>
</html>
</asp:Content>
