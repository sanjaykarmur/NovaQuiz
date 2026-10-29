<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="NovaQuiz_3.contact" %>

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
        <link rel="stylesheet" href="css/auth.css">

        <style>
            .contact-page,
            .contact-page * {
                box-sizing: border-box;
            }

            .contact-page {
                padding: 48px 22px 75px;
                background: radial-gradient(circle at 8% 0%, rgba(99,102,241,.08), transparent 28%), #f6f7fc;
                color: #26314d;
                min-height: 75vh;
            }

            .contact-container {
                max-width: 1120px;
                width: 100%;
                margin: auto;
            }

            .contact-hero {
                text-align: center;
                margin-bottom: 36px;
            }

            .contact-eyebrow {
                display: inline-block;
                padding: 8px 12px;
                margin-bottom: 15px;
                border: 1px solid #e3e0ff;
                border-radius: 30px;
                background: #f0efff;
                color: #6258df;
                font-size: 11px;
                font-weight: 800;
                letter-spacing: 1.3px;
                text-transform: uppercase;
            }

            .contact-hero h1 {
                margin: 0;
                color: #18213b;
                font-size: clamp(30px, 4vw, 43px);
                font-weight: 800;
                letter-spacing: -1.4px;
                line-height: 1.2;
            }

            .contact-hero p {
                max-width: 610px;
                margin: 14px auto 0;
                color: #7d869d;
                font-size: 14px;
                line-height: 1.8;
            }

            .contact-grid {
                display: grid;
                grid-template-columns: .85fr 1.15fr;
                gap: 24px;
                align-items: start;
            }

            .contact-card {
                padding: 27px;
                border: 1px solid #e6e9f2;
                border-radius: 17px;
                background: #fff;
                box-shadow: 0 12px 35px rgba(35,45,85,.05);
            }

                .contact-card h2 {
                    margin: 0 0 8px;
                    color: #202943;
                    font-size: 19px;
                    font-weight: 800;
                }

            .contact-card-description {
                margin: 0 0 22px;
                color: #8991a5;
                font-size: 13px;
                line-height: 1.7;
            }

            .contact-info-item {
                display: flex;
                align-items: flex-start;
                gap: 13px;
                padding: 17px 0;
                border-bottom: 1px solid #edf0f6;
            }

                .contact-info-item:last-child {
                    border-bottom: none;
                }

            .contact-info-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                flex: 0 0 43px;
                width: 43px;
                height: 43px;
                border: 1px solid #e3e0ff;
                border-radius: 12px;
                background: #f2f0ff;
                color: #6258df;
                font-size: 18px;
                font-weight: 800;
            }

            .contact-info-item strong {
                display: block;
                margin: 2px 0 5px;
                color: #34405e;
                font-size: 13px;
            }

            .contact-info-item span,
            .contact-info-item a {
                color: #7d869d;
                font-size: 12px;
                line-height: 1.7;
                overflow-wrap: anywhere;
            }

            .contact-info-item a {
                text-decoration: none;
            }

                .contact-info-item a:hover {
                    color: #6258df;
                }

            .contact-note {
                margin-top: 18px;
                padding: 15px;
                border: 1px solid #e5e3ff;
                border-radius: 11px;
                background: #f7f6ff;
                color: #65638c;
                font-size: 12px;
                line-height: 1.7;
            }

            /* Contact form */

            .contact-form .form-group {
                margin-bottom: 18px;
            }

            .contact-form label {
                display: block;
                margin-bottom: 8px;
                color: #39435d;
                font-size: 12px;
                font-weight: 750;
            }

            .contact-form input,
            .contact-form textarea {
                display: block;
                width: 100%;
                padding: 12px 14px;
                border: 1px solid #dfe4f0;
                border-radius: 9px;
                background: #fff;
                color: #26314d;
                font-family: inherit;
                font-size: 13px;
                outline: none;
                transition: border-color .2s, box-shadow .2s;
            }

            .contact-form input {
                min-height: 44px;
            }

            .contact-form textarea {
                min-height: 135px;
                resize: vertical;
            }

                .contact-form input:focus,
                .contact-form textarea:focus {
                    border-color: #8b83f5;
                    box-shadow: 0 0 0 3px rgba(99,102,241,.11);
                }

                .contact-form input::placeholder,
                .contact-form textarea::placeholder {
                    color: #a3aabd;
                }

            .contact-submit {
                width: 100%;
                min-height: 46px;
                padding: 12px 18px;
                border: 1px solid #574bd5;
                border-radius: 10px;
                background: #6258df;
                color: #fff;
                font-family: inherit;
                font-size: 13px;
                font-weight: 800;
                cursor: pointer;
                transition: .2s ease;
            }

                .contact-submit:hover {
                    background: #5147d4;
                    transform: translateY(-1px);
                    box-shadow: 0 6px 15px rgba(98,88,223,.2);
                }

                .contact-submit:disabled {
                    opacity: .65;
                    cursor: not-allowed;
                    transform: none;
                }

            .contact-form-status {
                display: none;
                margin-top: 14px;
                padding: 12px;
                border-radius: 9px;
                font-size: 12px;
                line-height: 1.6;
            }

                .contact-form-status.visible {
                    display: block;
                }

                .contact-form-status.error {
                    border: 1px solid #fecaca;
                    background: #fff1f2;
                    color: #b91c1c;
                }

                .contact-form-status.info {
                    border: 1px solid #e5e3ff;
                    background: #f4f3ff;
                    color: #5147b5;
                }

            /* FAQ */

            .contact-faq {
                max-width: 820px;
                margin: 65px auto 0;
            }

            .contact-faq-heading {
                margin-bottom: 23px;
                text-align: center;
            }

                .contact-faq-heading h2 {
                    margin: 0 0 9px;
                    color: #202943;
                    font-size: 26px;
                    font-weight: 800;
                    letter-spacing: -.6px;
                }

                .contact-faq-heading p {
                    margin: 0;
                    color: #8991a5;
                    font-size: 13px;
                    line-height: 1.7;
                }

            .contact-faq details {
                margin-bottom: 11px;
                overflow: hidden;
                border: 1px solid #e6e9f2;
                border-radius: 12px;
                background: #fff;
                box-shadow: 0 5px 18px rgba(35,45,85,.025);
            }

            .contact-faq summary {
                position: relative;
                padding: 18px 48px 18px 20px;
                color: #34405e;
                font-size: 13px;
                font-weight: 750;
                cursor: pointer;
                list-style: none;
            }

                .contact-faq summary::-webkit-details-marker {
                    display: none;
                }

                .contact-faq summary::after {
                    content: "+";
                    position: absolute;
                    top: 50%;
                    right: 20px;
                    color: #6258df;
                    font-size: 21px;
                    font-weight: 500;
                    transform: translateY(-50%);
                }

            .contact-faq details[open] summary::after {
                content: "\2212";
            }

            .contact-faq details p {
                margin: 0;
                padding: 0 20px 19px;
                color: #7d869d;
                font-size: 12px;
                line-height: 1.8;
            }

            /* NovaQuiz — Purple Gradient Logout Button */
            .nav-actions input.btn,
            .nav-actions input.btn-ghost {
                appearance: none;
                -webkit-appearance: none;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                min-width: 104px;
                padding: 12px 24px;
                background: linear-gradient( 120deg, #8974f7 0%, #9b83f6 48%, #51c7c8 100% );
                color: #17172d !important;
                font-family: inherit;
                font-size: 15px;
                font-weight: 650;
                letter-spacing: 0.2px;
                border: 1px solid rgba(105, 95, 190, 0.4);
                border-radius: 13px;
                box-shadow: 0 5px 14px rgba(137, 116, 247, 0.16), inset 0 1px 0 rgba(255, 255, 255, 0.45);
                cursor: pointer;
                transition: transform 0.22s ease, box-shadow 0.22s ease, filter 0.22s ease;
            }

                /* Hover */
                .nav-actions input.btn:hover,
                .nav-actions input.btn-ghost:hover {
                    filter: saturate(1.12) brightness(1.04);
                    transform: translateY(-2px);
                    box-shadow: 0 8px 22px rgba(137, 116, 247, 0.27), 0 3px 10px rgba(81, 199, 200, 0.15);
                }

                /* Click */
                .nav-actions input.btn:active,
                .nav-actions input.btn-ghost:active {
                    transform: translateY(0);
                    box-shadow: 0 2px 7px rgba(137, 116, 247, 0.18);
                }

                /* Keyboard accessibility */
                .nav-actions input.btn:focus-visible,
                .nav-actions input.btn-ghost:focus-visible {
                    outline: 3px solid rgba(137, 116, 247, 0.4);
                    outline-offset: 4px;
                }

            @media (max-width: 800px) {
                .contact-grid {
                    grid-template-columns: 1fr;
                }

                .contact-card {
                    padding: 22px;
                }
            }

            @media (max-width: 520px) {
                .contact-page {
                    padding: 32px 14px 48px;
                }

                .contact-hero h1 {
                    font-size: 30px;
                }

                .contact-hero p {
                    font-size: 13px;
                }

                .contact-faq {
                    margin-top: 45px;
                }

                .contact-faq-heading h2 {
                    font-size: 23px;
                }
            }

            @media (prefers-reduced-motion: reduce) {
                .contact-form input,
                .contact-form textarea,
                .contact-submit {
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

<asp:Content ID="Content3" runat="server"
    ContentPlaceHolderID="ContentPlaceHolder2">

    <main class="contact-page">
        <div class="contact-container">

            <!-- Heading -->
            <section class="contact-hero">
                <span class="contact-eyebrow">NovaQuiz Support</span>
                <h1>Let's talk.</h1>
                <p>
                    Have a question about exams, your account, or your results?
                    Find our contact information below or prepare a message for our team.
                </p>
            </section>

            <!-- Contact cards -->
            <section class="contact-grid">

                <!-- Contact details -->
                <div class="contact-card">
                    <h2>Contact Information</h2>
                    <p class="contact-card-description">
                        Reach out through the available contact channels.
                    </p>

                    <div class="contact-info-item">
                        <div class="contact-info-icon" aria-hidden="true">&#9993;</div>
                        <div>
                            <strong>Email Support</strong>
                            <a href="mailto:support@novaquiz.io">support@novaquiz.io
                            </a>
                        </div>
                    </div>

                    <div class="contact-info-item">
                        <div class="contact-info-icon" aria-hidden="true">&#9742;</div>
                        <div>
                            <strong>Phone</strong>
                            <span>+1 (555) 012-3456</span>
                        </div>
                    </div>

                    <div class="contact-info-item">
                        <div class="contact-info-icon" aria-hidden="true">&#9679;</div>
                        <div>
                            <strong>Platform</strong>
                            <span>NovaQuiz Online Examination Platform</span>
                        </div>
                    </div>

                    <div class="contact-note">
                        <strong>Need exam assistance?</strong>
                        <br />
                        Include the exam name and a clear description of your issue
                        when contacting support.
                    </div>
                </div>

                <!-- Message form -->
                <div class="contact-card">
                    <h2>Send a Message</h2>
                    <p class="contact-card-description">
                        Complete the fields below to prepare your message.
                    </p>

                    <form id="contactForm" class="contact-form">
                        <div class="form-group">
                            <label for="cName">Full Name</label>
                            <input
                                type="text"
                                id="cName"
                                name="name"
                                placeholder="Enter your full name"
                                maxlength="100"
                                autocomplete="name"
                                required />
                        </div>

                        <div class="form-group">
                            <label for="cEmail">Email Address</label>
                            <input
                                type="email"
                                id="cEmail"
                                name="email"
                                placeholder="you@example.com"
                                maxlength="254"
                                autocomplete="email"
                                required />
                        </div>

                        <div class="form-group">
                            <label for="cSubject">Subject</label>
                            <input
                                type="text"
                                id="cSubject"
                                name="subject"
                                placeholder="What can we help with?"
                                maxlength="150"
                                required />
                        </div>

                        <div class="form-group">
                            <label for="cMessage">Message</label>
                            <textarea
                                id="cMessage"
                                name="message"
                                rows="5"
                                maxlength="3000"
                                placeholder="Describe your question or issue..."
                                required></textarea>
                        </div>

                        <button type="submit" class="contact-submit">
                            Send Message
                        </button>

                        <div
                            id="contactFormStatus"
                            class="contact-form-status"
                            role="status"
                            aria-live="polite">
                        </div>
                    </form>
                </div>

            </section>

            <!-- Frequently asked questions -->
            <section class="contact-faq">
                <div class="contact-faq-heading">
                    <span class="contact-eyebrow">Quick Help</span>
                    <h2>Frequently Asked Questions</h2>
                    <p>Check these answers before contacting support.</p>
                </div>

                <details>
                    <summary>How can I take an exam?</summary>
                    <p>
                        Open the Exams page, choose an available examination,
                        and follow the instructions displayed on the page.
                    </p>
                </details>

                <details>
                    <summary>Where can I see my exam results?</summary>
                    <p>
                        Open your Dashboard to view the statistics and results
                        available for your account.
                    </p>
                </details>

                <details>
                    <summary>Can I retake an examination?</summary>
                    <p>
                        Retakes depend on the availability and rules configured
                        for that examination.
                    </p>
                </details>

                <details>
                    <summary>What should I do if my exam page has a problem?</summary>
                    <p>
                        Note the exam name and describe what happened. Contact
                        support with those details so the issue can be investigated.
                    </p>
                </details>
            </section>

        </div>
    </main>

    <script>
(function () {
    var form = document.getElementById("contactForm");
    var status = document.getElementById("contactFormStatus");

    if (!form || !status) {
        return;
    }

    form.addEventListener("submit", function (event) {
        event.preventDefault();

        if (!form.checkValidity()) {
            form.reportValidity();
            return;
        }

        var name = document.getElementById("cName").value.trim();
        var email = document.getElementById("cEmail").value.trim();
        var subject = document.getElementById("cSubject").value.trim();
        var message = document.getElementById("cMessage").value.trim();

        if (!name || !email || !subject || !message) {
            status.className = "contact-form-status visible error";
            status.textContent = "Please complete all fields.";
            return;
        }

        var mailto = "mailto:support@novaquiz.io"
            + "?subject=" + encodeURIComponent(subject)
            + "&body=" + encodeURIComponent(
                "Name: " + name + "\n"
                + "Email: " + email + "\n\n"
                + message
            );

        status.className = "contact-form-status visible info";
        status.textContent =
            "Your email application will open with your message prepared. "
            + "You must send the email from that application.";

        window.location.href = mailto;
    });
})();
    </script>

</asp:Content>
