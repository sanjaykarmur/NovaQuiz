<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="editExam.aspx.cs" Inherits="NovaQuiz_3.editExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .edit-exam-page {
            width: 92%;
            max-width: 1050px;
            margin: 45px auto 80px
        }

        .edit-exam-header {
            margin-bottom: 28px
        }

            .edit-exam-header h1 {
                margin: 0;
                font-size: 34px;
                font-weight: 800
            }

            .edit-exam-header p {
                margin: 8px 0 0;
                font-size: 15px;
                opacity: .62
            }

        .question-list {
            display: flex;
            flex-direction: column;
            gap: 22px
        }

        .question-card {
            padding: 26px;
            border-radius: 20px;
            background: rgba(255,255,255,.045);
            border: 1px solid rgba(255,255,255,.1);
            backdrop-filter: blur(18px);
            box-shadow: 0 15px 40px rgba(0,0,0,.15);
            transition: .2s
        }

            .question-card:hover {
                transform: translateY(-2px);
                border-color: rgba(124,140,255,.28)
            }

        .question-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255,255,255,.08)
        }

        .meta-item {
            display: inline-flex;
            gap: 6px;
            align-items: center;
            padding: 6px 10px;
            border-radius: 8px;
            background: rgba(255,255,255,.045);
            border: 1px solid rgba(255,255,255,.08);
            font-size: 11px;
            font-weight: 700
        }

        .meta-label {
            opacity: .5
        }

        .field {
            margin-bottom: 23px
        }

        .field-title, .options-title {
            display: block;
            margin-bottom: 9px;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: .8px;
            opacity: .6
        }

        .current-label, .update-label {
            display: block;
            margin-bottom: 5px;
            font-size: 11px;
            font-weight: 700;
            opacity: .48
        }

        .current-value {
            display: block;
            padding: 10px 13px;
            margin-bottom: 9px;
            border-radius: 9px;
            font-size: 14px
        }

        .question-card input[type=text] {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 13px;
            border-radius: 10px;
            border: 3px solid #2914dc8c;
            background: 0;
            color: inherit;
            font: 14px inherit;
            outline: none;
            transition: .2s
        }

            .question-card input[type=text]:focus {
                border-color: rgba(124,140,255,.65);
                background: rgba(124,140,255,.055);
                box-shadow: 0 0 0 3px rgba(124,140,255,.09)
            }

        .options-title {
            margin-bottom: 13px
        }

        .option {
            padding: 15px 0;
            border-top: 1px solid rgba(255,255,255,.07)
        }

        .option-name {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 9px;
            font-size: 12px;
            font-weight: 800
        }

        .option-letter {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 25px;
            height: 25px;
            border-radius: 7px;
            background: rgba(124,140,255,.12);
            color: #aeb7ff
        }

        .answer-section {
            margin-top: 15px;
            padding: 16px;
            border-radius: 14px;
            background: rgba(45,200,140,.045);
            border: 1px solid rgba(45,200,140,.17)
        }

        .answer-title {
            margin-bottom: 11px;
            color: #58d6a5;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: .8px
        }

        .correct-option {
            width: 100%;
            box-sizing: border-box;
            padding: 12px 13px;
            border-radius: 10px;
            border: 1px solid rgba(45,200,140,.3);
            background: rgba(45,200,140,.08);
            color: inherit;
            font: 700 14px inherit;
            outline: none
        }

            .correct-option option {
                background: #172126;
                color: #fff
            }

        .apply-edit-wrapper {
            display: flex;
            justify-content: flex-end;
            margin-top: 28px;
            padding-top: 20px;
            border-top: 1px solid rgba(255,255,255,.08)
        }

        .apply-edit-button {
            min-width: 145px;
            padding: 12px 22px;
            border: 1px solid rgba(45,200,140,.3);
            border-radius: 11px;
            background: rgba(45,200,140,.12);
            color: #58d6a5;
            font-size: 13px;
            font-weight: 800;
            cursor: pointer;
            transition: .2s
        }

            .apply-edit-button:hover {
                background: rgba(45,200,140,.2);
                border-color: rgba(45,200,140,.45);
                transform: translateY(-1px)
            }

        @media(max-width:700px) {
            .edit-exam-page {
                width: 94%;
                margin-top: 30px
            }

            .edit-exam-header h1 {
                font-size: 27px
            }

            .question-card {
                padding: 20px
            }

            .question-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 9px
            }

            .apply-edit-wrapper {
                justify-content: stretch
            }

            .apply-edit-button {
                width: 100%
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
                    <a href="about.aspx" data-page="about.aspx">About</a>
                    <a href="dashboard.aspx" data-page="dashboard.aspx">Dashboard</a>
                    <a href="exams.aspx" data-page="exams.aspx">Exams</a>
                    <a href="contact.aspx" data-page="contact.aspx">Contact Us</a>
                </nav>

                <div class="nav-actions">
                    <button class="theme-toggle" data-theme-toggle aria-label="Toggle dark and light mode">
                        <svg class="icon-moon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" />
                        </svg>
                        <svg class="icon-sun" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="4" />
                            <path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41-1.41" />
                        </svg>
                    </button>

                    <div id="authButtons" runat="server">
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

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <div class="edit-exam-page">

        <div class="edit-exam-header">
            <h1>Edit Exam Questions</h1>
            <p>Update questions, options and correct answers for this examination.</p>
        </div>

        <div class="question-list">

            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Q_ID" DataSourceID="editQuestionDataSource">

                <ItemTemplate>

                    <div class="question-card">

                        <div class="question-meta">
                            <span class="meta-item"><span class="meta-label">Question</span><asp:Label ID="Q_IDLabel" runat="server" Text='<%# Eval("Q_ID") %>' /></span>
                            <span class="meta-item"><span class="meta-label">Exam</span><asp:Label ID="E_IDLabel" runat="server" Text='<%# Eval("E_ID") %>' /></span>
                        </div>

                        <div class="field">
                            <span class="field-title">Question</span>
                            <span class="current-label">Current:</span>
                            <asp:Label ID="Q_TEXTLabel" runat="server" CssClass="current-value" Text='<%# Eval("Q_TEXT") %>' />
                            <span class="update-label">Update:</span>
                            <asp:TextBox ID="Q_TEXTTextBox" runat="server" Text='<%# Eval("Q_TEXT") %>' />
                        </div>

                        <div class="options-title">Answer Options</div>

                        <div class="option">
                            <div class="option-name"><span class="option-letter">A</span>Option A</div>
                            <span class="current-label">Current:</span>
                            <asp:Label ID="OPTION_ALabel" runat="server" CssClass="current-value" Text='<%# Eval("OPTION_A") %>' />
                            <span class="update-label">Update:</span>
                            <asp:TextBox ID="OPTION_ATextBox" runat="server" Text='<%# Eval("OPTION_A") %>' />
                        </div>

                        <div class="option">
                            <div class="option-name"><span class="option-letter">B</span>Option B</div>
                            <span class="current-label">Current:</span>
                            <asp:Label ID="OPTION_BLabel" runat="server" CssClass="current-value" Text='<%# Eval("OPTION_B") %>' />
                            <span class="update-label">Update:</span>
                            <asp:TextBox ID="OPTION_BTextBox" runat="server" Text='<%# Eval("OPTION_B") %>' />
                        </div>

                        <div class="option">
                            <div class="option-name"><span class="option-letter">C</span>Option C</div>
                            <span class="current-label">Current:</span>
                            <asp:Label ID="OPTION_CLabel" runat="server" CssClass="current-value" Text='<%# Eval("OPTION_C") %>' />
                            <span class="update-label">Update:</span>
                            <asp:TextBox ID="OPTION_CTextBox" runat="server" Text='<%# Eval("OPTION_C") %>' />
                        </div>

                        <div class="option">
                            <div class="option-name"><span class="option-letter">D</span>Option D</div>
                            <span class="current-label">Current:</span>
                            <asp:Label ID="OPTION_DLabel" runat="server" CssClass="current-value" Text='<%# Eval("OPTION_D") %>' />
                            <span class="update-label">Update:</span>
                            <asp:TextBox ID="OPTION_DTextBox" runat="server" Text='<%# Eval("OPTION_D") %>' />
                        </div>

                        <div class="answer-section">
                            <div class="answer-title">✓ Correct Answer</div>
                            <span class="current-label">Current:</span>
                            <asp:Label ID="CORRECT_OPTIONLabel" runat="server" CssClass="current-value" Text='<%# Eval("CORRECT_OPTION") %>' />
                            <span class="update-label">Update:</span>
                            <asp:DropDownList ID="CorrectOptionDropDownList" runat="server" SelectedValue='<%# Eval("CORRECT_OPTION") %>' CssClass="correct-option">
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                    </div>

                </ItemTemplate>

            </asp:ListView>

        </div>

        <div class="apply-edit-wrapper">
            <asp:Button ID="ApplyEditButton" runat="server" Text="Apply Edit" OnClick="ApplyEditButton_Click" CssClass="apply-edit-button" />
        </div>

    </div>

    <asp:SqlDataSource ID="editQuestionDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [Q_ID], [E_ID], [Q_TEXT], [OPTION_B], [OPTION_A], [OPTION_C], [OPTION_D], [CORRECT_OPTION] FROM [QUESTIONS] WHERE ([E_ID] = @E_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="E_ID" QueryStringField="examId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
</asp:Content>
