<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="NovaQuiz_3.dashboard" %>

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
        <link rel="stylesheet" href="css/dashboard.css">

        <style>
            /* =====================================
           NovaQuiz User Dashboard
           ===================================== */

            .user-dash,
            .user-dash * {
                box-sizing: border-box;
            }

            .user-dash {
                --ud-primary: #6258e8;
                --ud-ink: #1c2540;
                --ud-muted: #818aa0;
                padding: 42px 0 70px;
                color: var(--ud-ink);
                background: radial-gradient(circle at 8% 0%, rgba(98,88,232,.07), transparent 28%), #f6f7fc;
            }

            .user-dash-container {
                width: min(1180px, calc(100% - 40px));
                margin: 0 auto;
            }

            /* Welcome section */

            .ud-welcome {
                position: relative;
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 25px;
                padding: 32px;
                margin-bottom: 25px;
                overflow: hidden;
                border-radius: 20px;
                background: linear-gradient(120deg, #292b68, #5045c9 72%, #7067eb);
                color: #fff;
                box-shadow: 0 16px 36px rgba(61,54,153,.17);
            }

                .ud-welcome::after {
                    content: "";
                    position: absolute;
                    width: 250px;
                    height: 250px;
                    right: -70px;
                    top: -130px;
                    border: 1px solid rgba(255,255,255,.15);
                    border-radius: 50%;
                    box-shadow: 0 0 0 35px rgba(255,255,255,.035), 0 0 0 70px rgba(255,255,255,.025);
                    pointer-events: none;
                }

            .ud-welcome-content {
                position: relative;
                z-index: 1;
            }

            .ud-eyebrow {
                display: inline-block;
                margin-bottom: 12px;
                color: #d9d6ff;
                font-size: 10px;
                font-weight: 800;
                letter-spacing: 1.8px;
            }

            .ud-welcome h1 {
                margin: 0 0 10px;
                color: #fff;
                font-size: clamp(26px, 3vw, 35px);
                line-height: 1.25;
                letter-spacing: -.8px;
                font-weight: 800;
            }

                .ud-welcome h1 span {
                    color: #c9c5ff;
                }

            .ud-welcome p {
                margin: 0;
                color: #e0dfff;
                font-size: 13px;
                line-height: 1.8;
            }

            .ud-welcome-icon {
                position: relative;
                z-index: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                width: 78px;
                height: 78px;
                flex-shrink: 0;
                border: 1px solid rgba(255,255,255,.23);
                border-radius: 22px;
                background: rgba(255,255,255,.12);
                color: #fff;
                font-size: 34px;
            }

            /* Statistics */

            .ud-section-heading {
                display: flex;
                align-items: end;
                justify-content: space-between;
                gap: 15px;
                margin: 30px 0 16px;
            }

                .ud-section-heading h2 {
                    margin: 0 0 5px;
                    color: var(--ud-ink);
                    font-size: 19px;
                    font-weight: 800;
                    letter-spacing: -.3px;
                }

                .ud-section-heading p {
                    margin: 0;
                    color: var(--ud-muted);
                    font-size: 12px;
                    line-height: 1.7;
                }

            .ud-stats-grid {
                display: grid;
                grid-template-columns: repeat(4, minmax(0, 1fr));
                gap: 17px;
            }

            .ud-stat-card {
                min-width: 0;
                padding: 22px;
                border: 1px solid #e8ebf4;
                border-radius: 15px;
                background: #fff;
                box-shadow: 0 6px 20px rgba(35,45,85,.035);
                transition: transform .2s, box-shadow .2s;
            }

                .ud-stat-card:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 12px 26px rgba(35,45,85,.07);
                }

            .ud-stat-top {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 10px;
                margin-bottom: 20px;
            }

            .ud-stat-label {
                color: #778198;
                font-size: 11px;
                font-weight: 700;
                line-height: 1.6;
            }

            .ud-stat-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 39px;
                height: 39px;
                flex-shrink: 0;
                border-radius: 12px;
                font-size: 19px;
            }

            .ud-icon-purple {
                background: #f0edff;
                color: #6556db;
            }

            .ud-icon-blue {
                background: #eaf3ff;
                color: #3775d6;
            }

            .ud-icon-green {
                background: #e7f9ef;
                color: #178b58;
            }

            .ud-icon-orange {
                background: #fff3e5;
                color: #cb7b22;
            }

            .ud-stat-value {
                display: block;
                overflow-wrap: anywhere;
                color: #202943;
                font-size: clamp(25px, 2.3vw, 32px);
                font-weight: 800;
                line-height: 1.2;
                letter-spacing: -1px;
            }

            .ud-stat-description {
                margin: 9px 0 0;
                color: #9299aa;
                font-size: 11px;
                line-height: 1.6;
            }

            /* Main dashboard panels */

            .ud-content-grid {
                display: grid;
                grid-template-columns: minmax(0, 1.25fr) minmax(260px, .75fr);
                gap: 20px;
                margin-top: 27px;
            }

            .ud-panel {
                min-width: 0;
                padding: 24px;
                border: 1px solid #e7eaf3;
                border-radius: 16px;
                background: #fff;
                box-shadow: 0 6px 20px rgba(35,45,85,.035);
            }

            .ud-panel-heading {
                display: flex;
                align-items: center;
                gap: 12px;
                margin-bottom: 20px;
            }

            .ud-panel-heading-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                flex-shrink: 0;
                border-radius: 11px;
                background: #f0edff;
                color: var(--ud-primary);
                font-size: 19px;
            }

            .ud-panel-heading h2 {
                margin: 0 0 5px;
                color: var(--ud-ink);
                font-size: 16px;
                font-weight: 800;
            }

            .ud-panel-heading p {
                margin: 0;
                color: var(--ud-muted);
                font-size: 11px;
                line-height: 1.6;
            }

            /* Quick actions */

            .ud-actions {
                display: grid;
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 12px;
            }

            .ud-action {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                min-height: 135px;
                padding: 17px;
                border: 1px solid #e9ebf5;
                border-radius: 12px;
                background: #fbfbff;
                color: inherit;
                text-decoration: none;
                transition: .2s ease;
            }

                .ud-action:hover {
                    transform: translateY(-2px);
                    border-color: #c9c5ff;
                    background: #f6f4ff;
                }

            .ud-action-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 35px;
                height: 35px;
                margin-bottom: 13px;
                border-radius: 10px;
                background: #efedff;
                color: #5d51d5;
                font-size: 17px;
            }

            .ud-action h3 {
                margin: 0 0 6px;
                color: #28314b;
                font-size: 12px;
                font-weight: 800;
            }

            .ud-action p {
                margin: 0;
                color: #8b93a7;
                font-size: 10px;
                line-height: 1.7;
            }

            /* Performance summary */

            .ud-summary-list {
                display: grid;
                gap: 0;
            }

            .ud-summary-row {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 15px;
                padding: 15px 0;
                border-bottom: 1px solid #edf0f6;
            }

                .ud-summary-row:first-child {
                    padding-top: 0;
                }

                .ud-summary-row:last-child {
                    padding-bottom: 0;
                    border-bottom: 0;
                }

            .ud-summary-label {
                color: #778198;
                font-size: 12px;
                line-height: 1.6;
            }

            .ud-summary-value {
                color: #28314b;
                font-size: 13px;
                font-weight: 800;
                text-align: right;
            }

                .ud-summary-value.ud-highlight {
                    color: #5549d3;
                }

            .ud-tip {
                display: flex;
                gap: 11px;
                margin-top: 22px;
                padding: 14px;
                border: 1px solid #e7e5ff;
                border-radius: 11px;
                background: #f7f6ff;
            }

            .ud-tip-icon {
                flex-shrink: 0;
                font-size: 18px;
            }

            .ud-tip p {
                margin: 0;
                color: #66658a;
                font-size: 11px;
                line-height: 1.8;
            }

            .ud-tip strong {
                color: #4238a6;
            }

            /* Responsive */

            @media (max-width: 950px) {
                .ud-stats-grid {
                    grid-template-columns: repeat(2, minmax(0, 1fr));
                }

                .ud-content-grid {
                    grid-template-columns: 1fr;
                }
            }

            @media (max-width: 520px) {
                .user-dash {
                    padding: 26px 0 45px;
                }

                .user-dash-container {
                    width: calc(100% - 26px);
                }

                .ud-welcome {
                    padding: 24px 20px;
                    border-radius: 16px;
                }

                .ud-welcome-icon {
                    width: 49px;
                    height: 49px;
                    border-radius: 14px;
                    font-size: 23px;
                }

                .ud-welcome h1 {
                    font-size: 25px;
                }

                .ud-welcome p {
                    font-size: 11px;
                }

                .ud-stats-grid {
                    gap: 10px;
                }

                .ud-stat-card {
                    padding: 15px;
                    border-radius: 12px;
                }

                .ud-stat-top {
                    align-items: flex-start;
                    margin-bottom: 15px;
                }

                .ud-stat-icon {
                    width: 32px;
                    height: 32px;
                    border-radius: 9px;
                    font-size: 15px;
                }

                .ud-stat-value {
                    font-size: 25px;
                }

                .ud-stat-label {
                    font-size: 10px;
                }

                .ud-panel {
                    padding: 19px;
                }

                .ud-actions {
                    gap: 9px;
                }

                .ud-action {
                    padding: 13px;
                }
            }

            @media (prefers-reduced-motion: reduce) {
                .ud-stat-card,
                .ud-action {
                    transition: none;
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
                    <asp:Button
                        ID="btnLogout"
                        runat="server"
                        Text="Logout"
                        CssClass="btn btn-ghost"
                        CausesValidation="false"
                        OnClick="btnLogout_Click"
                        OnClientClick="return confirm('Are you sure you want to log out?');" />
                </div>

                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <main class="user-dash">
        <div class="user-dash-container">

            <!-- WELCOME BANNER -->
            <section class="ud-welcome">
                <div class="ud-welcome-content">
                    <span class="ud-eyebrow">YOUR LEARNING SPACE</span>

                    <h1>
                        Welcome back,
                        <span><asp:Label ID="Label1" runat="server" Text="Student"></asp:Label></span>
                    </h1>

                    <p>
                        Keep learning, challenge yourself, and track
                        your examination progress with NovaQuiz.
                    </p>
                </div>

                <div class="ud-welcome-icon" aria-hidden="true">
                    &#128075;
                </div>
            </section>

            <!-- STATISTICS -->
            <section aria-labelledby="udStatsTitle">

                <div class="ud-section-heading">
                    <div>
                        <h2 id="udStatsTitle">Your Statistics</h2>
                        <p>A summary of your examination performance.</p>
                    </div>
                </div>

                <div class="ud-stats-grid">

                    <!-- Total exams -->
                    <article class="ud-stat-card">
                        <div class="ud-stat-top">
                            <span class="ud-stat-label">Exams Attempted</span>
                            <span class="ud-stat-icon ud-icon-purple"
                                  aria-hidden="true">&#128221;</span>
                        </div>

                        <asp:Label
                            ID="lblTotalExams"
                            runat="server"
                            CssClass="ud-stat-value"
                            Text="0" />

                        <p class="ud-stat-description">
                            Total recorded exam attempts
                        </p>
                    </article>

                    <!-- Average score -->
                    <article class="ud-stat-card">
                        <div class="ud-stat-top">
                            <span class="ud-stat-label">Average Score</span>
                            <span class="ud-stat-icon ud-icon-blue"
                                  aria-hidden="true">&#127919;</span>
                        </div>

                        <asp:Label
                            ID="avgScoreLabel"
                            runat="server"
                            CssClass="ud-stat-value"
                            Text="0.00%" />

                        <p class="ud-stat-description">
                            Average percentage across attempts
                        </p>
                    </article>

                    <!-- Best score -->
                    <article class="ud-stat-card">
                        <div class="ud-stat-top">
                            <span class="ud-stat-label">Best Score</span>
                            <span class="ud-stat-icon ud-icon-green"
                                  aria-hidden="true">&#127942;</span>
                        </div>

                        <asp:Label
                            ID="lblBestScore"
                            runat="server"
                            CssClass="ud-stat-value"
                            Text="0.00%" />

                        <p class="ud-stat-description">
                            Highest percentage achieved
                        </p>
                    </article>

                    <!-- Marks earned -->
                    <article class="ud-stat-card">
                        <div class="ud-stat-top">
                            <span class="ud-stat-label">Marks Earned</span>
                            <span class="ud-stat-icon ud-icon-orange"
                                  aria-hidden="true">&#11088;</span>
                        </div>

                        <asp:Label
                            ID="lblMarksEarned"
                            runat="server"
                            CssClass="ud-stat-value"
                            Text="0" />

                        <p class="ud-stat-description">
                            Total marks across recorded attempts
                        </p>
                    </article>

                </div>
            </section>

            <!-- QUICK ACTIONS AND PERFORMANCE SUMMARY -->
            <div class="ud-content-grid">

                <!-- QUICK ACTIONS -->
                <section class="ud-panel">

                    <div class="ud-panel-heading">
                        <span class="ud-panel-heading-icon"
                              aria-hidden="true">&#9889;</span>

                        <div>
                            <h2>Quick Actions</h2>
                            <p>Where would you like to go next?</p>
                        </div>
                    </div>

                    <div class="ud-actions">

                        <a href="exams.aspx" class="ud-action">
                            <span class="ud-action-icon"
                                  aria-hidden="true">&#9654;</span>
                            <h3>Start an Exam</h3>
                            <p>Choose an exam and test your knowledge.</p>
                        </a>

                        <a href="resultsHistory.aspx" class="ud-action">
                            <span class="ud-action-icon"
                                  aria-hidden="true">&#128269;</span>
                            <h3>View Results</h3>
                            <p>Analyse avalable results.</p>
                        </a>

                        <a href="about.aspx" class="ud-action">
                            <span class="ud-action-icon"
                                  aria-hidden="true">&#8505;</span>
                            <h3>About NovaQuiz</h3>
                            <p>Learn more about the platform.</p>
                        </a>

                        <a href="contact.aspx" class="ud-action">
                            <span class="ud-action-icon"
                                  aria-hidden="true">&#9993;</span>
                            <h3>Get Support</h3>
                            <p>Contact us if you need assistance.</p>
                        </a>

                    </div>
                </section>

                <!-- PERFORMANCE SUMMARY -->
                <section class="ud-panel">

                    <div class="ud-panel-heading">
                        <span class="ud-panel-heading-icon"
                              aria-hidden="true">&#128202;</span>

                        <div>
                            <h2>Performance Summary</h2>
                            <p>Your results at a glance.</p>
                        </div>
                    </div>

                    <div class="ud-summary-list">

                        <div class="ud-summary-row">
                            <span class="ud-summary-label">Total attempts</span>
                            <asp:Label
                                ID="lblSummaryAttempts"
                                runat="server"
                                CssClass="ud-summary-value"
                                Text="0" />
                        </div>

                        <div class="ud-summary-row">
                            <span class="ud-summary-label">Average result</span>
                            <asp:Label
                                ID="lblSummaryAverage"
                                runat="server"
                                CssClass="ud-summary-value ud-highlight"
                                Text="0.00%" />
                        </div>

                        <div class="ud-summary-row">
                            <span class="ud-summary-label">Personal best</span>
                            <asp:Label
                                ID="lblSummaryBest"
                                runat="server"
                                CssClass="ud-summary-value"
                                Text="0.00%" />
                        </div>

                        <div class="ud-summary-row">
                            <span class="ud-summary-label">Total marks earned</span>
                            <asp:Label
                                ID="lblSummaryMarks"
                                runat="server"
                                CssClass="ud-summary-value"
                                Text="0" />
                        </div>

                    </div>

                    <div class="ud-tip">
                        <span class="ud-tip-icon" aria-hidden="true">&#128161;</span>
                        <p>
                            <strong>Keep practising!</strong>
                            Take more exams to build your confidence
                            and improve your results.
                        </p>
                    </div>

                </section>

            </div>

        </div>
    </main>

</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ===================== FOOTER ===================== -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="index.aspx" class="nav-logo"><span class="logo-dot"></span>NovaQuiz</a>
                    <p>
                        A focused, modern platform for timed practice exams, instant scoring and real progress tracking.
                    </p>
                    <div class="social-row">
                        <a href="#" class="social-btn" aria-label="Twitter">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M23 4.6c-.8.4-1.7.7-2.6.8a4.5 4.5 0 002-2.5c-.9.5-1.9.9-2.9 1.1a4.5 4.5 0 00-7.7 4.1A12.8 12.8 0 013 3.9a4.5 4.5 0 001.4 6 4.4 4.4 0 01-2-.6v.1a4.5 4.5 0 003.6 4.4 4.5 4.5 0 01-2 .1 4.5 4.5 0 004.2 3.1A9 9 0 012 19.5a12.7 12.7 0 006.9 2c8.3 0 12.8-6.9 12.8-12.8v-.6c.9-.6 1.6-1.4 2.3-2.3z" />
                            </svg>
                        </a><a href="#" class="social-btn" aria-label="Facebook">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M13.5 21v-8h2.7l.4-3.2h-3V7.7c0-.9.3-1.5 1.6-1.5H17V3.4c-.3 0-1.2-.1-2.3-.1-2.4 0-4 1.5-4 4.1v2.4H8v3.2h2.7V21z" />
                            </svg>
                        </a><a href="#" class="social-btn" aria-label="LinkedIn">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M6.9 8.4H3.6V21h3.3zM5.3 3a1.9 1.9 0 100 3.9 1.9 1.9 0 000-3.9zM21 21v-6.9c0-3.7-2-5.4-4.6-5.4-2.1 0-3 1.2-3.6 2v-1.7H9.6c0 .9 0 12 0 12h3.2v-6.7c0-.4 0-.7.1-1 .3-.7 1-1.5 2.1-1.5 1.5 0 2.1 1.1 2.1 2.8V21z" />
                            </svg>
                        </a><a href="#" class="social-btn" aria-label="Instagram">
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M12 2.2c3.2 0 3.6 0 4.9.1 1.2.1 2 .3 2.4.5.6.2 1 .5 1.5 1s.8.9 1 1.5c.2.4.4 1.2.5 2.4.1 1.3.1 1.7.1 4.9s0 3.6-.1 4.9c-.1 1.2-.3 2-.5 2.4-.2.6-.5 1-1 1.5s-.9.8-1.5 1c-.4.2-1.2.4-2.4.5-1.3.1-1.7.1-4.9.1s-3.6 0-4.9-.1c-1.2-.1-2-.3-2.4-.5-.6-.2-1-.5-1.5-1s-.8-.9-1-1.5c-.2-.4-.4-1.2-.5-2.4C2 15.6 2 15.2 2 12s0-3.6.1-4.9c.1-1.2.3-2 .5-2.4.2-.6.5-1 1-1.5s.9-.8 1.5-1c.4-.2 1.2-.4 2.4-.5C8.4 2.2 8.8 2.2 12 2.2zm0 1.8c-3.1 0-3.5 0-4.7.1-1 0-1.6.2-1.9.4-.5.2-.8.4-1.2.7-.3.4-.5.7-.7 1.2-.1.3-.3.9-.4 1.9-.1 1.2-.1 1.6-.1 4.7s0 3.5.1 4.7c0 1 .2 1.6.4 1.9.2.5.4.8.7 1.2.4.3.7.5 1.2.7.3.1.9.3 1.9.4 1.2.1 1.6.1 4.7.1s3.5 0 4.7-.1c1 0 1.6-.2 1.9-.4.5-.2.8-.4 1.2-.7.3-.4.5-.7.7-1.2.1-.3.3-.9.4-1.9.1-1.2.1-1.6.1-4.7s0-3.5-.1-4.7c0-1-.2-1.6-.4-1.9-.2-.5-.4-.8-.7-1.2a2.9 2.9 0 00-1.2-.7c-.3-.1-.9-.3-1.9-.4-1.2-.1-1.6-.1-4.7-.1zm0 3.5a4.5 4.5 0 110 9 4.5 4.5 0 010-9zm0 1.8a2.7 2.7 0 100 5.4 2.7 2.7 0 000-5.4zm5.7-2a1.1 1.1 0 110 2.1 1.1 1.1 0 010-2.1z" />
                            </svg>
                        </a>
                    </div>
                </div>
                <div>
                    <h4>Platform</h4>
                    <ul class="footer-links">
                        <li><a href="index.aspx">Home</a></li>
                        <li><a href="about.aspx">About</a></li>
                        <li><a href="exams.aspx">Exams</a></li>
                        <li><a href="dashboard.aspx">Dashboard</a></li>
                    </ul>
                </div>
                <div>
                    <h4>Account</h4>
                    <ul class="footer-links">
                        <li><a href="login.aspx">Login</a></li>
                        <li><a href="signup.aspx">Sign Up</a></li>
                        <li><a href="contact.aspx">Contact Us</a></li>
                        <li><a href="adminDashboard.aspx">Admin?</a></li>
                    </ul>
                </div>
                <div>
                    <h4>Legal</h4>
                    <ul class="footer-links">
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                        <li><a href="#">Cookie Policy</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <span> </span> <span>Designed &amp; built with care for focused learning.</span>
            </div>
        </div>
    </footer>

    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    </body>
</html>
</asp:Content>

