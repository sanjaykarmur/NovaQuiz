<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="NovaQuiz_3.AdminLogin" %>

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


        <style>
            /* ==========================================
       NovaQuiz Admin Login - Refined Design
       ========================================== */

            .admin-login-page,
            .admin-login-page * {
                box-sizing: border-box;
            }

            .admin-login-page {
                --admin-primary: #6258e8;
                --admin-primary-dark: #4940c5;
                --admin-text: #18213b;
                --admin-muted: #8991a7;
                position: relative;
                isolation: isolate;
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 690px;
                padding: 64px 24px;
                overflow: hidden;
                background: radial-gradient(ellipse at 10% 15%, rgba(98, 88, 232, .10), transparent 35%), radial-gradient(ellipse at 95% 90%, rgba(59, 130, 246, .10), transparent 34%), #f5f7fc;
            }

                .admin-login-page::before,
                .admin-login-page::after {
                    content: "";
                    position: absolute;
                    z-index: -1;
                    border: 1px solid rgba(98, 88, 232, .10);
                    border-radius: 50%;
                    pointer-events: none;
                }

                .admin-login-page::before {
                    width: 420px;
                    height: 420px;
                    top: -230px;
                    left: -140px;
                }

                .admin-login-page::after {
                    width: 560px;
                    height: 560px;
                    right: -280px;
                    bottom: -330px;
                }

            /* Main two-column container */

            .admin-login-layout {
                display: grid;
                grid-template-columns: 1fr 440px;
                width: 100%;
                max-width: 1050px;
                min-height: 570px;
                overflow: hidden;
                background: #fff;
                border: 1px solid #e7eaf3;
                border-radius: 26px;
                box-shadow: 0 30px 90px rgba(31, 41, 82, .12);
                animation: adminLoginEnter .5s ease both;
            }

            /* Left information panel */

            .admin-login-intro {
                position: relative;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                padding: 43px;
                overflow: hidden;
                color: #fff;
                background: radial-gradient(circle at 100% 0%, rgba(255,255,255,.13), transparent 34%), linear-gradient(145deg, #25275f 0%, #38358e 48%, #5147cf 100%);
            }

                .admin-login-intro::before {
                    content: "";
                    position: absolute;
                    width: 290px;
                    height: 290px;
                    right: -125px;
                    bottom: -115px;
                    border: 1px solid rgba(255,255,255,.14);
                    border-radius: 50%;
                    box-shadow: 0 0 0 35px rgba(255,255,255,.025), 0 0 0 70px rgba(255,255,255,.025);
                    pointer-events: none;
                }

                .admin-login-intro > * {
                    position: relative;
                    z-index: 1;
                }

            .admin-login-brand {
                display: inline-flex;
                align-items: center;
                gap: 12px;
                color: #fff;
                font-size: 23px;
                font-weight: 800;
                letter-spacing: -.7px;
            }

            .admin-login-brand-mark {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 43px;
                height: 43px;
                flex-shrink: 0;
                color: #fff;
                background: rgba(255,255,255,.14);
                border: 1px solid rgba(255,255,255,.23);
                border-radius: 13px;
            }

                .admin-login-brand-mark svg {
                    width: 25px;
                    height: 25px;
                }

            .admin-login-intro-content {
                max-width: 390px;
                padding: 40px 0;
            }

            .admin-login-intro-eyebrow {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                margin-bottom: 21px;
                padding: 8px 12px;
                color: #e4e2ff;
                background: rgba(255,255,255,.09);
                border: 1px solid rgba(255,255,255,.14);
                border-radius: 30px;
                font-size: 10px;
                font-weight: 800;
                letter-spacing: 1.5px;
            }

            .admin-login-status-dot {
                width: 7px;
                height: 7px;
                background: #6ee7b7;
                border-radius: 50%;
                box-shadow: 0 0 0 4px rgba(110,231,183,.13);
            }

            .admin-login-intro h2 {
                margin: 0 0 18px;
                color: #fff;
                font-size: clamp(34px, 4vw, 47px);
                line-height: 1.14;
                letter-spacing: -1.8px;
                font-weight: 800;
            }

                .admin-login-intro h2 span {
                    color: #bcb8ff;
                }

            .admin-login-intro-content > p {
                max-width: 345px;
                margin: 0;
                color: #d0d0f0;
                font-size: 14px;
                line-height: 1.9;
            }

            .admin-login-feature-list {
                display: grid;
                gap: 17px;
                margin: 30px 0 0;
                padding: 0;
                list-style: none;
            }

            .admin-login-feature {
                display: flex;
                align-items: center;
                gap: 12px;
                color: #f0efff;
                font-size: 12px;
                font-weight: 600;
            }

            .admin-login-feature-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 33px;
                height: 33px;
                flex-shrink: 0;
                color: #d8d5ff;
                background: rgba(255,255,255,.10);
                border: 1px solid rgba(255,255,255,.12);
                border-radius: 10px;
            }

                .admin-login-feature-icon svg {
                    width: 17px;
                    height: 17px;
                }

            .admin-login-intro-footer {
                display: flex;
                justify-content: space-between;
                gap: 12px;
                padding-top: 22px;
                border-top: 1px solid rgba(255,255,255,.15);
                color: #c7c7eb;
                font-size: 10px;
            }

            /* Right login panel */

            .admin-login-panel {
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding: 43px 35px;
                background: #fff;
            }

            .admin-login-heading {
                margin-bottom: 29px;
            }

                .admin-login-heading .admin-login-eyebrow {
                    margin-bottom: 14px;
                    padding: 7px 10px;
                    color: #5449d4;
                    background: #f0efff;
                    border: 0;
                    border-radius: 6px;
                    font-size: 10px;
                    letter-spacing: 1.2px;
                }

                .admin-login-heading h1 {
                    margin: 0 0 10px;
                    color: var(--admin-text);
                    font-size: 29px;
                    font-weight: 800;
                    line-height: 1.25;
                    letter-spacing: -1px;
                }

                .admin-login-heading p {
                    margin: 0;
                    color: var(--admin-muted);
                    font-size: 12px;
                    line-height: 1.8;
                }

            .admin-login-form {
                display: flex;
                flex-direction: column;
                gap: 19px;
            }

            .admin-login-field {
                display: flex;
                flex-direction: column;
                gap: 9px;
            }

                .admin-login-field label {
                    color: #343d55;
                    font-size: 12px;
                    font-weight: 750;
                }

            .admin-login-input-wrap {
                position: relative;
            }

            .admin-login-input {
                display: block;
                width: 100%;
                height: 49px;
                padding: 0 14px;
                outline: none;
                border: 1px solid #e1e5ef;
                border-radius: 10px;
                background: #fafbfe;
                color: #202943;
                font-family: inherit;
                font-size: 13px;
                transition: border-color .2s, box-shadow .2s, background .2s;
            }

                .admin-login-input::placeholder {
                    color: #a1a9ba;
                }

                .admin-login-input:hover {
                    border-color: #c8cce0;
                }

                .admin-login-input:focus {
                    background: #fff;
                    border-color: var(--admin-primary);
                    box-shadow: 0 0 0 4px rgba(98,88,232,.10);
                }

            .admin-login-password {
                padding-right: 65px;
            }

            .admin-login-toggle {
                position: absolute;
                top: 50%;
                right: 12px;
                transform: translateY(-50%);
                padding: 5px;
                border: 0;
                background: transparent;
                color: var(--admin-primary);
                font-family: inherit;
                font-size: 11px;
                font-weight: 800;
                cursor: pointer;
            }

                .admin-login-toggle:hover {
                    color: var(--admin-primary-dark);
                }

            .admin-login-error {
                display: block;
                padding: 11px 13px;
                color: #b42335;
                background: #fff1f2;
                border: 1px solid #fecdd3;
                border-radius: 9px;
                font-size: 12px;
                line-height: 1.6;
            }

            .admin-login-submit {
                width: 100%;
                min-height: 49px;
                margin-top: 2px;
                padding: 13px 15px;
                border: 0;
                border-radius: 10px;
                background: linear-gradient(120deg, #665ce9, #4940c5);
                color: #fff;
                font-family: inherit;
                font-size: 12px;
                font-weight: 800;
                letter-spacing: .2px;
                cursor: pointer;
                box-shadow: 0 8px 18px rgba(79,70,229,.20);
                transition: transform .2s, box-shadow .2s, filter .2s;
            }

                .admin-login-submit:hover {
                    transform: translateY(-2px);
                    filter: brightness(1.05);
                    box-shadow: 0 12px 24px rgba(79,70,229,.26);
                }

                .admin-login-submit:active {
                    transform: translateY(0);
                }

            .admin-login-divider {
                height: 1px;
                margin: 25px 0 17px;
                background: #edf0f6;
            }

            .admin-login-footer {
                color: #9299aa;
                text-align: center;
                font-size: 11px;
                line-height: 1.8;
            }

                .admin-login-footer a {
                    color: var(--admin-primary);
                    font-weight: 750;
                    text-decoration: none;
                }

                    .admin-login-footer a:hover {
                        text-decoration: underline;
                    }

            .admin-login-security {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 7px;
                margin-top: 23px;
                color: #858da0;
                text-align: center;
                font-size: 10px;
                line-height: 1.6;
            }

                .admin-login-security svg {
                    width: 15px;
                    height: 15px;
                    flex-shrink: 0;
                    color: #16a34a;
                }

            @keyframes adminLoginEnter {
                from {
                    opacity: 0;
                    transform: translateY(12px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Responsive layout */

            @media (max-width: 850px) {
                .admin-login-page {
                    min-height: 650px;
                    padding: 35px 18px;
                }

                .admin-login-layout {
                    max-width: 490px;
                    grid-template-columns: 1fr;
                }

                .admin-login-intro {
                    padding: 28px 30px;
                }

                .admin-login-intro-content {
                    padding: 30px 0 20px;
                }

                .admin-login-intro h2 {
                    max-width: 370px;
                    font-size: 34px;
                }

                .admin-login-intro-content > p {
                    max-width: 400px;
                }

                .admin-login-feature-list {
                    grid-template-columns: 1fr 1fr;
                    gap: 12px;
                    margin-top: 22px;
                }

                .admin-login-intro-footer {
                    margin-top: 12px;
                }

                .admin-login-panel {
                    padding: 34px 30px;
                }
            }

            @media (max-width: 480px) {
                .admin-login-page {
                    min-height: auto;
                    padding: 25px 12px;
                }

                .admin-login-layout {
                    border-radius: 18px;
                }

                .admin-login-intro {
                    padding: 24px 22px;
                }

                .admin-login-brand {
                    font-size: 21px;
                }

                .admin-login-intro-content {
                    padding: 26px 0 19px;
                }

                .admin-login-intro h2 {
                    font-size: 30px;
                    letter-spacing: -1px;
                }

                .admin-login-intro-content > p {
                    font-size: 12px;
                }

                .admin-login-feature-list {
                    grid-template-columns: 1fr;
                    gap: 10px;
                }

                .admin-login-intro-footer {
                    flex-wrap: wrap;
                }

                .admin-login-panel {
                    padding: 30px 22px;
                }

                .admin-login-heading h1 {
                    font-size: 27px;
                }
            }

            @media (prefers-reduced-motion: reduce) {
                .admin-login-layout {
                    animation: none;
                }

                .admin-login-input,
                .admin-login-submit {
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
                    <%--   <button class="theme-toggle" data-theme-toggle aria-label="Toggle dark and light mode">
                        <svg class="icon-moon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" />
                        </svg>
                        <svg class="icon-sun" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="4" />
                            <path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41" />
                        </svg>
                    </button>
                    --%> <div id="authButtons" runat="server">
                        <a href="login.aspx" class="btn btn-ghost">Login</a> <a href="signup.aspx" class="btn btn-primary btn-sm">Sign Up</a>
                    </div>
                </div>
                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <%--MAin--%>


    <main class="admin-login-page">

        <section class="admin-login-layout">

            <!-- LEFT: BRAND AND ADMIN INFORMATION -->
            <aside class="admin-login-intro">

                <div class="admin-login-brand">
                    <span class="admin-login-brand-mark">
                        <svg viewBox="0 0 24 24"
                            fill="none"
                            stroke="currentColor"
                            stroke-width="1.8"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            aria-hidden="true">
                            <path d="M12 3 20 7v5c0 5-3.5 8-8 9-4.5-1-8-4-8-9V7l8-4z" />
                            <path d="m9 12 2 2 4-4" />
                        </svg>
                    </span>
                    <span>NovaQuiz</span>
                </div>

                <div class="admin-login-intro-content">

                    <span class="admin-login-intro-eyebrow">
                        <span class="admin-login-status-dot"></span>
                        ADMIN CONTROL CENTER
                    </span>

                    <h2>Manage smarter.<br />
                        <span>Assess better.</span>
                    </h2>

                    <p>
                        Your central workspace for managing exams,
                    organizing questions, and overseeing the
                    NovaQuiz examination platform.
                    </p>

                    <ul class="admin-login-feature-list">

                        <li class="admin-login-feature">
                            <span class="admin-login-feature-icon">
                                <svg viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="1.8"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    aria-hidden="true">
                                    <rect x="3" y="4" width="18" height="16" rx="2" />
                                    <path d="M8 9h8M8 13h5" />
                                </svg>
                            </span>
                            Exam management
                        </li>

                        <li class="admin-login-feature">
                            <span class="admin-login-feature-icon">
                                <svg viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="1.8"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    aria-hidden="true">
                                    <path d="M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
                                    <circle cx="10" cy="7" r="4" />
                                    <path d="M20 21v-2a4 4 0 0 0-3-3.87" />
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75" />
                                </svg>
                            </span>
                            User administration
                        </li>

                        <li class="admin-login-feature">
                            <span class="admin-login-feature-icon">
                                <svg viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="1.8"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    aria-hidden="true">
                                    <path d="M4 19V5" />
                                    <path d="M4 19h17" />
                                    <path d="m7 15 4-4 3 2 5-6" />
                                </svg>
                            </span>
                            Examination oversight
                        </li>

                    </ul>
                </div>

                <div class="admin-login-intro-footer">
                    <span>NovaQuiz Administration</span>
                    <span>College Project</span>
                </div>

            </aside>

            <!-- RIGHT: LOGIN FORM -->
            <section class="admin-login-panel">

                <div class="admin-login-heading">

                    <span class="admin-login-eyebrow">ADMINISTRATOR SIGN IN
                    </span>

                    <h1>Welcome back</h1>

                    <p>
                        Enter your administrator credentials to
                    continue to your dashboard.
                    </p>

                </div>

                <div class="admin-login-form">

                    <!-- USERNAME -->
                    <div class="admin-login-field">

                        <asp:Label
                            ID="lblUsernameTitle"
                            runat="server"
                            AssociatedControlID="txtUsername"
                            Text="Username" />

                        <div class="admin-login-input-wrap">

                            <asp:TextBox
                                ID="txtUsername"
                                runat="server"
                                CssClass="admin-login-input"
                                placeholder="Enter admin username"
                                MaxLength="50"
                                autocomplete="username" />

                        </div>

                    </div>

                    <!-- PASSWORD -->
                    <div class="admin-login-field">

                        <asp:Label
                            ID="lblPasswordTitle"
                            runat="server"
                            AssociatedControlID="txtPassword"
                            Text="Password" />

                        <div class="admin-login-input-wrap">

                            <asp:TextBox
                                ID="txtPassword"
                                runat="server"
                                CssClass="admin-login-input admin-login-password"
                                TextMode="Password"
                                placeholder="Enter admin password"
                                MaxLength="100"
                                autocomplete="current-password" />

                            <button
                                type="button"
                                class="admin-login-toggle"
                                id="toggleAdminPassword"
                                aria-controls="<%= txtPassword.ClientID %>"
                                aria-label="Show password"
                                aria-pressed="false">
                                Show
                            </button>

                        </div>

                    </div>

                    <!-- ERROR MESSAGE -->
                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        CssClass="admin-login-error"
                        Visible="false"
                        EnableViewState="false"
                        role="alert" />

                    <!-- LOGIN BUTTON -->
                    <asp:Button
                        ID="btnLogin"
                        runat="server"
                        Text="Sign In to Dashboard  →"
                        CssClass="admin-login-submit"
                        OnClick="btnLogin_Click"
                        CausesValidation="true" />

                </div>

                <div class="admin-login-divider"></div>

                <div class="admin-login-footer">
                    Having trouble signing in?
                <a href="contact.aspx">Contact support</a>
                </div>

                <div class="admin-login-security">

                    <svg viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        aria-hidden="true">
                        <rect x="4" y="10" width="16" height="11" rx="2" />
                        <path d="M8 10V7a4 4 0 0 1 8 0v3" />
                        <path d="m10 15 2 2 3-4" />
                    </svg>

                    Authorized administrators only

                </div>

            </section>

        </section>

    </main>

    <script>
(function () {
    var password = document.getElementById(
        '<%= txtPassword.ClientID %>'
    );

    var toggle = document.getElementById(
        'toggleAdminPassword'
    );

    if (!password || !toggle) {
        return;
    }

    toggle.addEventListener('click', function () {

        var showPassword = password.type === 'password';

        password.type = showPassword ? 'text' : 'password';

        toggle.textContent = showPassword ? 'Hide' : 'Show';

        toggle.setAttribute(
            'aria-pressed',
            String(showPassword)
        );

        toggle.setAttribute(
            'aria-label',
            showPassword ? 'Hide password' : 'Show password'
        );

    });
})();
    </script>

</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ===================== FOOTER ===================== -->


    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    </body>
</html>
</asp:Content>

