<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="exams.aspx.cs" Inherits="NovaQuiz_3.exams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
    .exams-title {
        text-align: center;
        margin: 45px 0 30px;
        font-size: 32px;
        font-weight: 800;
        color: var(--text);
        letter-spacing: -0.5px;
    }

    .exams-title::after {
        content: "";
        display: block;
        width: 55px;
        height: 4px;
        margin: 14px auto 0;
        border-radius: 10px;
        background: var(--grad-aurora);
    }

    #<%= GridView1.ClientID %> {
        width: 88%;
        max-width: 1050px;
        margin: 0 auto 70px;
        border-collapse: separate;
        border-spacing: 0;
        overflow: hidden;
        border: 1px solid var(--border);
        border-radius: 18px;
        background: var(--surface);
        box-shadow: 0 15px 45px rgba(0,0,0,0.08);
    }

    #<%= GridView1.ClientID %> th {
        padding: 18px 22px;
        background: var(--grad-aurora);
        color: #0A0D1A;
        font-size: 13px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 0.06em;
        text-align: left;
    }

    #<%= GridView1.ClientID %> td {
        padding: 20px 22px;
        background: var(--surface);
        color: var(--text);
        font-size: 15px;
        font-weight: 500;
        border-bottom: 1px solid var(--border);
        transition: 0.2s ease;
    }

    #<%= GridView1.ClientID %> tr:hover td {
        background: var(--surface-hover);
    }

    #<%= GridView1.ClientID %> td:first-child {
        font-size: 16px;
        font-weight: 700;
    }

    #<%= GridView1.ClientID %> input[type="submit"] {
        padding: 10px 22px;
        border: 0;
        border-radius: 10px;
        background: var(--grad-aurora);
        color: #0A0D1A;
        font-size: 13px;
        font-weight: 800;
        letter-spacing: 0.04em;
        cursor: pointer;
        transition: 0.2s ease;
    }

    #<%= GridView1.ClientID %> input[type="submit"]:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 22px rgba(124,111,240,0.3);
    }

    #<%= GridView1.ClientID %> tr:last-child td {
        border-bottom: none;
    }

    @media (max-width: 700px) {
        .exams-title {
            font-size: 25px;
            margin-top: 30px;
        }

        #<%= GridView1.ClientID %> {
            width: 94%;
            display: block;
            overflow-x: auto;
            white-space: nowrap;
        }
    }
</style>
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
                         <%--<asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-primary btn-sm" Click="btnLogout_Click" OnClick="btnLogout_Click" />--%>
                    </div>
                </div>
                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
 
                <h2 class="exams-title">Challenge yourslef, Start exam Now!</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EXAM_ID" DataSourceID="dsExams" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="EXAM_TITLE" HeaderText="EXAM" SortExpression="EXAM_TITLE" />
            <asp:BoundField DataField="EXAM_MARKS" HeaderText="TOTAL MARKS" SortExpression="EXAM_MARKS" />
            <asp:BoundField DataField="TIME_LIMIT" HeaderText="TIME LIMIT" SortExpression="TIME_LIMIT" />
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="READY?" SortExpression="EXAM_ID">

                <ItemTemplate>
                    <asp:Button ID="BtnStart" runat="server" CommandArgument='<%#Eval("EXAM_ID") %>' CommandName="StartExam" Text="START" />

                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="dsExams" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [EXAM_ID], [EXAM_TITLE], [EXAM_MARKS], [TIME_LIMIT] FROM [EXAMS] WHERE ([IS_PUBLISHED] = @IS_PUBLISHED)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="IS_PUBLISHED" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ===================== FOOTER ===================== -->


    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    </body>
</html>
</asp:Content>


