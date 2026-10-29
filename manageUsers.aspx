<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="manageUsers.aspx.cs" Inherits="NovaQuiz_3.manageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <main class="admin-dashboard">

        <!-- Page Heading -->
        <section class="dashboard-heading">
            <div>
                <span class="dashboard-eyebrow">USER MANAGEMENT</span>
                <h1>Manage Users</h1>
                <p>View and manage registered NovaQuiz users.</p>
            </div>

            <a href="adminDashboard.aspx" class="btn btn-primary">← Dashboard
            </a>
        </section>

        <!-- User Statistics -->
        <section class="stats-grid">

            <article class="stat-card">
                <div class="stat-top">
                    <span>Total Users</span>
                    <span class="stat-icon blue">♙</span>
                </div>
                <h2>
                    <asp:Label ID="lblTotalUsers" runat="server" Text="0" />
                </h2>
                <p>Total registered users</p>
            </article>

            <article class="stat-card">
                <div class="stat-top">
                    <span>Users With Email</span>
                    <span class="stat-icon purple">✉</span>
                </div>
                <h2>
                    <asp:Label ID="lblUsersWithEmail" runat="server" Text="0" />
                </h2>
                <p>Accounts with an email address</p>
            </article>

            <article class="stat-card">
                <div class="stat-top">
                    <span>Users With Mobile</span>
                    <span class="stat-icon green">☎</span>
                </div>
                <h2>
                    <asp:Label ID="lblUsersWithMobile" runat="server" Text="0" />
                </h2>
                <p>Accounts with a mobile number</p>
            </article>

        </section>

        <!-- Users Table -->
        <section class="dashboard-panel users-panel">

            <div class="panel-heading">
                <div>
                    <h2>Registered Users</h2>
                    <p>Browse and manage user accounts</p>
                </div>
            </div>

            <!-- Search -->
            <asp:Panel ID="pnlUserSearch" runat="server" CssClass="user-search" DefaultButton="btnSearchUser">
                <asp:TextBox ID="txtSearchUser"
                    runat="server"
                    CssClass="user-search-input"
                    placeholder="Search by name, username, email or mobile..."
                    MaxLength="100" />

                <asp:Button ID="btnSearchUser"
                    runat="server"
                    Text="Search"
                    CssClass="btn btn-primary"
                    OnClick="btnSearchUser_Click" />

                <asp:Button ID="btnClearSearch"
                    runat="server"
                    Text="Clear"
                    CssClass="btn btn-secondary"
                    CausesValidation="false"
                    OnClick="btnClearSearch_Click" />
            </asp:Panel>

            <div class="table-responsive">

                <asp:GridView ID="GridViewUsers"
                    runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="ID"
                    DataSourceID="dsUsers"
                    CssClass="admin-table"
                    GridLines="None"
                    EmptyDataText="No users found."
                    AllowPaging="True"
                    PageSize="10">

                    <Columns>

                        <asp:BoundField
                            DataField="ID"
                            HeaderText="USER ID" />

                        <asp:BoundField
                            DataField="FULLNAME"
                            HeaderText="FULL NAME" />

                        <asp:BoundField
                            DataField="USERNAME"
                            HeaderText="USERNAME" />

                        <asp:BoundField
                            DataField="EMAIL"
                            HeaderText="EMAIL" />

                        <asp:BoundField
                            DataField="MOBILE"
                            HeaderText="MOBILE" />

                        <asp:TemplateField HeaderText="ACTION">
                            <ItemTemplate>
                                <asp:LinkButton
                                    ID="btnUpdateUser"
                                    runat="server"
                                    Text="Update"
                                    CssClass="manage-user-btn"
                                    CausesValidation="false"
                                    PostBackUrl='<%# "updateUser.aspx?ID=" + Eval("ID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <PagerStyle CssClass="users-pager" />

                </asp:GridView>

            </div>

            <!-- Users Data Source -->
            <asp:SqlDataSource ID="dsUsers"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT ID, FULLNAME, USERNAME, EMAIL, MOBILE FROM USERS ORDER BY ID DESC"></asp:SqlDataSource>

        </section>

    </main>

</asp:Content>


<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ===================== FOOTER ===================== -->

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

        <style>
            /* ==========================================
   NOVAQUIZ — MANAGE USERS
   Modern Admin UI
========================================== */

            .users-page,
            .admin-dashboard {
                --users-accent: #7161e8;
                --users-text: var(--text-primary, #202438);
                --users-muted: var(--text-secondary, #7c8194);
                --users-border: var(--border-color, #e8eaf1);
                --users-card: var(--card-bg, #ffffff);
                color: var(--users-text);
            }

            /* Page layout */

            .admin-dashboard {
                max-width: 1440px;
                margin: 0 auto;
                padding: 40px 5%;
            }

            /* Heading */

            .dashboard-heading {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 24px;
                margin-bottom: 34px;
            }

            .dashboard-eyebrow {
                display: inline-block;
                color: var(--users-accent);
                font-size: 11px;
                font-weight: 800;
                letter-spacing: 2px;
            }

            .dashboard-heading h1 {
                margin: 9px 0;
                font-size: clamp(27px, 3vw, 36px);
                font-weight: 800;
                letter-spacing: -1px;
            }

            .dashboard-heading p {
                margin: 0;
                color: var(--users-muted);
                font-size: 14px;
                line-height: 1.7;
            }


            /* User row action */
            .manage-user-btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 7px 14px;
                border-radius: 8px;
                background: #e8efff;
                color: #3156c9;
                border: 1px solid #d4e0ff;
                font-size: 13px;
                font-weight: 600;
                text-decoration: none;
                white-space: nowrap;
                transition: background 0.2s ease, color 0.2s ease;
            }

                .manage-user-btn:hover {
                    background: #3156c9;
                    color: #ffffff;
                }


            /* ==========================================
   USER STATISTICS
========================================== */

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(3, minmax(0, 1fr));
                gap: 22px;
                margin-bottom: 30px;
            }

            .stat-card {
                position: relative;
                min-width: 0;
                overflow: hidden;
                padding: 26px;
                border: 1px solid var(--users-border);
                border-radius: 20px;
                background: var(--users-card);
                box-shadow: 0 5px 25px rgba(30, 35, 70, 0.035);
                transition: transform 0.22s ease, box-shadow 0.22s ease, border-color 0.22s ease;
            }

                .stat-card:hover {
                    transform: translateY(-5px);
                    border-color: rgba(113, 97, 232, 0.3);
                    box-shadow: 0 15px 35px rgba(30, 35, 70, 0.09);
                }

            .stat-top {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 12px;
                color: var(--users-muted);
                font-size: 14px;
                font-weight: 650;
            }

            .stat-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                width: 48px;
                height: 48px;
                border-radius: 15px;
                font-size: 23px;
            }

            .stat-card h2 {
                margin: 22px 0 9px;
                font-size: clamp(30px, 3vw, 38px);
                font-weight: 800;
                line-height: 1.15;
                letter-spacing: -1px;
                overflow-wrap: anywhere;
            }

            .stat-card p {
                margin: 0;
                color: var(--users-muted);
                font-size: 13px;
                line-height: 1.7;
            }

            /* Icon themes */

            .purple {
                color: #7161e8;
                background: #f0edff;
            }

            .blue {
                color: #3282e7;
                background: #e9f3ff;
            }

            .green {
                color: #239b67;
                background: #e5f8ed;
            }

            .orange {
                color: #dd872d;
                background: #fff0df;
            }

            .pink {
                color: #d95586;
                background: #ffedf3;
            }

            .teal {
                color: #168f8b;
                background: #e1f8f6;
            }

            /* ==========================================
   USERS PANEL
========================================== */

            .users-panel {
                min-width: 0;
                margin-bottom: 32px;
                padding: 28px;
                border: 1px solid var(--users-border);
                border-radius: 20px;
                background: var(--users-card);
                box-shadow: 0 5px 25px rgba(30, 35, 70, 0.035);
            }

            .panel-heading {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 18px;
                margin-bottom: 25px;
            }

                .panel-heading h2 {
                    margin: 0 0 8px;
                    font-size: 20px;
                    font-weight: 800;
                    letter-spacing: -0.4px;
                }

                .panel-heading p {
                    margin: 0;
                    color: var(--users-muted);
                    font-size: 13px;
                    line-height: 1.6;
                }

            /* ==========================================
   SEARCH BAR
========================================== */

            .user-search {
                display: flex;
                align-items: center;
                flex-wrap: wrap;
                gap: 12px;
                margin-bottom: 24px;
                padding: 15px;
                border: 1px solid var(--users-border);
                border-radius: 15px;
                background: var(--hover-bg, #fafaff);
            }

            .user-search-input {
                flex: 1;
                min-width: 220px;
                height: 46px;
                padding: 0 15px;
                border: 1px solid var(--users-border);
                border-radius: 11px;
                outline: none;
                background: var(--users-card);
                color: var(--users-text);
                font-family: inherit;
                font-size: 13px;
                transition: border-color 0.2s ease, box-shadow 0.2s ease;
            }

                .user-search-input::placeholder {
                    color: #9a9eb0;
                }

                .user-search-input:focus {
                    border-color: var(--users-accent);
                    box-shadow: 0 0 0 4px rgba(113, 97, 232, 0.12);
                }

            /* Search and clear buttons */

            .user-search .btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                min-height: 44px;
                padding: 0 19px;
                border: 0;
                border-radius: 10px;
                font-family: inherit;
                font-size: 13px;
                font-weight: 700;
                cursor: pointer;
                transition: transform 0.18s ease, box-shadow 0.18s ease;
            }

                .user-search .btn:hover {
                    transform: translateY(-1px);
                }

            .user-search .btn-primary {
                background: #7161e8;
                color: #ffffff;
                box-shadow: 0 4px 12px rgba(113, 97, 232, 0.2);
            }

                .user-search .btn-primary:hover {
                    box-shadow: 0 7px 18px rgba(113, 97, 232, 0.28);
                }

            .user-search .btn-secondary {
                border: 1px solid var(--users-border);
                background: var(--users-card);
                color: var(--users-text);
            }

            /* ==========================================
   USERS TABLE
========================================== */

            .table-responsive {
                width: 100%;
                overflow-x: auto;
                border: 1px solid var(--users-border);
                border-radius: 14px;
            }

            .admin-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                white-space: nowrap;
            }

                .admin-table th {
                    padding: 17px 20px;
                    border-bottom: 1px solid var(--users-border);
                    background: var(--hover-bg, #f8f8fc);
                    color: var(--users-muted);
                    font-size: 11px;
                    font-weight: 800;
                    letter-spacing: 0.7px;
                    text-align: left;
                    text-transform: uppercase;
                }

                .admin-table td {
                    padding: 17px 20px;
                    border-bottom: 1px solid var(--users-border);
                    background: var(--users-card);
                    color: var(--users-text);
                    font-size: 13px;
                    text-align: left;
                    transition: background 0.15s ease;
                }

                .admin-table tr:last-child td {
                    border-bottom: none;
                }

                .admin-table tr:hover td {
                    background: var(--hover-bg, #fafaff);
                }

                /* User ID column */

                .admin-table td:first-child {
                    color: var(--users-accent);
                    font-weight: 750;
                }

                /* Empty GridView message */

                .admin-table td[colspan] {
                    padding: 35px 20px;
                    color: var(--users-muted);
                    text-align: center;
                }

            /* ==========================================
   GRIDVIEW PAGINATION
========================================== */

            .users-pager td {
                padding: 18px 12px;
                border-top: 1px solid var(--users-border);
                background: var(--users-card);
                text-align: center;
            }

            .users-pager a,
            .users-pager span {
                display: inline-block;
                min-width: 34px;
                margin: 2px;
                padding: 9px 11px;
                border-radius: 9px;
                font-size: 12px;
                font-weight: 700;
                text-align: center;
                text-decoration: none;
            }

            .users-pager a {
                background: var(--hover-bg, #f7f7fc);
                color: var(--users-text);
            }

                .users-pager a:hover {
                    background: #efecff;
                    color: var(--users-accent);
                }

            .users-pager span {
                background: var(--users-accent);
                color: #ffffff;
            }

            /* ==========================================
   RESPONSIVE DESIGN
========================================== */

            @media (max-width: 1000px) {
                .admin-dashboard {
                    padding: 32px 4%;
                }

                .stats-grid {
                    grid-template-columns: repeat(2, minmax(0, 1fr));
                    gap: 16px;
                }
            }

            @media (max-width: 600px) {
                .admin-dashboard {
                    padding: 25px 15px;
                }

                .dashboard-heading {
                    align-items: flex-start;
                    flex-direction: column;
                    gap: 18px;
                }

                    .dashboard-heading h1 {
                        font-size: 28px;
                    }

                .stats-grid {
                    gap: 12px;
                }

                .stat-card {
                    padding: 17px;
                    border-radius: 15px;
                }

                .stat-top {
                    align-items: flex-start;
                    font-size: 12px;
                }

                .stat-icon {
                    width: 36px;
                    height: 36px;
                    border-radius: 11px;
                    font-size: 19px;
                }

                .stat-card h2 {
                    margin: 19px 0 8px;
                    font-size: 28px;
                }

                .stat-card p {
                    font-size: 12px;
                }

                .users-panel {
                    padding: 17px;
                    border-radius: 16px;
                }

                .panel-heading h2 {
                    font-size: 18px;
                }

                .user-search {
                    align-items: stretch;
                    flex-direction: column;
                    padding: 12px;
                }

                .user-search-input {
                    box-sizing: border-box;
                    width: 100%;
                    min-width: 0;
                }

                .user-search .btn {
                    width: 100%;
                }

                .admin-table th,
                .admin-table td {
                    padding: 14px;
                }
            }

            @media (max-width: 360px) {
                .stats-grid {
                    grid-template-columns: 1fr;
                }
            }

            /* Respect reduced-motion preferences */

            @media (prefers-reduced-motion: reduce) {
                .stat-card,
                .user-search-input,
                .user-search .btn,
                .admin-table td {
                    transition: none;
                }

                    .stat-card:hover,
                    .user-search .btn:hover {
                        transform: none;
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
                            <path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41" />
                        </svg>
                    </button>
                    --%> <div id="authButtons" runat="server">
                        <asp:Button ID="btnLogout" runat="server" Text="Logout" class="btn btn-primary btn-sm" Click="btnLogout_Click" OnClick="btnLogout_Click" />
                    </div>
                </div>
                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>



