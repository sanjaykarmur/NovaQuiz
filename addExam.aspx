<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="addExam.aspx.cs" Inherits="NovaQuiz_3.addExam" %>

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
            /* ===================== ADD EXAM PAGE ===================== */

            .add-exam-page {
                width: min(1180px, calc(100% - 48px));
                margin: 0 auto;
                padding: 40px 0 65px;
                box-sizing: border-box;
            }

            /* Page Heading */
            .add-exam-heading {
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 20px;
                margin-bottom: 32px;
            }

                .add-exam-heading .heading-eyebrow {
                    display: inline-block;
                    margin-bottom: 10px;
                    color: #6257d9;
                    font-size: 12px;
                    font-weight: 750;
                    letter-spacing: 1.5px;
                }

                .add-exam-heading h1 {
                    margin: 0 0 10px;
                    color: #202642;
                    font-size: clamp(28px, 3vw, 36px);
                    font-weight: 750;
                    line-height: 1.2;
                }

                .add-exam-heading p {
                    margin: 0;
                    color: #68718a;
                    font-size: 15px;
                    line-height: 1.6;
                }

            .add-exam-back {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                min-height: 44px;
                padding: 11px 18px;
                border-radius: 9px;
                background: #ffffff;
                border: 1px solid #dce1ec;
                color: #374151;
                font-size: 14px;
                font-weight: 600;
                text-decoration: none;
                transition: 0.2s ease;
            }

                .add-exam-back:hover {
                    background: #f3f5fb;
                    border-color: #bfc8dc;
                }

            /* Form Card */
            .add-exam-card {
                width: 100%;
                max-width: 850px;
                margin: 0 auto;
                overflow: hidden;
                border: 1px solid #e0e5f0;
                border-radius: 18px;
                background: rgba(255, 255, 255, 0.92);
                box-shadow: 0 12px 36px rgba(37, 48, 86, 0.08);
            }

            .add-exam-card-header {
                padding: 26px 30px;
                border-bottom: 1px solid #edf0f7;
            }

                .add-exam-card-header h2 {
                    margin: 0 0 7px;
                    color: #202642;
                    font-size: 22px;
                    font-weight: 700;
                }

                .add-exam-card-header p {
                    margin: 0;
                    color: #778096;
                    font-size: 14px;
                    line-height: 1.6;
                }

            /* Form Layout */
            .add-exam-form {
                display: grid;
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 24px;
                padding: 30px;
                box-sizing: border-box;
            }

            .add-exam-field {
                display: flex;
                flex-direction: column;
                gap: 9px;
                min-width: 0;
            }

                .add-exam-field.full-width {
                    grid-column: 1 / -1;
                }

                .add-exam-field label {
                    color: #343c55;
                    font-size: 14px;
                    font-weight: 650;
                }

            .add-exam-input {
                width: 100%;
                min-height: 48px;
                box-sizing: border-box;
                padding: 12px 14px;
                border: 1px solid #dce1ec;
                border-radius: 9px;
                background: #ffffff;
                color: #242b40;
                font-family: inherit;
                font-size: 14px;
                outline: none;
                transition: border-color 0.2s ease, box-shadow 0.2s ease;
            }

                .add-exam-input:hover {
                    border-color: #b9c3da;
                }

                .add-exam-input:focus {
                    border-color: #6257d9;
                    box-shadow: 0 0 0 3px rgba(98, 87, 217, 0.12);
                }

            .add-exam-help {
                margin: 0;
                color: #81899d;
                font-size: 12px;
                line-height: 1.5;
            }

            /* Published Checkbox */
            .add-exam-publish {
                grid-column: 1 / -1;
                display: flex;
                align-items: flex-start;
                gap: 12px;
                padding: 17px;
                border: 1px solid #e3e7f1;
                border-radius: 10px;
                background: #f8f9fd;
            }

                .add-exam-publish input[type="checkbox"] {
                    width: 17px;
                    height: 17px;
                    margin-top: 3px;
                    accent-color: #6257d9;
                    cursor: pointer;
                    flex-shrink: 0;
                }

                .add-exam-publish label {
                    color: #343c55;
                    font-size: 14px;
                    font-weight: 650;
                    cursor: pointer;
                }

                .add-exam-publish p {
                    margin: 5px 0 0;
                    color: #778096;
                    font-size: 12px;
                    line-height: 1.5;
                }

            /* Feedback Message */
            .add-exam-message {
                grid-column: 1 / -1;
                font-size: 14px;
                font-weight: 600;
            }

                .add-exam-message:empty {
                    display: none;
                }

                .add-exam-message.success {
                    color: #15803d;
                }

                .add-exam-message.error {
                    color: #dc2626;
                }

            /* Form Buttons */
            .add-exam-actions {
                grid-column: 1 / -1;
                display: flex;
                align-items: center;
                flex-wrap: wrap;
                gap: 12px;
                padding-top: 4px;
            }

            .add-exam-submit,
            .add-exam-reset {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                min-height: 45px;
                padding: 11px 20px;
                border-radius: 9px;
                font-family: inherit;
                font-size: 14px;
                font-weight: 650;
                cursor: pointer;
                transition: 0.2s ease;
            }

            .add-exam-submit {
                border: 1px solid #4059d8;
                background: #4059d8;
                color: #ffffff;
            }

                .add-exam-submit:hover {
                    background: #3047bd;
                    border-color: #3047bd;
                    transform: translateY(-1px);
                }

            .add-exam-reset {
                border: 1px solid #dce1ec;
                background: #ffffff;
                color: #404960;
            }

                .add-exam-reset:hover {
                    background: #f4f6fb;
                }

            /* Responsive Design */
            @media (max-width: 650px) {
                .add-exam-page {
                    width: calc(100% - 28px);
                    padding-top: 25px;
                }

                .add-exam-heading {
                    align-items: flex-start;
                    flex-direction: column;
                }

                .add-exam-card-header {
                    padding: 22px 20px;
                }

                .add-exam-form {
                    grid-template-columns: minmax(0, 1fr);
                    gap: 20px;
                    padding: 22px 20px;
                }

                .add-exam-field.full-width,
                .add-exam-publish,
                .add-exam-message,
                .add-exam-actions {
                    grid-column: 1;
                }

                .add-exam-actions {
                    flex-direction: column;
                    align-items: stretch;
                }

                .add-exam-submit,
                .add-exam-reset {
                    width: 100%;
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

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <!-- ===================== MAIN ===================== -->
    <main class="add-exam-page">

        <!-- Page Heading -->
        <section class="add-exam-heading">
            <div>
                <span class="heading-eyebrow">EXAM MANAGEMENT</span>
                <h1>Add New Exam</h1>
                <p>Create an examination and configure its marks and time limit.</p>
            </div>

            <a href="manageExams.aspx" class="add-exam-back">&#8592; Manage Exams
            </a>
        </section>

        <!-- Add Exam Form -->
        <section class="add-exam-card">

            <div class="add-exam-card-header">
                <h2>Exam Details</h2>
                <p>Enter the basic information for your new examination.</p>
            </div>

            <div class="add-exam-form">

                <!-- Exam Title -->
                <div class="add-exam-field full-width">
                    <label for="<%= txtExamTitle.ClientID %>">Exam Title</label>

                    <asp:TextBox ID="txtExamTitle"
                        runat="server"
                        CssClass="add-exam-input"
                        MaxLength="150"
                        placeholder="e.g. Mathematics Final Exam" />

                    <p class="add-exam-help">
                        Choose a clear title that identifies the examination.
                    </p>
                </div>

                <!-- Total Marks -->
                <div class="add-exam-field">
                    <label for="<%= txtExamMarks.ClientID %>">Total Marks</label>

                    <asp:TextBox ID="txtExamMarks"
                        runat="server"
                        CssClass="add-exam-input"
                        TextMode="Number"
                        placeholder="e.g. 100" />

                    <p class="add-exam-help">
                        Enter the maximum marks available for this exam.
                    </p>
                </div>

                <!-- Time Limit -->
                <div class="add-exam-field">
                    <label for="<%= txtTimeLimit.ClientID %>">Time Limit (Minutes)</label>

                    <asp:TextBox ID="txtTimeLimit"
                        runat="server"
                        CssClass="add-exam-input"
                        TextMode="Number"
                        placeholder="e.g. 60" />

                    <p class="add-exam-help">
                        Enter the duration of the examination in minutes.
                    </p>
                </div>

                <!-- Publish Option -->
                <div class="add-exam-publish">
                    <asp:CheckBox ID="chkIsPublished" runat="server" />

                    <div>
                        <label for="<%= chkIsPublished.ClientID %>">
                            Publish this exam
                        </label>
                        <p>
                            Enable this option if the exam should be available to users.
                        </p>
                    </div>
                </div>

                <!-- Feedback -->
                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="add-exam-message" />

                <!-- Buttons -->
                <div class="add-exam-actions">

                    <asp:Button ID="btnAddExam"
                        runat="server"
                        Text="Create Exam"
                        CssClass="add-exam-submit"
                        OnClick="btnAddExam_Click" />

                    <asp:Button ID="btnResetExam"
                        runat="server"
                        Text="Clear Form"
                        CssClass="add-exam-reset"
                        CausesValidation="false"
                        OnClick="btnResetExam_Click" />

                </div>

            </div>

        </section>

    </main>
</asp:Content>

<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ===================== FOOTER ===================== -->

    <script src="js/auth.js"></script>
    <script src="js/app.js"></script>
    </body>
</html>
</asp:Content>
