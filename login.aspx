<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="NovaQuiz_3.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">


    <main class="auth-wrap">
        <div class="glass auth-card reveal in">
            <div class="auth-head">
                <span class="logo-dot" style="display: inline-block; margin-bottom: 14px;"></span>
                <h1>Welcome back</h1>
                <p>Log in to continue your exam prep.</p>
            </div>

            <form id="loginForm" novalidate>
                <div class="form-group">
                    <label for="email">Email</label>
                    <%--    <input type="text" id="email" placeholder="you@example.com" autocomplete="username">--%>
                    <asp:TextBox ID="TextBox1" placeholder="you@example.com" runat="server" OnTextChanged="TextBox1_TextChanged" TextMode="Email"></asp:TextBox>
                    <%--<asp:Label runat="server" ID="Label1" Text="Label"></asp:Label>--%>
                    <span class="field-hint"></span>
                </div>
                <div class="form-group password-field">
                    <label for="password">Password</label>
                    <%-- <input type="password" id="password" placeholder="••••••••" autocomplete="current-password">--%>
                    <asp:TextBox ID="TextBox2" placeholder="********" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" ForeColor="#CC0000"></asp:Label>
                    <span class="field-hint"></span>
                    <%--       <button type="button" class="toggle-password" data-toggle-password aria-label="Show password">
          <svg class="icon-show" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7-11-7-11-7z"/><circle cx="12" cy="12" r="3"/></svg>
          <svg class="icon-hide" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17.94 17.94A10.9 10.9 0 0112 20c-7 0-11-8-11-8a20.3 20.3 0 015.06-5.94M9.9 4.24A10.6 10.6 0 0112 4c7 0 11 8 11 8a20.4 20.4 0 01-3.22 4.36M1 1l22 22"/></svg>
        </button>--%>
                    <span class="field-hint"></span>
                </div>
                <div class="form-between">
                    <label class="form-check">
                        <input type="checkbox" id="remember">Remember me</label>
                    <a href="#" data-forgot-password>Forgot password?</a>
                </div>
                <%--<button type="submit" class="btn btn-primary btn-block">Log In</button>--%>
                <asp:Button class="btn btn-primary btn-block" runat="server" ID="Button1" Text="LOGIN" OnClick="Button1_Click" />
            </form>

            <div class="auth-divider">or continue with</div>
            <div class="social-row-auth">
                <button type="button" class="social-login-btn">
                    <svg viewBox="0 0 24 24">
                        <path fill="#EA4335" d="M12 10.2v3.9h5.5c-.2 1.4-1.7 4.2-5.5 4.2-3.3 0-6-2.7-6-6.1s2.7-6.1 6-6.1c1.9 0 3.1.8 3.9 1.5l2.6-2.5C16.9 3.5 14.7 2.5 12 2.5 6.8 2.5 2.6 6.7 2.6 12S6.8 21.5 12 21.5c6.9 0 9.3-4.9 9.3-7.4 0-.5 0-.9-.1-1.3H12z" />
                    </svg>Google</button>
                <button type="button" class="social-login-btn">
                    <svg viewBox="0 0 24 24" fill="#1877F2">
                        <path d="M13.5 21v-8h2.7l.4-3.2h-3V7.7c0-.9.3-1.5 1.6-1.5H17V3.4c-.3 0-1.2-.1-2.3-.1-2.4 0-4 1.5-4 4.1v2.4H8v3.2h2.7V21z" />
                    </svg>Facebook</button>
            </div>

            <p class="auth-footer-text">Don't have an account? <a href="signup.aspx">Sign up free</a></p>
        </div>
    </main>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ===================== FOOTER ===================== -->
<%--    <footer class="footer">
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
    </footer>--%>

    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    </body>
</html>
</asp:Content>


<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NovaQuiz — Online Examination Platform</title>
        <meta name="description" content="NovaQuiz is a modern online examination platform for timed practice tests, instant results and progress tracking.">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/auth.css">
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
                    <button type="button" class="theme-toggle" data-theme-toggle aria-label="Toggle dark and light mode">
                        <svg class="icon-moon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" />
                        </svg>
                        <svg class="icon-sun" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="4" />
                            <path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41" />
                        </svg>
                    </button>
                 <%--   <a href="login.aspx" class="btn btn-ghost" data-nav="login">Login</a> <a href="signup.aspx" class="btn btn-primary btn-sm" data-nav="signup">Sign Up</a>--%>
                </div>
                <button type="button" class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>




