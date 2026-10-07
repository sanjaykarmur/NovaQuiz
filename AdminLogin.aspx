<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="NovaQuiz_3.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>NovaQuiz — Online Examination Platform</title>
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
                                <div ID="authButtons" runat="server">
                                    <a href="login.aspx" class="btn btn-ghost">Login</a> <a href="signup.aspx" class="btn btn-primary btn-sm">Sign Up</a>
                                </div>
                            </div>
                            <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                                <span></span>
                            </button>
                        </div>
                    </header>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">

</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
                <!-- ===================== FOOTER ===================== -->
             

                <script src="js/auth.js"></script>
                <script src="js/app.js"></script>
</body>
</html>
</asp:Content>

