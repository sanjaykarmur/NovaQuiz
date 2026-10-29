<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="updateUser.aspx.cs" Inherits="NovaQuiz_3.updateUser" %>

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
            /* Update User Page */
            .update-user-panel {
                max-width: 850px;
                margin: 0 auto 30px;
            }

            .update-user-form {
                display: grid;
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 22px;
                padding: 24px;
            }

            .update-user-field {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

                .update-user-field label {
                    color: #374151;
                    font-size: 14px;
                    font-weight: 600;
                }

            .readonly-user-id {
                display: flex;
                align-items: center;
                min-height: 44px;
                padding: 10px 13px;
                border: 1px solid #e5e7eb;
                border-radius: 8px;
                background: #f3f4f6;
                color: #6b7280;
                font-weight: 600;
            }

            .update-user-input {
                width: 100%;
                min-height: 44px;
                box-sizing: border-box;
                padding: 10px 13px;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                background: #ffffff;
                color: #111827;
                font-size: 14px;
                outline: none;
                transition: border-color 0.2s ease, box-shadow 0.2s ease;
            }

                .update-user-input:focus {
                    border-color: #3156c9;
                    box-shadow: 0 0 0 3px rgba(49, 86, 201, 0.12);
                }

            .update-user-message {
                grid-column: 1 / -1;
                font-size: 14px;
                font-weight: 600;
            }

                .update-user-message:empty {
                    display: none;
                }

                .update-user-message.success {
                    color: #15803d;
                }

                .update-user-message.error {
                    color: #dc2626;
                }

            .update-user-actions {
                grid-column: 1 / -1;
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                gap: 12px;
                padding-top: 8px;
            }

            .save-user-btn,
            .delete-user-btn,
            .cancel-user-link {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                min-height: 40px;
                box-sizing: border-box;
                padding: 10px 17px;
                border-radius: 8px;
                font-size: 14px;
                font-weight: 600;
                text-decoration: none;
                cursor: pointer;
                transition: background 0.2s ease, color 0.2s ease;
            }

            .save-user-btn {
                border: 1px solid #3156c9;
                background: #3156c9;
                color: #ffffff;
            }

                .save-user-btn:hover {
                    background: #2445a8;
                }

            .delete-user-btn {
                border: 1px solid #fecaca;
                background: #fef2f2;
                color: #dc2626;
            }

                .delete-user-btn:hover {
                    background: #dc2626;
                    color: #ffffff;
                }

            .cancel-user-link {
                border: 1px solid #d1d5db;
                background: #ffffff;
                color: #374151;
            }

                .cancel-user-link:hover {
                    background: #f3f4f6;
                }

            @media (max-width: 600px) {
                .update-user-form {
                    grid-template-columns: 1fr;
                    padding: 18px;
                }

                .update-user-actions {
                    align-items: stretch;
                    flex-direction: column;
                }

                .save-user-btn,
                .delete-user-btn,
                .cancel-user-link {
                    width: 100%;
                }
            }


            /* =====================================
   UPDATE USER PAGE - DESIGN FIX
===================================== */

            .update-user-page {
                width: min(1180px, calc(100% - 48px));
                margin: 0 auto;
                padding: 36px 0 60px;
                box-sizing: border-box;
            }

                /* Page heading */
                .update-user-page .dashboard-heading {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    flex-wrap: wrap;
                    gap: 22px;
                    margin: 0 0 30px;
                    padding: 0;
                }

                    .update-user-page .dashboard-heading > div {
                        flex: 1;
                        min-width: 250px;
                    }

                .update-user-page .dashboard-eyebrow {
                    display: inline-block;
                    margin-bottom: 10px;
                    color: #6257d9;
                    font-size: 12px;
                    font-weight: 750;
                    letter-spacing: 1.5px;
                }

                .update-user-page .dashboard-heading h1 {
                    margin: 0 0 10px;
                    color: #202642;
                    font-size: clamp(28px, 3vw, 36px);
                    line-height: 1.2;
                    font-weight: 750;
                }

                .update-user-page .dashboard-heading p {
                    margin: 0;
                    color: #68718a;
                    font-size: 15px;
                    line-height: 1.6;
                }

                .update-user-page .dashboard-heading > a {
                    flex-shrink: 0;
                    text-decoration: none;
                }

                /* User details card */
                .update-user-page .update-user-panel {
                    width: 100%;
                    max-width: 900px;
                    margin: 0 auto;
                    overflow: hidden;
                    border: 1px solid rgba(220, 225, 240, 0.9);
                    border-radius: 18px;
                    background: rgba(255, 255, 255, 0.88);
                    box-shadow: 0 12px 36px rgba(37, 48, 86, 0.08);
                    box-sizing: border-box;
                }

                    .update-user-page .update-user-panel .panel-heading {
                        padding: 26px 30px 22px;
                        border-bottom: 1px solid #edf0f7;
                    }

                        .update-user-page .update-user-panel .panel-heading h2 {
                            margin: 0 0 7px;
                            color: #202642;
                            font-size: 22px;
                            font-weight: 700;
                        }

                        .update-user-page .update-user-panel .panel-heading p {
                            margin: 0;
                            color: #778096;
                            font-size: 14px;
                            line-height: 1.6;
                        }

                /* Form layout */
                .update-user-page .update-user-form {
                    display: grid;
                    grid-template-columns: repeat(2, minmax(0, 1fr));
                    gap: 24px;
                    padding: 30px;
                    box-sizing: border-box;
                }

                .update-user-page .update-user-field {
                    display: flex;
                    flex-direction: column;
                    gap: 9px;
                    min-width: 0;
                }

                    .update-user-page .update-user-field label {
                        color: #343c55;
                        font-size: 14px;
                        font-weight: 650;
                    }

                .update-user-page .readonly-user-id,
                .update-user-page .update-user-input {
                    display: block;
                    width: 100%;
                    min-height: 48px;
                    box-sizing: border-box;
                    padding: 12px 14px;
                    border: 1px solid #dce1ec;
                    border-radius: 9px;
                    font-family: inherit;
                    font-size: 14px;
                }

                .update-user-page .readonly-user-id {
                    display: flex;
                    align-items: center;
                    background: #f3f5f9;
                    color: #707991;
                    font-weight: 600;
                }

                .update-user-page .update-user-input {
                    background: #fff;
                    color: #242b40;
                    outline: none;
                    transition: border-color 0.2s ease, box-shadow 0.2s ease;
                }

                    .update-user-page .update-user-input:hover {
                        border-color: #b9c3da;
                    }

                    .update-user-page .update-user-input:focus {
                        border-color: #6257d9;
                        box-shadow: 0 0 0 3px rgba(98, 87, 217, 0.12);
                    }

                /* Status message */
                .update-user-page .update-user-message {
                    grid-column: 1 / -1;
                    margin: 0;
                    font-size: 14px;
                    font-weight: 600;
                }

                    .update-user-page .update-user-message:empty {
                        display: none;
                    }

                    .update-user-page .update-user-message.success {
                        color: #15803d;
                    }

                    .update-user-page .update-user-message.error {
                        color: #dc2626;
                    }

                /* Action buttons */
                .update-user-page .update-user-actions {
                    grid-column: 1 / -1;
                    display: flex;
                    align-items: center;
                    flex-wrap: wrap;
                    gap: 12px;
                    padding-top: 4px;
                }

                .update-user-page .save-user-btn,
                .update-user-page .delete-user-btn,
                .update-user-page .cancel-user-link {
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    min-height: 44px;
                    box-sizing: border-box;
                    padding: 11px 19px;
                    border: 1px solid transparent;
                    border-radius: 9px;
                    font-family: inherit;
                    font-size: 14px;
                    font-weight: 650;
                    text-decoration: none;
                    cursor: pointer;
                    transition: background 0.2s ease, border-color 0.2s ease, color 0.2s ease, transform 0.2s ease;
                }

                .update-user-page .save-user-btn {
                    background: #4059d8;
                    border-color: #4059d8;
                    color: #fff;
                }

                    .update-user-page .save-user-btn:hover {
                        background: #3047bd;
                        transform: translateY(-1px);
                    }

                .update-user-page .delete-user-btn {
                    background: #fff5f5;
                    border-color: #ffd5d5;
                    color: #d92d38;
                }

                    .update-user-page .delete-user-btn:hover {
                        background: #d92d38;
                        border-color: #d92d38;
                        color: #fff;
                    }

                .update-user-page .cancel-user-link {
                    background: #fff;
                    border-color: #dce1ec;
                    color: #404960;
                }

                    .update-user-page .cancel-user-link:hover {
                        background: #f4f6fb;
                        border-color: #c7cede;
                    }

            /* Responsive layout */
            @media (max-width: 650px) {
                .update-user-page {
                    width: calc(100% - 28px);
                    padding-top: 24px;
                }

                    .update-user-page .dashboard-heading {
                        align-items: flex-start;
                        flex-direction: column;
                        gap: 18px;
                    }

                        .update-user-page .dashboard-heading > div {
                            min-width: 0;
                        }

                    .update-user-page .update-user-panel .panel-heading {
                        padding: 22px 20px;
                    }

                    .update-user-page .update-user-form {
                        grid-template-columns: minmax(0, 1fr);
                        gap: 20px;
                        padding: 22px 20px;
                    }

                    .update-user-page .update-user-actions {
                        flex-direction: column;
                        align-items: stretch;
                    }

                    .update-user-page .save-user-btn,
                    .update-user-page .delete-user-btn,
                    .update-user-page .cancel-user-link {
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

    <main class="admin-dashboard update-user-page">

        <!-- Page Heading -->
        <section class="dashboard-heading">
            <div>
                <span class="dashboard-eyebrow">USER MANAGEMENT</span>
                <h1>Update User</h1>
                <p>View and manage the selected user's account details.</p>
            </div>

            <a href="manageUsers.aspx" class="btn btn-primary">← Back to Users
            </a>
        </section>

        <!-- Update User Form -->
        <section class="dashboard-panel update-user-panel">

            <div class="panel-heading">
                <div>
                    <h2>User Details</h2>
                    <p>Update the information associated with this account.</p>
                </div>
            </div>

            <div class="update-user-form">

                <!-- User ID (Read Only) -->
                <div class="update-user-field">
                    <label>User ID</label>
                    <asp:Label ID="lblUserID"
                        runat="server"
                        Text="Loading..."
                        CssClass="readonly-user-id" />
                </div>

                <!-- Full Name -->
                <div class="update-user-field">
                    <label for="<%= txtFullName.ClientID %>">Full Name</label>
                    <asp:TextBox ID="txtFullName"
                        runat="server"
                        CssClass="update-user-input"
                        MaxLength="100"
                        placeholder="Enter full name" />
                </div>

                <!-- Username -->
                <div class="update-user-field">
                    <label for="<%= txtUsername.ClientID %>">Username</label>
                    <asp:TextBox ID="txtUsername"
                        runat="server"
                        CssClass="update-user-input"
                        MaxLength="50"
                        placeholder="Enter username" />
                </div>

                <!-- Email -->
                <div class="update-user-field">
                    <label for="<%= txtEmail.ClientID %>">Email Address</label>
                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="update-user-input"
                        TextMode="Email"
                        MaxLength="254"
                        placeholder="Enter email address" />
                </div>

                <!-- Mobile -->
                <div class="update-user-field">
                    <label for="<%= txtMobile.ClientID %>">Mobile Number</label>
                    <asp:TextBox ID="txtMobile"
                        runat="server"
                        CssClass="update-user-input"
                        TextMode="Phone"
                        MaxLength="20"
                        placeholder="Enter mobile number" />
                </div>

                <!-- Message -->
                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="update-user-message"
                    EnableViewState="false" />

                <!-- Actions -->
                <div class="update-user-actions">

                    <asp:Button ID="btnSaveUser"
                        runat="server"
                        Text="Save Changes"
                        CssClass="save-user-btn"
                        OnClick="btnSaveUser_Click" />

                    <asp:Button ID="btnDeleteUser"
                        runat="server"
                        Text="Delete User"
                        CssClass="delete-user-btn"
                        CausesValidation="false"
                        OnClick="btnDeleteUser_Click"
                        OnClientClick="return confirmDeleteUser();" />

                    <a href="manageUsers.aspx" class="cancel-user-link">Cancel
                    </a>

                </div>

            </div>

        </section>

    </main>

    <!-- Delete Confirmation -->
    <script>
function confirmDeleteUser() {
    return confirm("Are you sure you want to delete this user? This action may not be reversible.");
}
    </script>

</asp:Content>

<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- ===================== FOOTER ===================== -->
    <footer class="footer">
        <div class="container">

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

