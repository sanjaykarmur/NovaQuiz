<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="editExam.aspx.cs" Inherits="NovaQuiz_3.editExam" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ======================================
           NovaQuiz - Edit Exam Questions
           ====================================== */

        .edit-exam-page,
        .edit-exam-page * {
            box-sizing: border-box;
        }

        .edit-exam-page {
            min-height: 75vh;
            padding: 42px 24px 70px;
            color: #26314d;
            background: radial-gradient(circle at 8% 0%, rgba(99,102,241,.07), transparent 28%), #f6f7fc;
        }

        .edit-exam-container {
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
        }

        /* Page heading */

        .edit-exam-heading {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 30px;
        }

        .edit-exam-eyebrow {
            display: inline-block;
            margin-bottom: 10px;
            color: #6258df;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 1.5px;
            text-transform: uppercase;
        }

        .edit-exam-header h1 {
            margin: 0;
            color: #18213b;
            font-size: clamp(27px, 3vw, 36px);
            font-weight: 800;
            letter-spacing: -1px;
            line-height: 1.2;
        }

        .edit-exam-header p {
            margin: 10px 0 0;
            color: #7d869d;
            font-size: 14px;
            line-height: 1.7;
        }

        .edit-exam-back {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            flex-shrink: 0;
            padding: 12px 16px;
            border: 1px solid #e0e4f0;
            border-radius: 10px;
            background: #fff;
            color: #343d59;
            font-size: 12px;
            font-weight: 750;
            text-decoration: none;
            transition: .2s ease;
        }

            .edit-exam-back:hover {
                border-color: #c9c5ff;
                background: #f9f8ff;
                color: #5147d4;
                transform: translateY(-1px);
            }

        /* Intro information */

        .edit-exam-info {
            display: flex;
            align-items: flex-start;
            gap: 13px;
            margin-bottom: 25px;
            padding: 17px 19px;
            border: 1px solid #e4e5ff;
            border-radius: 13px;
            background: #f0efff;
        }

        .edit-exam-info-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            flex: 0 0 34px;
            width: 34px;
            height: 34px;
            border-radius: 10px;
            background: #e1dfff;
            color: #5548d5;
            font-size: 17px;
            font-weight: 800;
        }

        .edit-exam-info strong {
            display: block;
            margin-bottom: 4px;
            color: #34306e;
            font-size: 13px;
        }

        .edit-exam-info p {
            margin: 0;
            color: #696b96;
            font-size: 12px;
            line-height: 1.7;
        }

        /* Question list */

        .question-list {
            display: flex;
            flex-direction: column;
            gap: 22px;
        }

        .question-card {
            overflow: hidden;
            border: 1px solid #e6e9f2;
            border-radius: 17px;
            background: #fff;
            box-shadow: 0 10px 30px rgba(35,45,85,.045);
            transition: border-color .2s ease, box-shadow .2s ease;
        }

            .question-card:hover {
                border-color: #d8d5ff;
                box-shadow: 0 13px 35px rgba(35,45,85,.07);
            }

        /* Question card header */

        .question-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            padding: 19px 24px;
            border-bottom: 1px solid #edf0f6;
            background: #fafaff;
        }

        .question-card-title {
            color: #222c48;
            font-size: 14px;
            font-weight: 800;
        }

        .question-meta-badges {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 8px;
        }

        .meta-item {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 7px 10px;
            border: 1px solid #e3e5f5;
            border-radius: 8px;
            background: #fff;
            color: #555d7a;
            font-size: 11px;
            font-weight: 700;
        }

        .meta-label {
            color: #8991a5;
            font-weight: 600;
        }

        /* Card content */

        .question-card-body {
            padding: 24px;
        }

        .field {
            margin-bottom: 23px;
        }

        .field-title,
        .options-title {
            display: block;
            margin-bottom: 9px;
            color: #38415e;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: .4px;
        }

        .current-label,
        .update-label {
            display: block;
            margin-bottom: 7px;
            color: #8991a5;
            font-size: 11px;
            font-weight: 700;
        }

        .current-value {
            display: block;
            width: 100%;
            min-height: 39px;
            margin-bottom: 13px;
            padding: 10px 12px;
            overflow-wrap: anywhere;
            border: 1px solid #edf0f6;
            border-radius: 8px;
            background: #f8f9fd;
            color: #737d96;
            font-size: 13px;
            line-height: 1.6;
        }

        /* Editable text inputs */

        .question-card input[type="text"] {
            display: block;
            width: 100%;
            min-height: 43px;
            padding: 11px 13px;
            border: 1px solid #dfe4f0;
            border-radius: 9px;
            background: #fff;
            color: #26314d;
            font-family: inherit;
            font-size: 13px;
            line-height: 1.5;
            outline: none;
            transition: border-color .2s ease, box-shadow .2s ease, background .2s ease;
        }

            .question-card input[type="text"]:focus {
                border-color: #8b83f5;
                background: #fdfdff;
                box-shadow: 0 0 0 3px rgba(99,102,241,.11);
            }

            .question-card input[type="text"]::placeholder {
                color: #a3aabd;
            }

        /* Answer options */

        .options-title {
            margin: 27px 0 15px;
            padding-bottom: 12px;
            border-bottom: 1px solid #edf0f6;
            font-size: 13px;
        }

        .option {
            margin-bottom: 15px;
            padding: 16px;
            border: 1px solid #edf0f6;
            border-radius: 12px;
            background: #fcfcff;
        }

            .option:last-of-type {
                margin-bottom: 0;
            }

        .option-name {
            display: flex;
            align-items: center;
            gap: 9px;
            margin-bottom: 15px;
            color: #38415e;
            font-size: 12px;
            font-weight: 800;
        }

        .option-letter {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            flex: 0 0 29px;
            width: 29px;
            height: 29px;
            border: 1px solid #e1dfff;
            border-radius: 8px;
            background: #f0efff;
            color: #6258df;
            font-size: 12px;
            font-weight: 800;
        }

        /* Correct answer section */

        .answer-section {
            margin-top: 24px;
            padding: 19px;
            border: 1px solid #ccefe0;
            border-radius: 13px;
            background: #f3fcf7;
        }

        .answer-title {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 16px;
            color: #158354;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: .5px;
        }

        .answer-status-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 25px;
            height: 25px;
            border-radius: 7px;
            background: #d9f5e6;
            color: #158354;
            font-size: 14px;
        }

        .answer-section .current-value {
            border-color: #dcefe5;
            background: #fff;
        }

        .correct-option {
            display: block;
            width: 100%;
            min-height: 44px;
            padding: 11px 13px;
            border: 1px solid #a8dfc3;
            border-radius: 9px;
            background: #fff;
            color: #166b49;
            font-family: inherit;
            font-size: 13px;
            font-weight: 700;
            outline: none;
            cursor: pointer;
        }

            .correct-option:focus {
                border-color: #32ad77;
                box-shadow: 0 0 0 3px rgba(45,200,140,.12);
            }

            .correct-option option {
                background: #fff;
                color: #26314d;
            }

        .answer-help {
            display: block;
            margin-top: 9px;
            color: #648574;
            font-size: 11px;
            line-height: 1.6;
        }

        /* Save changes panel */

        .apply-edit-wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
            margin-top: 26px;
            padding: 22px 24px;
            border: 1px solid #e6e9f2;
            border-radius: 14px;
            background: #fff;
            box-shadow: 0 8px 25px rgba(35,45,85,.035);
        }

        .save-info strong {
            display: block;
            margin-bottom: 5px;
            color: #28324d;
            font-size: 13px;
        }

        .save-info span {
            color: #8991a5;
            font-size: 12px;
            line-height: 1.6;
        }

        .apply-edit-button {
            min-width: 165px;
            min-height: 45px;
            padding: 12px 20px;
            border: 1px solid #574bd5;
            border-radius: 10px;
            background: #6258df;
            color: #fff;
            font-family: inherit;
            font-size: 12px;
            font-weight: 800;
            cursor: pointer;
            box-shadow: 0 5px 12px rgba(98,88,223,.16);
            transition: background .2s ease, box-shadow .2s ease, transform .2s ease;
        }

            .apply-edit-button:hover {
                border-color: #4f46c6;
                background: #5147d4;
                box-shadow: 0 7px 16px rgba(98,88,223,.24);
                transform: translateY(-1px);
            }

            .apply-edit-button:active {
                transform: translateY(0);
            }

            .apply-edit-button:focus-visible,
            .edit-exam-back:focus-visible {
                outline: 3px solid rgba(99,102,241,.25);
                outline-offset: 3px;
            }

        /* Empty question list */

        .question-list:empty::after {
            content: "No questions were found for this exam.";
            display: block;
            padding: 35px 20px;
            border: 1px solid #e6e9f2;
            border-radius: 14px;
            background: #fff;
            color: #7d869d;
            text-align: center;
            font-size: 13px;
        }

        /* Responsive layout */

        @media (max-width: 700px) {
            .edit-exam-page {
                padding: 30px 14px 45px;
            }

            .edit-exam-heading {
                flex-direction: column;
                align-items: flex-start;
                gap: 17px;
            }

            .edit-exam-header h1 {
                font-size: 28px;
            }

            .question-meta {
                align-items: flex-start;
                flex-direction: column;
                padding: 17px;
            }

            .question-card-body {
                padding: 17px;
            }

            .option {
                padding: 13px;
            }

            .answer-section {
                padding: 15px;
            }

            .apply-edit-wrapper {
                align-items: stretch;
                flex-direction: column;
                padding: 18px;
            }

            .apply-edit-button {
                width: 100%;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .question-card,
            .edit-exam-back,
            .question-card input[type="text"],
            .correct-option,
            .apply-edit-button {
                transition: none;
            }
        }
    </style>
</asp:Content>


<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>NovaQuiz — Online Examination Platform</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="page-loader" aria-hidden="true">
            <div class="loader-ring"></div>
        </div>

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
                    <%--   <button class="theme-toggle" data-theme-toggle aria-label="Toggle dark and light mode">
                        <svg class="icon-moon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" />
                        </svg>
                        <svg class="icon-sun" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="4" />
                            <path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41-1.41" />
                        </svg>
                    </button>

                    --%> <div id="authButtons" runat="server">
                        <a href="login.aspx" class="btn btn-ghost">Login</a>
                        <a href="signup.aspx" class="btn btn-primary btn-sm">Sign Up</a>
                    </div>
                </div>

                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false"><span></span></button>
            </div>
        </header>
    </body>
    </html>
</asp:Content>


<asp:Content ID="Content6" runat="server"
    ContentPlaceHolderID="ContentPlaceHolder2">

    <main class="edit-exam-page">
        <div class="edit-exam-container">

            <!-- Page heading -->
            <div class="edit-exam-heading">
                <div class="edit-exam-header">
                    <span class="edit-exam-eyebrow">NovaQuiz Administration</span>
                    <h1>Edit Exam Questions</h1>
                    <p>
                        Update question text, answer options, and correct answers
                        for this examination.
                    </p>
                </div>

                <a href="manageExams.aspx" class="edit-exam-back">
                    <span aria-hidden="true">&#8592;</span>
                    Back to Exams
                </a>
            </div>

            <!-- Information panel -->
            <div class="edit-exam-info">
                <div class="edit-exam-info-icon" aria-hidden="true">i</div>
                <div>
                    <strong>Editing examination questions</strong>
                    <p>
                        Review each question below, make your changes in the
                        Update fields, and click Apply Changes to save them.
                        Select A, B, C, or D as the correct answer.
                    </p>
                </div>
            </div>

            <!-- Question cards -->
            <div class="question-list">

                <asp:ListView ID="ListView1" runat="server"
                    DataKeyNames="Q_ID"
                    DataSourceID="editQuestionDataSource">

                    <ItemTemplate>

                        <section class="question-card">

                            <!-- Question header -->
                            <div class="question-meta">

                                <div class="question-card-title">
                                    Question Details
                                </div>

                                <div class="question-meta-badges">
                                    <span class="meta-item">
                                        <span class="meta-label">Question ID:</span>
                                        <asp:Label ID="Q_IDLabel"
                                            runat="server"
                                            Text='<%# Eval("Q_ID") %>' />
                                    </span>

                                    <span class="meta-item">
                                        <span class="meta-label">Exam ID:</span>
                                        <asp:Label ID="E_IDLabel"
                                            runat="server"
                                            Text='<%# Eval("E_ID") %>' />
                                    </span>
                                </div>

                            </div>

                            <div class="question-card-body">

                                <!-- Question text -->
                                <div class="field">

                                    <span class="field-title">Question Text
                                    </span>

                                    <span class="current-label">Current value</span>

                                    <asp:Label ID="Q_TEXTLabel"
                                        runat="server"
                                        CssClass="current-value"
                                        Text='<%# Eval("Q_TEXT") %>' />

                                    <span class="update-label">Enter updated question
                                    </span>

                                    <asp:TextBox ID="Q_TEXTTextBox"
                                        runat="server"
                                        Text='<%# Eval("Q_TEXT") %>'
                                        MaxLength="2000" />

                                </div>

                                <!-- Answer options -->
                                <div class="options-title">
                                    Answer Options
                                </div>

                                <!-- Option A -->
                                <div class="option">

                                    <div class="option-name">
                                        <span class="option-letter">A</span>
                                        Option A
                                    </div>

                                    <span class="current-label">Current value</span>

                                    <asp:Label ID="OPTION_ALabel"
                                        runat="server"
                                        CssClass="current-value"
                                        Text='<%# Eval("OPTION_A") %>' />

                                    <span class="update-label">Updated value</span>

                                    <asp:TextBox ID="OPTION_ATextBox"
                                        runat="server"
                                        Text='<%# Eval("OPTION_A") %>'
                                        MaxLength="500" />

                                </div>

                                <!-- Option B -->
                                <div class="option">

                                    <div class="option-name">
                                        <span class="option-letter">B</span>
                                        Option B
                                    </div>

                                    <span class="current-label">Current value</span>

                                    <asp:Label ID="OPTION_BLabel"
                                        runat="server"
                                        CssClass="current-value"
                                        Text='<%# Eval("OPTION_B") %>' />

                                    <span class="update-label">Updated value</span>

                                    <asp:TextBox ID="OPTION_BTextBox"
                                        runat="server"
                                        Text='<%# Eval("OPTION_B") %>'
                                        MaxLength="500" />

                                </div>

                                <!-- Option C -->
                                <div class="option">

                                    <div class="option-name">
                                        <span class="option-letter">C</span>
                                        Option C
                                    </div>

                                    <span class="current-label">Current value</span>

                                    <asp:Label ID="OPTION_CLabel"
                                        runat="server"
                                        CssClass="current-value"
                                        Text='<%# Eval("OPTION_C") %>' />

                                    <span class="update-label">Updated value</span>

                                    <asp:TextBox ID="OPTION_CTextBox"
                                        runat="server"
                                        Text='<%# Eval("OPTION_C") %>'
                                        MaxLength="500" />

                                </div>

                                <!-- Option D -->
                                <div class="option">

                                    <div class="option-name">
                                        <span class="option-letter">D</span>
                                        Option D
                                    </div>

                                    <span class="current-label">Current value</span>

                                    <asp:Label ID="OPTION_DLabel"
                                        runat="server"
                                        CssClass="current-value"
                                        Text='<%# Eval("OPTION_D") %>' />

                                    <span class="update-label">Updated value</span>

                                    <asp:TextBox ID="OPTION_DTextBox"
                                        runat="server"
                                        Text='<%# Eval("OPTION_D") %>'
                                        MaxLength="500" />

                                </div>

                                <!-- Correct answer -->
                                <div class="answer-section">

                                    <div class="answer-title">
                                        <span class="answer-status-icon"
                                            aria-hidden="true">&#10003;</span>
                                        Correct Answer
                                    </div>

                                    <span class="current-label">Current correct answer
                                    </span>

                                    <asp:Label ID="CORRECT_OPTIONLabel"
                                        runat="server"
                                        CssClass="current-value"
                                        Text='<%# Eval("CORRECT_OPTION") %>' />

                                    <span class="update-label">Select the correct option
                                    </span>

                                    <asp:DropDownList
                                        ID="CorrectOptionDropDownList"
                                        runat="server"
                                        SelectedValue='<%# Eval("CORRECT_OPTION") %>'
                                        CssClass="correct-option">

                                        <asp:ListItem Value="A">A - Option A</asp:ListItem>
                                        <asp:ListItem Value="B">B - Option B</asp:ListItem>
                                        <asp:ListItem Value="C">C - Option C</asp:ListItem>
                                        <asp:ListItem Value="D">D - Option D</asp:ListItem>

                                    </asp:DropDownList>

                                    <span class="answer-help">Make sure the selected answer matches
                                        the correct answer to this question.
                                    </span>

                                </div>

                            </div>

                        </section>

                    </ItemTemplate>

                </asp:ListView>

            </div>

            <!-- Save changes -->
            <div class="apply-edit-wrapper">

                <div class="save-info">
                    <strong>Finished editing?</strong>
                    <span>Apply your changes when all question fields are ready.
                    </span>
                </div>

                <asp:Button ID="ApplyEditButton"
                    runat="server"
                    Text="Apply Changes"
                    OnClick="ApplyEditButton_Click"
                    CssClass="apply-edit-button"
                    OnClientClick="return confirm('Apply changes to these exam questions?');" />

            </div>

            <!-- Existing data source -->
            <asp:SqlDataSource
                ID="editQuestionDataSource"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT [Q_ID], [E_ID], [Q_TEXT], [OPTION_B], [OPTION_A], [OPTION_C], [OPTION_D], [CORRECT_OPTION] FROM [QUESTIONS] WHERE ([E_ID] = @E_ID)">

                <SelectParameters>
                    <asp:QueryStringParameter
                        Name="E_ID"
                        QueryStringField="examId"
                        Type="Int32" />
                </SelectParameters>

            </asp:SqlDataSource>

        </div>
    </main>

</asp:Content>


<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
</asp:Content>
