<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="viewResult.aspx.cs" Inherits="NovaQuiz_3.viewResult" %>

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
        <style>
            <style >
            .vr-page {
                --vr-primary: #8065ef;
                --vr-primary-dark: #694de0;
                --vr-text: var(--text, #252440);
                --vr-muted: #85839d;
                --vr-border: var(--border, #eae7f5);
                --vr-surface: var(--surface, #ffffff);
                padding: 35px 22px 60px;
                color: var(--vr-text);
                font-family: inherit;
            }

            .vr-container {
                max-width: 1050px;
                margin: 0 auto;
            }

            .vr-heading {
                margin-bottom: 30px;
                text-align: center;
            }

            .vr-eyebrow {
                display: inline-block;
                margin-bottom: 10px;
                color: var(--vr-primary-dark);
                font-size: 11px;
                font-weight: 800;
                letter-spacing: 2px;
            }

            .vr-title {
                margin: 0;
                color: var(--vr-text);
                font-size: clamp(28px, 4vw, 38px);
                font-weight: 800;
                letter-spacing: -1px;
            }

                .vr-title::after {
                    content: "";
                    display: block;
                    width: 55px;
                    height: 4px;
                    margin: 14px auto 0;
                    border-radius: 10px;
                    background: var(--grad-aurora, linear-gradient(120deg, #8065ef, #4fd1c5));
                }

            .vr-description {
                max-width: 600px;
                margin: 13px auto 0;
                color: var(--vr-muted);
                font-size: 14px;
                line-height: 1.7;
            }

            /* Result summary */
            .vr-summary {
                display: grid;
                grid-template-columns: repeat(3, minmax(0, 1fr));
                gap: 18px;
                margin-bottom: 32px;
            }

            .vr-stat {
                min-width: 0;
                padding: 24px;
                border: 1px solid var(--vr-border);
                border-radius: 17px;
                background: var(--vr-surface);
                box-shadow: 0 8px 25px rgba(65, 48, 130, 0.05);
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }

                .vr-stat:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 12px 30px rgba(65, 48, 130, 0.09);
                }

            .vr-stat-label {
                display: block;
                margin-bottom: 13px;
                color: var(--vr-muted);
                font-size: 11px;
                font-weight: 800;
                letter-spacing: 1px;
            }

            .vr-stat-value {
                display: block;
                overflow-wrap: anywhere;
                color: var(--vr-text);
                font-size: clamp(19px, 2.5vw, 28px);
                font-weight: 800;
                line-height: 1.4;
            }

            .vr-stat:nth-child(2) .vr-stat-value {
                color: var(--vr-primary-dark);
            }

            /* Answer review section */
            .vr-section {
                overflow: hidden;
                border: 1px solid var(--vr-border);
                border-radius: 19px;
                background: var(--vr-surface);
                box-shadow: 0 7px 26px rgba(65, 48, 130, 0.045);
            }

            .vr-section-header {
                padding: 24px;
                border-bottom: 1px solid var(--vr-border);
                background: rgba(128, 101, 239, 0.035);
            }

            .vr-section-title {
                margin: 0;
                color: var(--vr-text);
                font-size: 20px;
                font-weight: 800;
            }

            .vr-section-description {
                margin: 8px 0 0;
                color: var(--vr-muted);
                font-size: 13px;
                line-height: 1.6;
            }

            /* Individual question */
            .vr-question {
                padding: 25px 24px;
                border-bottom: 1px solid var(--vr-border);
            }

                .vr-question:last-child {
                    border-bottom: none;
                }

            .vr-question-heading {
                display: flex;
                align-items: flex-start;
                gap: 13px;
                margin-bottom: 20px;
            }

            .vr-question-number {
                display: inline-flex;
                flex: 0 0 36px;
                width: 36px;
                height: 36px;
                align-items: center;
                justify-content: center;
                border-radius: 11px;
                background: rgba(128, 101, 239, 0.11);
                color: var(--vr-primary-dark);
                font-size: 13px;
                font-weight: 800;
            }

            .vr-question-text {
                margin: 5px 0 0;
                color: var(--vr-text);
                font-size: 16px;
                font-weight: 750;
                line-height: 1.65;
                overflow-wrap: anywhere;
            }

            /* Answer options */
            .vr-answer-list {
                display: grid;
                gap: 10px;
                margin-left: 49px;
            }

            .vr-answer {
                display: flex;
                align-items: center;
                gap: 12px;
                min-width: 0;
                padding: 13px 15px;
                border: 1px solid var(--vr-border);
                border-radius: 12px;
                background: rgba(128, 101, 239, 0.025);
                color: var(--vr-text);
                transition: border-color 0.2s ease, background 0.2s ease;
            }

            .vr-answer-letter {
                display: inline-flex;
                flex: 0 0 30px;
                width: 30px;
                height: 30px;
                align-items: center;
                justify-content: center;
                border: 1px solid var(--vr-border);
                border-radius: 9px;
                background: #fff;
                color: #77748f;
                font-size: 12px;
                font-weight: 800;
            }

            .vr-answer-content {
                flex: 1;
                min-width: 0;
                font-size: 13px;
                line-height: 1.65;
                overflow-wrap: anywhere;
                white-space: normal;
            }

            .vr-answer-badge {
                display: inline-flex;
                flex: 0 0 auto;
                align-items: center;
                justify-content: center;
                padding: 6px 9px;
                border-radius: 7px;
                font-size: 10px;
                font-weight: 800;
                white-space: nowrap;
            }

            /* Correct answer */
            .vr-answer-correct {
                border-color: #a8e6c1;
                background: #effcf4;
                color: #17683b;
            }

                .vr-answer-correct .vr-answer-letter {
                    border-color: #a8e6c1;
                    background: #d9f8e5;
                    color: #17683b;
                }

                .vr-answer-correct .vr-answer-badge {
                    background: #d5f6e2;
                    color: #17683b;
                }

            /* Incorrect selected answer */
            .vr-answer-wrong {
                border-color: #f2b6bd;
                background: #fff2f3;
                color: #a52d3c;
            }

                .vr-answer-wrong .vr-answer-letter {
                    border-color: #f2b6bd;
                    background: #ffe1e4;
                    color: #a52d3c;
                }

                .vr-answer-wrong .vr-answer-badge {
                    background: #ffdee2;
                    color: #a52d3c;
                }

            /* Unanswered question feedback */
            .vr-answer-unanswered {
                border-color: #eadcb0;
                background: #fffaf0;
            }

            .vr-feedback {
                display: flex;
                align-items: flex-start;
                gap: 12px;
                margin: 18px 0 0 49px;
                padding: 15px 17px;
                border: 1px solid var(--vr-border);
                border-radius: 12px;
                font-size: 13px;
                line-height: 1.7;
            }

                .vr-feedback > span:first-child {
                    flex: 0 0 auto;
                    font-size: 17px;
                    font-weight: 800;
                }

                .vr-feedback strong {
                    display: block;
                    margin-bottom: 3px;
                    font-size: 13px;
                    font-weight: 800;
                }

            .vr-feedback-correct {
                border-color: #c4ecd2;
                background: #f0fcf4;
                color: #17683b;
            }

            .vr-feedback-wrong {
                border-color: #f4c9ce;
                background: #fff4f5;
                color: #a52d3c;
            }

            .vr-feedback-unanswered {
                border-color: #f0dfb4;
                background: #fffaf0;
                color: #85631b;
            }

            /* Navigation buttons */
            .vr-actions {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                gap: 14px;
                margin-top: 28px;
            }

            .vr-btn {
                display: inline-flex;
                min-height: 45px;
                box-sizing: border-box;
                align-items: center;
                justify-content: center;
                gap: 8px;
                padding: 12px 19px;
                border: 1px solid var(--vr-border);
                border-radius: 11px;
                background: var(--vr-surface);
                color: var(--vr-text) !important;
                font-size: 12px;
                font-weight: 800;
                text-align: center;
                text-decoration: none !important;
                transition: transform 0.2s ease, box-shadow 0.2s ease, background 0.2s ease;
            }

                .vr-btn:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 7px 18px rgba(65, 48, 130, 0.1);
                }

            .vr-btn-primary {
                border-color: transparent;
                background: var(--grad-aurora, linear-gradient(120deg, #8065ef, #9c80f4));
                color: #fff !important;
                box-shadow: 0 6px 17px rgba(128, 101, 239, 0.2);
            }

                .vr-btn-primary:hover {
                    box-shadow: 0 10px 23px rgba(128, 101, 239, 0.3);
                }

            /* Error and status message */
            .vr-message {
                display: block;
                margin-top: 22px;
                padding: 17px 20px;
                border: 1px solid #f2c6cb;
                border-radius: 12px;
                background: #fff3f4;
                color: #a52d3c;
                font-size: 14px;
                line-height: 1.7;
            }

            /* Responsive layout */
            @media (max-width: 760px) {
                .vr-page {
                    padding: 25px 14px 40px;
                }

                .vr-summary {
                    grid-template-columns: 1fr;
                    gap: 12px;
                }

                .vr-stat {
                    padding: 19px;
                }

                .vr-stat-value {
                    font-size: 23px;
                }

                .vr-section-header {
                    padding: 19px;
                }

                .vr-question {
                    padding: 21px 17px;
                }

                .vr-answer-list,
                .vr-feedback {
                    margin-left: 0;
                }
            }

            @media (max-width: 480px) {
                .vr-question-heading {
                    gap: 10px;
                }

                .vr-question-number {
                    flex-basis: 32px;
                    width: 32px;
                    height: 32px;
                }

                .vr-question-text {
                    font-size: 14px;
                }

                .vr-answer {
                    gap: 9px;
                    padding: 11px;
                }

                .vr-answer-content {
                    font-size: 12px;
                }

                .vr-answer-badge {
                    padding: 5px 6px;
                    font-size: 9px;
                }

                .vr-actions {
                    flex-direction: column;
                }

                .vr-btn {
                    width: 100%;
                }
            }
        </style>
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
                    <asp:Button
                        ID="btnLogout"
                        runat="server"
                        Text="Logout"
                        CssClass="btn btn-ghost"
                        CausesValidation="false"
                        OnClick="btnLogout_Click"
                        OnClientClick="return confirm('Are you sure you want to log out?');" Width="105px" />
                </div>

                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <main class="vr-page">
        <div class="vr-container">

            <header class="vr-heading">
                <span class="vr-eyebrow">EXAM REVIEW</span>
                <h1 class="vr-title">Your Exam Result</h1>
                <p class="vr-description">
                    Review your answers and compare them with the correct options.
                </p>
            </header>

            <asp:Panel ID="pnlResult" runat="server" Visible="false">

                <!-- Result Summary -->
                <section class="vr-summary">

                    <article class="vr-stat">
                        <span class="vr-stat-label">EXAM</span>
                        <asp:Label ID="lblExamTitle" runat="server"
                            CssClass="vr-stat-value" />
                    </article>

                    <article class="vr-stat">
                        <span class="vr-stat-label">YOUR SCORE</span>
                        <asp:Label ID="lblScore" runat="server"
                            CssClass="vr-stat-value" />
                    </article>

                    <article class="vr-stat">
                        <span class="vr-stat-label">CORRECT ANSWERS</span>
                        <asp:Label ID="lblCorrectCount" runat="server"
                            CssClass="vr-stat-value" />
                    </article>

                </section>

                <!-- Question Review -->
                <section class="vr-section">

                    <div class="vr-section-header">
                        <h2 class="vr-section-title">Answer Review</h2>
                        <p class="vr-section-description">
                            Review your selected answers and identify the correct options.
                        </p>
                    </div>

                    <asp:Repeater ID="rptQuestions" runat="server">
                        <ItemTemplate>

                            <article class="vr-question">

                                <div class="vr-question-heading">
                                    <span class="vr-question-number">
                                        <%#: Eval("QUESTION_NUMBER") %>
                                    </span>

                                    <h3 class="vr-question-text">
                                        <%#: Eval("QUESTION_TEXT") %>
                                    </h3>
                                </div>

                                <div class="vr-answer-list">

                                    <div class='<%# GetOptionCss(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION"), "A") %>'>
                                        <span class="vr-answer-letter">A</span>
                                        <span class="vr-answer-content">
                                            <%#: Eval("OPTION_A") %>
                                        </span>
                                        <%# GetOptionBadge(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION"), "A") %>
                                    </div>

                                    <div class='<%# GetOptionCss(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION"), "B") %>'>
                                        <span class="vr-answer-letter">B</span>
                                        <span class="vr-answer-content">
                                            <%#: Eval("OPTION_B") %>
                                        </span>
                                        <%# GetOptionBadge(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION"), "B") %>
                                    </div>

                                    <div class='<%# GetOptionCss(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION"), "C") %>'>
                                        <span class="vr-answer-letter">C</span>
                                        <span class="vr-answer-content">
                                            <%#: Eval("OPTION_C") %>
                                        </span>
                                        <%# GetOptionBadge(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION"), "C") %>
                                    </div>

                                    <div class='<%# GetOptionCss(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION"), "D") %>'>
                                        <span class="vr-answer-letter">D</span>
                                        <span class="vr-answer-content">
                                            <%#: Eval("OPTION_D") %>
                                        </span>
                                        <%# GetOptionBadge(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION"), "D") %>
                                    </div>

                                </div>

                                <div class='<%# GetFeedbackCss(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION")) %>'>
                                    <span>
                                        <%# GetFeedbackIcon(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION")) %>
                                    </span>

                                    <div>
                                        <strong>
                                            <%#: GetFeedbackTitle(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION")) %>
                                        </strong>

                                        <%#: GetFeedbackText(Eval("SELECTED_OPTION"), Eval("CORRECT_OPTION")) %>
                                    </div>
                                </div>

                            </article>

                        </ItemTemplate>
                    </asp:Repeater>

                </section>

                <!-- Navigation -->
                <div class="vr-actions">
                    <a href="resultsHistory.aspx" class="vr-btn">&#8592; Back to Results History
                    </a>

                    <asp:Button ID="btnDownloadCertificate" runat="server"
                        Text="Download Certificate PDF"
                        CssClass="vr-btn vr-btn-primary"
                        CausesValidation="false"
                        OnClick="btnDownloadCertificate_Click"
                        Visible="true" />

                    <a href="exams.aspx" class="vr-btn vr-btn-primary">Take Another Exam &#8594;
                    </a>
                </div>

            </asp:Panel>

            <!-- Error / Status Message -->
            <asp:Label ID="lblMessage" runat="server"
                CssClass="vr-message"
                Visible="false" />

        </div>
    </main>

</asp:Content>


