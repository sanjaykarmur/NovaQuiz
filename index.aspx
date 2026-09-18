<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NovaQuiz_3.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <main>
                    <!-- ===================== HERO ===================== -->
                    <section class="hero">
                        <canvas class="hero-canvas" aria-hidden="true"></canvas>
                        <div class="container hero-inner">
                            <span class="hero-badge">✦ Trusted by 40,000+ learners worldwide</span>
                            <h1>Master every exam with <span class="grad-text">confidence &amp; clarity</span></h1>
                            <p>
                                NovaQuiz turns exam prep into a focused, distraction-free ritual — timed mock tests, instant scoring, and progress you can actually see.</p>
                            <div class="hero-cta">
                                <a href="signup.aspx" class="btn btn-primary">Get Started Free</a> <a href="exams.html" class="btn btn-outline">Browse Exams</a>
                            </div>
                            <div class="hero-stats">
                                <div class="hero-stat">
                                    <div class="num" data-count="120" data-suffix="+">
                                        0</div>
                                    <div class="label">
                                        Mock Exams</div>
                                </div>
                                <div class="hero-stat">
                                    <div class="num" data-count="40" data-suffix="K+">
                                        0</div>
                                    <div class="label">
                                        Active Learners</div>
                                </div>
                                <div class="hero-stat">
                                    <div class="num" data-count="98" data-suffix="%">
                                        0</div>
                                    <div class="label">
                                        Satisfaction Rate</div>
                                </div>
                                <div class="hero-stat">
                                    <div class="num" data-count="24" data-suffix="/7">
                                        0</div>
                                    <div class="label">
                                        Availability</div>
                                </div>
                            </div>
                        </div>
    </section>

                    <!-- ===================== PLATFORM HIGHLIGHTS ===================== -->
                    <section class="section">
                        <div class="container">
                            <div class="section-head reveal">
                                <span class="eyebrow">Platform Highlights</span>
                                <h2>Everything you need to prep smarter</h2>
                                <p>
                                    A complete exam workflow — from practice to performance tracking — in one clean workspace.</p>
                            </div>
                            <div class="grid grid-4">
                                <div class="feature-card glass reveal">
                                    <div class="feature-icon">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                            <rect x="3" y="4" width="18" height="16" rx="2" />
                                            <path d="M8 2v4M16 2v4M3 10h18" />
                                        </svg>
                                    </div>
                                    <h3>Timed Mock Exams</h3>
                                    <p>
                                        Simulate real exam conditions with an accurate countdown timer and auto-submit.</p>
                                </div>
                                <div class="feature-card glass reveal">
                                    <div class="feature-icon">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                            <path d="M3 3v18h18" />
                                            <path d="M7 15l4-6 4 3 5-8" />
                                        </svg>
                                    </div>
                                    <h3>Instant Analytics</h3>
                                    <p>
                                        See your score, accuracy, and time spent the moment you submit — no waiting.</p>
                                </div>
                                <div class="feature-card glass reveal">
                                    <div class="feature-icon">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                            <path d="M12 2l2.9 6.3L21 9l-5 4.6L17.5 21 12 17.3 6.5 21 8 13.6 3 9l6.1-.7z" />
                                        </svg>
                                    </div>
                                    <h3>Curated Question Bank</h3>
                                    <p>
                                        Thousands of reviewed questions across subjects, ranked by real difficulty.</p>
                                </div>
                                <div class="feature-card glass reveal">
                                    <div class="feature-icon">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                            <path d="M22 12h-4l-3 9L9 3l-3 9H2" />
                                        </svg>
                                    </div>
                                    <h3>Progress Tracking</h3>
                                    <p>
                                        Visual dashboards show growth over time, so you know exactly what to revise.</p>
                                </div>
                            </div>
                        </div>
    </section>

                    <!-- ===================== WHY CHOOSE ===================== -->
                    <section class="section" style="padding-top: 0;">
                        <div class="container">
                            <div class="glass reveal" style="padding: 56px; display: grid; grid-template-columns: 1fr 1fr; gap: 48px; align-items: center;">
                                <div>
                                    <span class="eyebrow">Why NovaQuiz</span>
                                    <h2 style="font-size: clamp(1.6rem,3vw,2.2rem); font-weight: 700; margin-bottom: 18px;">Built for focus. Designed for results.</h2>
                                    <p style="color: var(--text-dim); margin-bottom: 24px;">
                                        Most exam platforms bury you in clutter. NovaQuiz strips away the noise so every session is calm, fast, and genuinely useful — on any device, anywhere.</p>
                                    <ul style="display: flex; flex-direction: column; gap: 16px;">
                                        <li class="flex items-center gap-12">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#3ED598" stroke-width="2.4" style="flex-shrink: 0">
                                                <path d="M20 6L9 17l-5-5" />
                                            </svg>
                                            Zero setup — start an exam in seconds</li>
                                        <li class="flex items-center gap-12">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#3ED598" stroke-width="2.4" style="flex-shrink: 0">
                                                <path d="M20 6L9 17l-5-5" />
                                            </svg>
                                            Fair, randomized question ordering</li>
                                        <li class="flex items-center gap-12">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#3ED598" stroke-width="2.4" style="flex-shrink: 0">
                                                <path d="M20 6L9 17l-5-5" />
                                            </svg>
                                            Full review of every answer after submission</li>
                                        <li class="flex items-center gap-12">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#3ED598" stroke-width="2.4" style="flex-shrink: 0">
                                                <path d="M20 6L9 17l-5-5" />
                                            </svg>
                                            Free forever for core practice exams</li>
                                    </ul>
                                </div>
                                <div class="grid" style="grid-template-columns: 1fr 1fr; gap: 18px;">
                                    <div class="glass reveal" style="padding: 22px; text-align: center;">
                                        <div class="stat-number" style="font-size: 1.7rem; font-weight: 700;">
                                            4.9/5</div>
                                        <div style="color: var(--text-dim); font-size: 0.85rem; margin-top: 6px;">
                                            Average rating</div>
                                    </div>
                                    <div class="glass reveal" style="padding: 22px; text-align: center;">
                                        <div class="stat-number" style="font-size: 1.7rem; font-weight: 700;">
                                            2.1M+</div>
                                        <div style="color: var(--text-dim); font-size: 0.85rem; margin-top: 6px;">
                                            Exams completed</div>
                                    </div>
                                    <div class="glass reveal" style="padding: 22px; text-align: center;">
                                        <div class="stat-number" style="font-size: 1.7rem; font-weight: 700;">
                                            12</div>
                                        <div style="color: var(--text-dim); font-size: 0.85rem; margin-top: 6px;">
                                            Subject categories</div>
                                    </div>
                                    <div class="glass reveal" style="padding: 22px; text-align: center;">
                                        <div class="stat-number" style="font-size: 1.7rem; font-weight: 700;">
                                            0₹</div>
                                        <div style="color: var(--text-dim); font-size: 0.85rem; margin-top: 6px;">
                                            Cost to start</div>
                                    </div>
                                </div>
                            </div>
                        </div>
    </section>

                    <!-- ===================== TESTIMONIALS ===================== -->
                    <section class="section">
                        <div class="container">
                            <div class="section-head reveal">
                                <span class="eyebrow">Testimonials</span>
                                <h2>Loved by students and professionals</h2>
                                <p>
                                    Real feedback from people preparing for their next big exam.</p>
                            </div>
                            <div class="grid grid-3">
                                <div class="testimonial-card glass reveal">
                                    <div class="testimonial-stars">
                                        ★★★★★</div>
                                    <p class="testimonial-quote">
                                        The timer and instant results made my revision routine so much more consistent. I finally feel ready for finals.</p>
                                    <div class="testimonial-person">
                                        <div class="avatar">
                                            AK</div>
                                        <div>
                                            <div class="name">
                                                Aditi Kapoor</div>
                                            <div class="role">
                                                Engineering Student</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="testimonial-card glass reveal">
                                    <div class="testimonial-stars">
                                        ★★★★★</div>
                                    <p class="testimonial-quote">
                                        Clean interface, no distractions. The dashboard chart genuinely helped me see which subjects needed more work.</p>
                                    <div class="testimonial-person">
                                        <div class="avatar">
                                            RM</div>
                                        <div>
                                            <div class="name">
                                                Rohit Mehra</div>
                                            <div class="role">
                                                Civil Services Aspirant</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="testimonial-card glass reveal">
                                    <div class="testimonial-stars">
                                        ★★★★★</div>
                                    <p class="testimonial-quote">
                                        I use NovaQuiz to prep my team for internal certifications. The review-answers screen is a killer feature.</p>
                                    <div class="testimonial-person">
                                        <div class="avatar">
                                            SL</div>
                                        <div>
                                            <div class="name">
                                                Sara Lin</div>
                                            <div class="role">
                                                L&amp;D Manager</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
    </section>

                    <!-- ===================== CTA STRIP ===================== -->
                    <section class="container">
                        <div class="glass reveal text-center" style="padding: 64px 32px; background-image: var(--grad-radial);">
                            <h2 style="font-size: clamp(1.5rem,3vw,2.1rem); font-weight: 700; margin-bottom: 14px;">Ready to test what you know?</h2>
                            <p style="color: var(--text-dim); max-width: 480px; margin: 0 auto 28px;">
                                Create your free account and take your first mock exam in under two minutes.</p>
                            <a href="signup.html" class="btn btn-primary">Create Free Account</a>
                        </div>
    </section>
    </main>
</asp:Content>


<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder1">
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
                                <a href="login.html" class="btn btn-ghost" data-nav="login">Login</a> <a href="signup.html" class="btn btn-primary btn-sm" data-nav="signup">Sign Up</a>
                            </div>
                            <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                                <span></span>
                            </button>
                        </div>
                    </header>
</asp:Content>



