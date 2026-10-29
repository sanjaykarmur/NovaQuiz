<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="manageExams.aspx.cs" Inherits="NovaQuiz_3.manageExams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <style>
        /* ======================================
       NovaQuiz - Manage Exams
       ====================================== */

        .manage-exams-page,
        .manage-exams-page * {
            box-sizing: border-box;
        }

        .manage-exams-page {
            min-height: 75vh;
            padding: 48px 24px 70px;
            color: #1c2540;
            background: radial-gradient(circle at 8% 0%, rgba(99,102,241,.07), transparent 28%), #f6f7fc;
        }

        .manage-exams-container {
            width: 100%;
            max-width: 1240px;
            margin: 0 auto;
        }

        /* Page heading */

        .manage-exams-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 24px;
            margin-bottom: 30px;
        }

        .manage-exams-eyebrow {
            display: inline-block;
            margin-bottom: 11px;
            color: #6258df;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.7px;
            text-transform: uppercase;
        }

        .manage-exams-heading h1 {
            margin: 0 0 10px;
            color: #18213b;
            font-size: clamp(27px, 3vw, 36px);
            font-weight: 800;
            letter-spacing: -1.2px;
            line-height: 1.2;
        }

        .manage-exams-heading p {
            margin: 0;
            color: #7d869d;
            font-size: 14px;
            line-height: 1.7;
        }

        .manage-exams-back {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            gap: 9px;
            flex-shrink: 0;
            padding: 12px 17px;
            border: 1px solid #e0e4f0;
            border-radius: 10px;
            background: #fff;
            color: #343d59;
            font-size: 12px;
            font-weight: 750;
            text-decoration: none;
            transition: .2s ease;
        }

            .manage-exams-back:hover {
                color: #5147d4;
                border-color: #c9c5ff;
                background: #f9f8ff;
                transform: translateY(-1px);
            }

        /* Table panel */

        .manage-exams-panel {
            overflow: hidden;
            border: 1px solid #e6e9f2;
            border-radius: 17px;
            background: #fff;
            box-shadow: 0 12px 35px rgba(35,45,85,.055);
        }

        .manage-exams-panel-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            padding: 23px 25px;
            border-bottom: 1px solid #edf0f6;
        }

            .manage-exams-panel-heading h2 {
                margin: 0 0 6px;
                color: #202943;
                font-size: 17px;
                font-weight: 800;
            }

            .manage-exams-panel-heading p {
                margin: 0;
                color: #8991a5;
                font-size: 12px;
                line-height: 1.6;
            }

        .manage-exams-panel-label {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 8px 11px;
            border: 1px solid #e5e3ff;
            border-radius: 8px;
            background: #f4f3ff;
            color: #584bd3;
            font-size: 10px;
            font-weight: 800;
            white-space: nowrap;
        }

            .manage-exams-panel-label::before {
                content: "";
                width: 7px;
                height: 7px;
                border-radius: 50%;
                background: #7165e8;
            }

        /* Responsive table wrapper */

        .manage-exams-table-wrap {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        .manage-exams-grid {
            width: 100%;
            min-width: 850px;
            margin: 0;
            border: 0;
            border-collapse: separate;
            border-spacing: 0;
            background: #fff;
        }

            .manage-exams-grid th {
                padding: 16px 17px;
                border: 0;
                border-bottom: 1px solid #e9ecf4;
                background: #f8f9fd;
                color: #788198;
                text-align: left;
                font-size: 10px;
                font-weight: 800;
                letter-spacing: .8px;
                text-transform: uppercase;
                white-space: nowrap;
            }

            .manage-exams-grid td {
                padding: 17px;
                border: 0;
                border-bottom: 1px solid #edf0f6;
                background: #fff;
                color: #39435d;
                font-size: 13px;
                vertical-align: middle;
                white-space: nowrap;
            }

            .manage-exams-grid tr:last-child td {
                border-bottom: 0;
            }

            .manage-exams-grid tr:hover td {
                background: #fafaff;
            }

            /* Published checkbox */

            .manage-exams-grid input[type="checkbox"] {
                width: 17px;
                height: 17px;
                margin: 0;
                accent-color: #6258df;
                cursor: default;
                vertical-align: middle;
            }

            /* Edit and other standard GridView links */

            .manage-exams-grid a {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 9px 13px;
                border: 1px solid #dce5ff;
                border-radius: 8px;
                background: #eff4ff;
                color: #365ec9;
                font-size: 11px;
                font-weight: 800;
                text-decoration: none;
                transition: .2s ease;
            }

                .manage-exams-grid a:hover {
                    border-color: #bacdff;
                    background: #e2ebff;
                    transform: translateY(-1px);
                }

                /* Update exam button */

                .manage-exams-grid a.update-exam-btn {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    padding: 9px 13px;
                    border: 1px solid #ccefe0;
                    border-radius: 8px;
                    background: #edfbf4;
                    color: #158354;
                    font-size: 11px;
                    font-weight: 800;
                    text-decoration: none;
                    white-space: nowrap;
                    transition: .2s ease;
                }

                    .manage-exams-grid a.update-exam-btn:hover {
                        border-color: #a4e2c7;
                        background: #dff8eb;
                        color: #116b46;
                        transform: translateY(-1px);
                    }

                /* ======================================
       REMOVE / DELETE EXAM BUTTON
       Works with LinkButton and Button controls
       ====================================== */

                .manage-exams-grid a.delete-btn,
                .manage-exams-grid a.delete-btn:link,
                .manage-exams-grid a.delete-btn:visited,
                .manage-exams-grid input.delete-btn,
                .manage-exams-grid button.delete-btn {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    padding: 9px 14px;
                    border: 1px solid #fecaca !important;
                    border-radius: 8px;
                    background: #fee2e2 !important;
                    color: #b91c1c !important;
                    font-family: inherit;
                    font-size: 11px;
                    font-weight: 800;
                    line-height: 1.4;
                    text-decoration: none !important;
                    white-space: nowrap;
                    cursor: pointer;
                    box-shadow: none;
                    opacity: 1 !important;
                    transition: background .2s ease, color .2s ease, border-color .2s ease, transform .2s ease;
                }

                    .manage-exams-grid a.delete-btn:hover,
                    .manage-exams-grid input.delete-btn:hover,
                    .manage-exams-grid button.delete-btn:hover {
                        border-color: #dc2626 !important;
                        background: #dc2626 !important;
                        color: #ffffff !important;
                        box-shadow: 0 4px 10px rgba(220,38,38,.20);
                        transform: translateY(-1px);
                    }

                    .manage-exams-grid a.delete-btn:active,
                    .manage-exams-grid input.delete-btn:active,
                    .manage-exams-grid button.delete-btn:active {
                        background: #b91c1c !important;
                        border-color: #b91c1c !important;
                        color: #ffffff !important;
                        transform: scale(.97);
                    }

                    .manage-exams-grid a.delete-btn:focus-visible,
                    .manage-exams-grid input.delete-btn:focus-visible,
                    .manage-exams-grid button.delete-btn:focus-visible {
                        outline: 3px solid rgba(220,38,38,.3);
                        outline-offset: 3px;
                    }

            /* Fallback for existing ButtonField / CommandField
       that renders an input[type=submit] */

            .manage-exams-grid input[type="submit"]:not(.delete-btn) {
                padding: 9px 13px;
                border: 1px solid #fecaca;
                border-radius: 8px;
                background: #fee2e2;
                color: #b91c1c;
                font-family: inherit;
                font-size: 11px;
                font-weight: 800;
                cursor: pointer;
                transition: .2s ease;
            }

                .manage-exams-grid input[type="submit"]:not(.delete-btn):hover {
                    border-color: #dc2626;
                    background: #dc2626;
                    color: #fff;
                    transform: translateY(-1px);
                }

            /* Empty GridView state */

            .manage-exams-grid td[colspan] {
                padding: 35px 18px;
                color: #858da1;
                text-align: center;
            }

        /* Responsive layout */

        @media (max-width: 650px) {
            .manage-exams-page {
                padding: 32px 13px 45px;
            }

            .manage-exams-heading {
                align-items: flex-start;
                flex-direction: column;
                gap: 17px;
                margin-bottom: 23px;
            }

                .manage-exams-heading h1 {
                    font-size: 28px;
                }

            .manage-exams-panel-heading {
                align-items: flex-start;
                flex-direction: column;
                padding: 19px;
            }

            .manage-exams-grid th,
            .manage-exams-grid td {
                padding: 14px 13px;
            }
        }

        /* Accessibility: respect reduced motion */

        @media (prefers-reduced-motion: reduce) {
            .manage-exams-back,
            .manage-exams-grid a,
            .manage-exams-grid input,
            .manage-exams-grid button {
                transition: none;
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


    <main class="manage-exams-page">
        <div class="manage-exams-container">

            <!-- Page heading -->
            <section class="manage-exams-heading">
                <div>
                    <span class="manage-exams-eyebrow">EXAMINATION MANAGEMENT
                    </span>

                    <h1>Manage Exams</h1>

                    <p>
                        View, edit, update, and remove examinations
                        from your NovaQuiz platform.
                    </p>
                </div>

                <a href="adminDashboard.aspx" class="manage-exams-back">
                    <span aria-hidden="true">←</span>
                    Back to Dashboard
                </a>
            </section>

            <!-- Exams table panel -->
            <section class="manage-exams-panel">

                <div class="manage-exams-panel-heading">
                    <div>
                        <h2>All Examinations</h2>
                        <p>
                            Manage exam details, publication status,
                            questions, and available actions.
                        </p>
                    </div>

                    <span class="manage-exams-panel-label">EXAM MANAGEMENT
                    </span>
                </div>

                <div class="manage-exams-table-wrap">

                    <!-- Keep your existing GridView -->
                    <asp:GridView ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="EXAM_ID"
                        DataSourceID="manageExamsds"
                        CssClass="manage-exams-grid">

                        <Columns>

                            <asp:BoundField
                                DataField="EXAM_ID"
                                HeaderText="EXAM ID"
                                InsertVisible="False"
                                ReadOnly="True"
                                SortExpression="EXAM_ID" />

                            <asp:BoundField
                                DataField="EXAM_TITLE"
                                HeaderText="EXAM TITLE"
                                SortExpression="EXAM_TITLE" />

                            <asp:BoundField
                                DataField="EXAM_MARKS"
                                HeaderText="TOTAL MARKS"
                                SortExpression="EXAM_MARKS" />

                            <asp:BoundField
                                DataField="TIME_LIMIT"
                                HeaderText="TIME LIMIT"
                                SortExpression="TIME_LIMIT" />

                            <asp:CheckBoxField
                                DataField="IS_PUBLISHED"
                                HeaderText="PUBLISHED"
                                SortExpression="IS_PUBLISHED" />

                            <asp:HyperLinkField
                                DataNavigateUrlFields="EXAM_ID"
                                DataNavigateUrlFormatString="editExam.aspx?examId={0}"
                                HeaderText="EDIT QUESTIONS"
                                Text="EDIT" />

                            <asp:TemplateField HeaderText="UPDATE EXAM">
                                <ItemTemplate>
                                    <asp:LinkButton
                                        ID="btnUpdateExam"
                                        runat="server"
                                        Text="UPDATE"
                                        CssClass="update-exam-btn"
                                        CausesValidation="false"
                                        PostBackUrl='<%# "addExam.aspx?examId=" + Eval("EXAM_ID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton
                                        ID="btnRemove"
                                        runat="server"
                                        Text="REMOVE"
                                        CssClass="delete-btn"
                                        CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this exam?');" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

            </section>

            <!-- Keep your existing data source and commands -->
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

        </div>
    </main>



</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">

    <!-- ===================== FOOTER ===================== -->

    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    </body>
</html>

</asp:Content>
