<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="NovaQuiz_3.adminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <main class="admin-dashboard">

        <!-- Dashboard Heading -->
        <section class="dashboard-heading">
            <div>
                <span class="dashboard-eyebrow">ADMINISTRATION</span>
                <h1>Dashboard Overview</h1>
                <p>Monitor your NovaQuiz platform at a glance.</p>
            </div>

            <a href="addExam.aspx" class="btn btn-primary">+ Create Exam
            </a>
        </section>

        <!-- Statistics Cards -->
        <section class="stats-grid">

            <article class="stat-card">
                <div class="stat-top">
                    <span>Total Exams</span>
                    <span class="stat-icon purple">▤</span>
                </div>
                <h2>
                    <asp:Label ID="lblTotalExams" runat="server" Text="0" /></h2>
                <p>Total examinations available</p>
                <a href="manageExams.aspx">Manage exams →</a>
            </article>

            <article class="stat-card">
                <div class="stat-top">
                    <span>Total Users</span>
                    <span class="stat-icon blue">♙</span>
                </div>
                <h2>
                    <asp:Label ID="lblTotalUsers" runat="server" Text="0" /></h2>
                <p>Registered platform users</p>
                <a href="manageUsers.aspx">Manage users →</a>
            </article>

            <article class="stat-card">
                <div class="stat-top">
                    <span>Average Accuracy</span>
                    <span class="stat-icon green">◉</span>
                </div>
                <h2>
                    <asp:Label ID="lblAverageAccuracy" runat="server" Text="0.00%" /></h2>
                <p>Average score percentage per attempt</p>
            </article>

            <article class="stat-card">
                <div class="stat-top">
                    <span>Exams per User</span>
                    <span class="stat-icon orange">↗</span>
                </div>
                <h2>
                    <asp:Label ID="lblExamsPerUser" runat="server" Text="0.00" /></h2>
                <p>Average attempts per registered user</p>
            </article>

            <article class="stat-card">
                <div class="stat-top">
                    <span>Total Attempts</span>
                    <span class="stat-icon pink">✓</span>
                </div>
                <h2>
                    <asp:Label ID="lblTotalAttempts" runat="server" Text="0" /></h2>
                <p>Total submitted examination attempts</p>
            </article>

            <article class="stat-card">
                <div class="stat-top">
                    <span>Average Score</span>
                    <span class="stat-icon teal">★</span>
                </div>
                <h2>
                    <asp:Label ID="lblAverageScore" runat="server" Text="0.00" /></h2>
                <p>Average marks earned per attempt</p>
            </article>

        </section>

        <!-- Analytics and Quick Actions -->

        <!-- Recent Exam Activities and Quick Actions -->
        <section class="analytics-grid">

            <!-- Recent Exam Activities -->
            <div class="dashboard-panel">
                <div class="panel-heading">
                    <div>
                        <h2>Recent Exam Activities</h2>
                        <p>Examinations available on NovaQuiz</p>
                    </div>
                    <a href="manageExams.aspx" class="view-all-link">View All →
                    </a>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="GridView1"
                        runat="server"
                        AutoGenerateColumns="False"
                        DataKeyNames="EXAM_ID"
                        DataSourceID="dsExams"
                        CssClass="admin-table"
                        GridLines="None"
                        EmptyDataText="No exams available.">

                        <Columns>
                            <asp:BoundField
                                DataField="EXAM_TITLE"
                                HeaderText="EXAM"
                                SortExpression="EXAM_TITLE" />

                            <asp:BoundField
                                DataField="EXAM_MARKS"
                                HeaderText="TOTAL MARKS"
                                SortExpression="EXAM_MARKS" />

                            <asp:BoundField
                                DataField="TIME_LIMIT"
                                HeaderText="TIME LIMIT"
                                SortExpression="TIME_LIMIT" />

                            <asp:TemplateField HeaderText="STATUS">
                                <ItemTemplate>
                                    <span class="exam-status">
                                        <%# Convert.ToBoolean(Eval("IS_PUBLISHED"))
                                    ? "Published" : "Draft" %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                </div>

                <asp:SqlDataSource ID="dsExams"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT TOP 5 EXAM_ID, EXAM_TITLE, EXAM_MARKS, TIME_LIMIT, IS_PUBLISHED FROM EXAMS ORDER BY EXAM_ID DESC"></asp:SqlDataSource>
            </div>

            <!-- Quick Actions -->
            <div class="dashboard-panel">
                <div class="panel-heading">
                    <div>
                        <h2>Quick Actions</h2>
                        <p>Manage your platform</p>
                    </div>
                </div>

                <div class="quick-actions">

                    <a href="addExam.aspx" class="action-item">
                        <span class="action-symbol purple">＋</span>
                        <span>
                            <strong>Create an Exam</strong>
                            <small>Add a new examination</small>
                        </span>
                        <span class="action-arrow">→</span>
                    </a>

                    <a href="manageExams.aspx" class="action-item">
                        <span class="action-symbol blue">▤</span>
                        <span>
                            <strong>Manage Exams</strong>
                            <small>Edit or remove examinations</small>
                        </span>
                        <span class="action-arrow">→</span>
                    </a>

                    <a href="manageUsers.aspx" class="action-item">
                        <span class="action-symbol green">♙</span>
                        <span>
                            <strong>Manage Users</strong>
                            <small>View registered users</small>
                        </span>
                        <span class="action-arrow">→</span>
                    </a>

                </div>
            </div>

        </section>


        <!-- Recent Exam Activity -->
        <section class="dashboard-panel recent-activity">

            <div class="panel-heading">
                <div>
                    <h2>Recent Exam Activity</h2>
                    <p>Latest recorded examination attempts</p>
                </div>
            </div>

            <div class="table-responsive">

                <asp:GridView ID="gvRecentAttempts"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="admin-table"
                    GridLines="None"
                    EmptyDataText="No exam attempts recorded yet.">

                    <Columns>
                        <asp:BoundField DataField="USER_ID"
                            HeaderText="User ID" />

                        <asp:BoundField DataField="EXAM_ID"
                            HeaderText="Exam ID" />

                        <asp:BoundField DataField="SCORE"
                            HeaderText="Score" />

                        <asp:BoundField DataField="TOTAL_MARKS"
                            HeaderText="Total Marks" />
                    </Columns>

                </asp:GridView>

            </div>
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
            /* ========================================
   NOVAQUIZ ADMIN DASHBOARD
======================================== */

            .admin-dashboard {
                max-width: 1440px;
                margin: 0 auto;
                padding: 40px 5%;
                color: var(--text-primary, #202438);
            }

            /* Dashboard Heading */

            .dashboard-heading {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 24px;
                margin-bottom: 32px;
            }

            .dashboard-eyebrow {
                color: #7161e8;
                font-size: 11px;
                font-weight: 800;
                letter-spacing: 2px;
            }

            .dashboard-heading h1 {
                margin: 8px 0;
                font-size: clamp(26px, 3vw, 36px);
                font-weight: 750;
                letter-spacing: -1px;
            }

            .dashboard-heading p {
                margin: 0;
                color: var(--text-secondary, #7c8194);
                font-size: 14px;
                line-height: 1.7;
            }

            /* ========================================
   STATISTICS CARDS
======================================== */

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(3, minmax(0, 1fr));
                gap: 20px;
                margin-bottom: 28px;
            }

            .stat-card {
                min-width: 0;
                padding: 24px;
                border: 1px solid var(--border-color, #e8eaf1);
                border-radius: 18px;
                background: var(--card-bg, #ffffff);
                box-shadow: 0 5px 22px rgba(30, 35, 70, 0.035);
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }

            /* Recent Exam Activities */

            .view-all-link {
                color: #7161e8;
                font-size: 12px;
                font-weight: 700;
                text-decoration: none;
                white-space: nowrap;
            }

                .view-all-link:hover {
                    text-decoration: underline;
                }

            .exam-status {
                display: inline-block;
                padding: 6px 10px;
                border-radius: 20px;
                background: #e6f8ef;
                color: #249d69;
                font-size: 11px;
                font-weight: 700;
                white-space: nowrap;
            }

            .admin-table {
                width: 100%;
                border-collapse: collapse;
                white-space: nowrap;
            }

                .admin-table th,
                .admin-table td {
                    padding: 14px 12px;
                    border-bottom: 1px solid var(--border-color, #eceef4);
                    text-align: left;
                    font-size: 12px;
                }

                .admin-table th {
                    background: var(--hover-bg, #f8f8fc);
                    color: var(--text-secondary, #73788b);
                    font-size: 11px;
                    font-weight: 700;
                }

                .admin-table tr:last-child td {
                    border-bottom: none;
                }

                .admin-table tr:hover td {
                    background: var(--hover-bg, #fafaff);
                }

            @media (max-width: 600px) {
                .admin-table th,
                .admin-table td {
                    padding: 12px 10px;
                }
            }


            .stat-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 14px 32px rgba(30, 35, 70, 0.09);
            }

            .stat-top {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 12px;
                color: var(--text-secondary, #72788d);
                font-size: 14px;
                font-weight: 600;
            }

            .stat-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                width: 44px;
                height: 44px;
                border-radius: 14px;
                font-size: 22px;
            }

            .purple {
                color: #7161e8;
                background: #f0edff;
            }

            .blue {
                color: #3684e8;
                background: #e9f3ff;
            }

            .green {
                color: #249d69;
                background: #e6f8ef;
            }

            .orange {
                color: #e68a31;
                background: #fff1e3;
            }

            .pink {
                color: #d95a88;
                background: #ffedf3;
            }

            .teal {
                color: #209d9a;
                background: #e1f8f7;
            }

            .stat-card h2 {
                margin: 22px 0 10px;
                font-size: clamp(28px, 3vw, 36px);
                line-height: 1.2;
                font-weight: 750;
                letter-spacing: -1px;
                overflow-wrap: anywhere;
            }

            .stat-card p {
                min-height: 40px;
                margin: 0 0 15px;
                color: var(--text-secondary, #858a9c);
                font-size: 13px;
                line-height: 1.6;
            }

            .stat-card > a {
                display: inline-block;
                color: #7161e8;
                font-size: 13px;
                font-weight: 700;
                text-decoration: none;
            }

                .stat-card > a:hover {
                    text-decoration: underline;
                }

            /* ========================================
   ANALYTICS AND QUICK ACTIONS
======================================== */

            .analytics-grid {
                display: grid;
                grid-template-columns: minmax(0, 1.4fr) minmax(0, 1fr);
                gap: 22px;
                margin-bottom: 28px;
            }

            .dashboard-panel {
                min-width: 0;
                padding: 26px;
                border: 1px solid var(--border-color, #e8eaf1);
                border-radius: 18px;
                background: var(--card-bg, #ffffff);
                box-shadow: 0 5px 22px rgba(30, 35, 70, 0.035);
            }

            .panel-heading {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 16px;
                margin-bottom: 24px;
            }

                .panel-heading h2 {
                    margin: 0 0 7px;
                    font-size: 18px;
                    font-weight: 750;
                    letter-spacing: -0.3px;
                }

                .panel-heading p {
                    margin: 0;
                    color: var(--text-secondary, #7c8194);
                    font-size: 13px;
                    line-height: 1.6;
                }

            .panel-tag {
                padding: 8px 12px;
                border-radius: 9px;
                background: #f0edff;
                color: #7161e8;
                font-size: 11px;
                font-weight: 700;
            }

            /* Analytics Placeholder */

            .analytics-placeholder {
                display: flex;
                min-height: 245px;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 28px;
                border: 1px dashed var(--border-color, #dfe2ec);
                border-radius: 14px;
                text-align: center;
                background: var(--hover-bg, #fafaff);
            }

            .analytics-placeholder-icon {
                display: grid;
                width: 58px;
                height: 58px;
                place-items: center;
                border-radius: 17px;
                background: #f0edff;
                color: #7161e8;
                font-size: 28px;
            }

            .analytics-placeholder h3 {
                margin: 18px 0 8px;
                font-size: 16px;
                font-weight: 700;
            }

            .analytics-placeholder p {
                max-width: 320px;
                margin: 0;
                color: var(--text-secondary, #858a9c);
                font-size: 13px;
                line-height: 1.8;
            }

            /* Quick Actions */

            .quick-actions {
                display: grid;
                gap: 8px;
            }

            .action-item {
                display: flex;
                align-items: center;
                gap: 14px;
                padding: 14px 10px;
                border-radius: 13px;
                color: inherit;
                text-decoration: none;
                transition: background 0.2s ease;
            }

                .action-item:hover {
                    background: var(--hover-bg, #f7f7fc);
                }

            .action-symbol {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                width: 44px;
                height: 44px;
                border-radius: 13px;
                font-size: 22px;
            }

            .action-item > span:nth-child(2) {
                display: grid;
                min-width: 0;
                flex: 1;
                gap: 5px;
            }

            .action-item strong {
                font-size: 13px;
                font-weight: 700;
            }

            .action-item small {
                color: var(--text-secondary, #858a9c);
                font-size: 12px;
                line-height: 1.5;
            }

            .action-arrow {
                color: #858a9c;
                font-size: 20px;
                transition: transform 0.2s ease;
            }

            .action-item:hover .action-arrow {
                transform: translateX(4px);
            }

            /* ========================================
   RECENT EXAM ACTIVITY TABLE
======================================== */

            .recent-activity {
                margin-bottom: 30px;
            }

            .table-responsive {
                width: 100%;
                overflow-x: auto;
                border-radius: 12px;
            }

            .admin-table {
                width: 100%;
                border-collapse: collapse;
                white-space: nowrap;
            }

                .admin-table th,
                .admin-table td {
                    padding: 16px 18px;
                    border-bottom: 1px solid var(--border-color, #eceef4);
                    text-align: left;
                    font-size: 13px;
                }

                .admin-table th {
                    background: var(--hover-bg, #f8f8fc);
                    color: var(--text-secondary, #73788b);
                    font-size: 12px;
                    font-weight: 700;
                }

                .admin-table td {
                    color: var(--text-primary, #33384d);
                }

                .admin-table tr:last-child td {
                    border-bottom: none;
                }

                .admin-table tr:hover td {
                    background: var(--hover-bg, #fafaff);
                }

                /* GridView empty message */

                .admin-table caption {
                    padding: 20px;
                }

            /* ========================================
   RESPONSIVE DESIGN
======================================== */

            @media (max-width: 1050px) {
                .admin-dashboard {
                    padding: 32px 4%;
                }

                .stats-grid {
                    grid-template-columns: repeat(2, minmax(0, 1fr));
                    gap: 16px;
                }

                .analytics-grid {
                    grid-template-columns: 1fr;
                }
            }

            @media (max-width: 600px) {
                .admin-dashboard {
                    padding: 26px 16px;
                }

                .dashboard-heading {
                    align-items: flex-start;
                    flex-direction: column;
                    gap: 18px;
                }

                    .dashboard-heading h1 {
                        font-size: 27px;
                    }

                .stats-grid {
                    grid-template-columns: repeat(2, minmax(0, 1fr));
                    gap: 12px;
                }

                .stat-card {
                    padding: 16px;
                    border-radius: 15px;
                }

                .stat-top {
                    align-items: flex-start;
                    font-size: 12px;
                }

                .stat-icon {
                    width: 34px;
                    height: 34px;
                    border-radius: 11px;
                    font-size: 18px;
                }

                .stat-card h2 {
                    margin: 18px 0 8px;
                    font-size: 26px;
                }

                .stat-card p {
                    min-height: 58px;
                    font-size: 12px;
                }

                .dashboard-panel {
                    padding: 18px;
                    border-radius: 15px;
                }

                .panel-heading h2 {
                    font-size: 16px;
                }

                .analytics-placeholder {
                    min-height: 220px;
                    padding: 20px;
                }

                .action-item {
                    gap: 10px;
                    padding: 12px 4px;
                }

                .action-symbol {
                    width: 38px;
                    height: 38px;
                }

                .admin-table th,
                .admin-table td {
                    padding: 13px;
                }
            }

            @media (max-width: 360px) {
                .stats-grid {
                    grid-template-columns: 1fr;
                }

                .stat-card p {
                    min-height: auto;
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



