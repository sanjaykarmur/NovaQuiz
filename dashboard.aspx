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
    </head>
    <body>
        <div class="page-loader" aria-hidden="true">
            <div class="loader-ring">
            </div>
        </div>

        <!-- ===================== NAVBAR ===================== -->
        <header class="navbar">
            <div class="container nav-inner">
                <a href="index.html" class="nav-logo"><span class="logo-dot"></span>NovaQuiz</a>
                <nav class="nav-links" id="navLinks" aria-label="Primary">
                    <a href="index.html" data-page="index.html">Home</a> <a href="about.html" data-page="about.html">About</a> <a href="dashboard.html" data-page="dashboard.html">Dashboard</a> <a href="exams.html" data-page="exams.html">Exams</a> <a href="contact.html" data-page="contact.html">Contact Us</a>
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
                    <a href="login.html" class="btn btn-ghost" data-nav="login">Login</a> <a href="signup.html" class="btn btn-primary btn-sm" data-nav="signup">Sign Up</a>
                </div>
                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <main class="dash-wrap container">

        <!--<div class="glass guest-banner" style="display:none; padding:14px 22px; margin-bottom:22px; align-items:center; justify-content:space-between; gap:14px; flex-wrap:wrap;">
    <span style="font-size:0.88rem; color:var(--text-dim);">You're viewing demo data. <a href="signup.html" style="color:var(--cyan); font-weight:600;">Create an account</a> to save your real exam history.</span>
    <a href="signup.html" class="btn btn-primary btn-sm">Sign Up Free</a>
  </div>-->

        <!-- Welcome card -->
        <div class="glass welcome-card reveal" style="margin-bottom: 24px;">
            <div>
                <h2>Welcome back, <span data-user-name>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </span> 👋</h2>
                <p>Here's how your preparation is going this week.</p>
            </div>
            <div class="welcome-badge">
                <div class="streak-pill">🔥 <span data-exam-count>0</span> exams taken</div>
                <div class="streak-pill">📊 <span data-avg-score>0%</span> avg. score</div>
            </div>
        </div>

        <!-- Quick actions -->
        <div class="grid grid-4 reveal" style="margin-bottom: 24px;">
            <a href="exams.html" class="quick-action glass">
                <div class="qa-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M5 12h14M12 5l7 7-7 7" />
                    </svg></div>
                <h4>Start New Exam</h4>
                <p>Jump into a mock test now</p>
            </a>
            <a href="exams.html" class="quick-action glass">
                <div class="qa-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="11" cy="11" r="7" />
                        <path d="M21 21l-4.3-4.3" />
                    </svg></div>
                <h4>Browse Exams</h4>
                <p>Explore all categories</p>
            </a>
            <a href="#recentResults" class="quick-action glass">
                <div class="qa-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M3 3v18h18" />
                        <path d="M7 15l4-6 4 3 5-8" />
                    </svg></div>
                <h4>View Results</h4>
                <p>Check your latest scores</p>
            </a>
            <a href="about.html" class="quick-action glass">
                <div class="qa-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10" />
                        <path d="M12 16v-4M12 8h.01" />
                    </svg></div>
                <h4>Get Help</h4>
                <p>Learn how NovaQuiz works</p>
            </a>
        </div>

        <div class="dash-grid">
            <!-- Performance chart -->
            <!--<div class="widget glass span-2 reveal">
      <div class="widget-head"><h3>Performance Trend</h3><a href="exams.html">Take an exam</a></div>
      <div class="chart-wrap"><canvas id="performanceChart"></canvas></div>
      <div class="chart-legend">
        <div class="chart-legend-item"><span class="chart-legend-dot" style="background:#7C6FF0"></span>Score % over recent exams</div>
      </div>
    </div>-->

            <!-- Progress by category -->
            <!--<div class="widget glass span-2 reveal">
      <div class="widget-head"><h3>Category Progress</h3></div>
      <div data-progress></div>
    </div>-->

            <!-- Upcoming exams -->
            <div class="widget glass span-2 reveal">
                <div class="widget-head">
                    <h3>Upcoming Exams</h3>
                    <a href="exams.html">See all</a></div>
                <div data-upcoming></div>
            </div>

            <!-- Recent results -->
            <div class="widget glass span-1 reveal" id="recentResults">
                <div class="widget-head">
                    <h3>Recent Results</h3>
                </div>
                <div data-recent-results></div>
            </div>

            <!-- Notifications -->
            <div class="widget glass span-1 reveal">
                <div class="widget-head">
                    <h3>Notifications</h3>
                </div>
                <div data-notifications></div>
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
                    <a href="index.html" class="nav-logo"><span class="logo-dot"></span>NovaQuiz</a>
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
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="exams.html">Exams</a></li>
                        <li><a href="dashboard.html">Dashboard</a></li>
                    </ul>
                </div>
                <div>
                    <h4>Account</h4>
                    <ul class="footer-links">
                        <li><a href="login.html">Login</a></li>
                        <li><a href="signup.html">Sign Up</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
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
                <span>© 2026 NovaQuiz. All rights reserved.</span> <span>Designed &amp; built with care for focused learning.</span>
            </div>
        </div>
    </footer>

    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    </body>
</html>
</asp:Content>

