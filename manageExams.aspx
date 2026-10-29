<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="manageExams.aspx.cs" Inherits="NovaQuiz_3.manageExams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* ================================
           NovaQuiz — Manage Exams
           ================================ */

        .manage-exams-grid {
            width: 92%;
            margin: 45px auto;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            border-radius: 16px;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.12);
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.18);
        }

            /* Table Header */
            .manage-exams-grid th {
                padding: 17px 18px;
                text-align: left;
                font-size: 12px;
                font-weight: 700;
                letter-spacing: 0.7px;
                text-transform: uppercase;
                background: rgba(255, 255, 255, 0.09);
                border-bottom: 1px solid rgba(255, 255, 255, 0.12);
                white-space: nowrap;
            }

            /* Table Cells */
            .manage-exams-grid td {
                padding: 16px 18px;
                font-size: 14px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.07);
                vertical-align: middle;
            }

            /* Row Hover */
            .manage-exams-grid tr:hover td {
                background: rgba(255, 255, 255, 0.045);
            }

            .manage-exams-grid tr:last-child td {
                border-bottom: none;
            }

            /* ================================
           EDIT Button
           ================================ */

            .manage-exams-grid a {
                display: inline-block;
                padding: 8px 16px;
                color: #8ab4ff;
                background: rgba(70, 120, 255, 0.12);
                border: 1px solid rgba(90, 140, 255, 0.25);
                border-radius: 8px;
                text-decoration: none;
                font-size: 12px;
                font-weight: 700;
                transition: 0.2s ease;
            }

                .manage-exams-grid a:hover {
                    background: rgba(70, 120, 255, 0.22);
                    transform: translateY(-1px);
                }

            /* ================================
           UPDATE / DELETE Buttons
           ================================ */

            .manage-exams-grid input[type="submit"] {
                padding: 8px 15px;
                border-radius: 8px;
                font-family: inherit;
                font-size: 12px;
                font-weight: 700;
                cursor: pointer;
                transition: 0.2s ease;
            }

            /* UPDATE */

            .manage-exams-grid input[value="UPDATE"] {
                color: #58d6a5;
                background: rgba(45, 200, 140, 0.10);
                border: 1px solid rgba(45, 200, 140, 0.25);
                padding: 10px;
                border-radius: 10px;
            }

                .manage-exams-grid input[value="UPDATE"]:hover {
                    background: rgba(45, 200, 140, 0.20);
                    transform: translateY(-1px);
                    padding: 10px;
                    border-radius: 10px;
                }

            /* REMOVE */

            .manage-exams-grid input[value="REMOVE"] {
                color: #ff7373;
                background: rgba(255, 70, 70, 0.10);
                border: 1px solid rgba(255, 70, 70, 0.25);
                padding: 10px;
                border-radius: 10px;
            }

                .manage-exams-grid input[value="REMOVE"]:hover {
                    background: rgba(255, 70, 70, 0.20);
                    transform: translateY(-1px);
                    padding: 10px;
                    border-radius: 10px;
                }


            .manage-exams-grid input[type="checkbox"] {
                width: 17px;
                height: 17px;
                cursor: pointer;
                accent-color: #7c8cff;
            }


        @media (max-width: 800px) {

            .manage-exams-grid {
                width: 96%;
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }
    </style>

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
                    <a href="index.aspx" data-page="index.aspx">Home</a>
                    <a href="adminDashboard.aspx" data-page="adminDashboard.aspx">Admin Dashboard</a>
                    <a href="addExam.aspx" data-page="AddExam.aspx">Add Exam</a>
                    <a href="manageExams.aspx" data-page="manageExams.aspx">Manage Exams</a>
                    <a href="manageUsers.aspx" data-page="manageUsers.aspx">Manage Users</a>
                </nav>
                <div class="nav-actions">
                    <div id="authButtons" runat="server">
                        <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-primary btn-sm" Click="btnLogout_Click" OnClick="btnLogout_Click" />
                    </div>
                </div>
                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <asp:GridView ID="GridView1"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="EXAM_ID"
        DataSourceID="manageExamsds"
        CssClass="manage-exams-grid">

        <Columns>

            <asp:BoundField DataField="EXAM_ID" HeaderText="EXAM_ID" InsertVisible="False" ReadOnly="True" SortExpression="EXAM_ID" />

            <asp:BoundField DataField="EXAM_TITLE" HeaderText="EXAM_TITLE" SortExpression="EXAM_TITLE" />

            <asp:BoundField DataField="EXAM_MARKS" HeaderText="EXAM_MARKS" SortExpression="EXAM_MARKS" />

            <asp:BoundField DataField="TIME_LIMIT" HeaderText="TIME_LIMIT" SortExpression="TIME_LIMIT" />

            <asp:CheckBoxField DataField="IS_PUBLISHED" HeaderText="IS_PUBLISHED" SortExpression="IS_PUBLISHED" />

            <asp:HyperLinkField
                DataNavigateUrlFields="EXAM_ID"
                DataNavigateUrlFormatString="editExam.aspx?examId={0}"
                HeaderText="EDIT QUESTIONS"
                Text="EDIT" />

            <asp:ButtonField
                ButtonType="Button"
                CommandName="Update"
                HeaderText="UPDATE EXAM"
                ShowHeader="True"
                Text="UPDATE" />

            <asp:ButtonField
                ButtonType="Button"
                CommandName="Delete"
                HeaderText="DELETE"
                ShowHeader="True"
                Text="REMOVE" />

        </Columns>

    </asp:GridView>

    <asp:SqlDataSource
        ID="manageExamsds"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [EXAM_ID], [EXAM_TITLE], [EXAM_MARKS], [TIME_LIMIT], [IS_PUBLISHED] FROM [EXAMS]"
        DeleteCommand="DELETE FROM [EXAMS] WHERE [EXAM_ID] = @EXAM_ID"
        InsertCommand="INSERT INTO [EXAMS] ([EXAM_TITLE], [EXAM_MARKS], [TIME_LIMIT], [IS_PUBLISHED]) VALUES (@EXAM_TITLE, @EXAM_MARKS, @TIME_LIMIT, @IS_PUBLISHED)"
        UpdateCommand="UPDATE [EXAMS] SET [EXAM_TITLE] = @EXAM_TITLE, [EXAM_MARKS] = @EXAM_MARKS, [TIME_LIMIT] = @TIME_LIMIT, [IS_PUBLISHED] = @IS_PUBLISHED WHERE [EXAM_ID] = @EXAM_ID">

        <DeleteParameters>
            <asp:Parameter Name="EXAM_ID" Type="Int32" />
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="EXAM_TITLE" Type="String" />
            <asp:Parameter Name="EXAM_MARKS" Type="Int32" />
            <asp:Parameter Name="TIME_LIMIT" Type="Int32" />
            <asp:Parameter Name="IS_PUBLISHED" Type="Boolean" />
        </InsertParameters>

        <UpdateParameters>
            <asp:Parameter Name="EXAM_TITLE" Type="String" />
            <asp:Parameter Name="EXAM_MARKS" Type="Int32" />
            <asp:Parameter Name="TIME_LIMIT" Type="Int32" />
            <asp:Parameter Name="IS_PUBLISHED" Type="Boolean" />
            <asp:Parameter Name="EXAM_ID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>

</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">

    <!-- ===================== FOOTER ===================== -->

    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    </body>
</html>

</asp:Content>
