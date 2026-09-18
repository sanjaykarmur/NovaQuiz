<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="NovaQuiz_3.about" %>

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
                    <a href="login.aspx" class="btn btn-ghost" data-nav="login">Login</a> <a href="signup.aspx" class="btn btn-primary btn-sm" data-nav="signup">Sign Up</a>
                </div>
                <button class="nav-burger" aria-label="Toggle menu" aria-expanded="false">
                    <span></span>
                </button>
            </div>
        </header>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
   
<main>
  <section class="page-header">
    <div class="container">
      <span class="eyebrow" style="justify-content:center;">About NovaQuiz</span>
      <h1>A calmer way to prepare for exams</h1>
      <p>NovaQuiz was built by a small team of educators and engineers who believe exam prep should feel focused, not overwhelming.</p>
    </div>
  </section>

  <section class="section" style="padding-top:0;">
    <div class="container">
      <div class="glass reveal" style="padding:48px; display:grid; grid-template-columns:1.1fr 1fr; gap:40px; align-items:center;">
        <div>
          <h2 style="font-size:1.6rem; margin-bottom:16px;">Who we are</h2>
          <p style="color:var(--text-dim);">NovaQuiz started in 2023 as a side project to help a study group track their mock-test scores. Today it's a full practice-exam platform used by students, job-seekers and teams preparing for certifications — all without ads, clutter, or paywalled essentials.</p>
        </div>
        <div class="grid" style="grid-template-columns:1fr 1fr; gap:16px;">
          <div class="glass" style="padding:20px; text-align:center;"><div class="stat-number" style="font-size:1.5rem;font-weight:700;">2023</div><div style="color:var(--text-dim); font-size:0.82rem; margin-top:4px;">Founded</div></div>
          <div class="glass" style="padding:20px; text-align:center;"><div class="stat-number" style="font-size:1.5rem;font-weight:700;">12</div><div style="color:var(--text-dim); font-size:0.82rem; margin-top:4px;">Team members</div></div>
          <div class="glass" style="padding:20px; text-align:center;"><div class="stat-number" style="font-size:1.5rem;font-weight:700;">6</div><div style="color:var(--text-dim); font-size:0.82rem; margin-top:4px;">Countries reached</div></div>
          <div class="glass" style="padding:20px; text-align:center;"><div class="stat-number" style="font-size:1.5rem;font-weight:700;">100%</div><div style="color:var(--text-dim); font-size:0.82rem; margin-top:4px;">Independent</div></div>
        </div>
      </div>
    </div>
  </section>

  <!-- Mission & Vision -->
  <section class="section" style="padding-top:0;">
    <div class="container grid grid-2">
      <div class="feature-card glass reveal">
        <div class="feature-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg></div>
        <h3>Our Mission</h3>
        <p>To make high-quality exam practice accessible to anyone, anywhere — free from clutter, ads, and unnecessary friction, so people can focus purely on learning.</p>
      </div>
      <div class="feature-card glass reveal">
        <div class="feature-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7-10-7-10-7z"/></svg></div>
        <h3>Our Vision</h3>
        <p>A world where every learner can measure their own progress clearly, and walk into exam day with genuine confidence instead of guesswork.</p>
      </div>
    </div>
  </section>

  <!-- Features -->
  <section class="section" style="padding-top:0;">
    <div class="container">
      <div class="section-head reveal">
        <span class="eyebrow">What sets us apart</span>
        <h2>Purpose-built for exam practice</h2>
      </div>
      <div class="grid grid-3">
        <div class="feature-card glass reveal">
          <div class="feature-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 8v4l3 3"/><circle cx="12" cy="12" r="9"/></svg></div>
          <h3>Realistic Timing</h3><p>Every mock exam runs under real time pressure with auto-submit on expiry.</p>
        </div>
        <div class="feature-card glass reveal">
          <div class="feature-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h11"/></svg></div>
          <h3>Answer Review</h3><p>See exactly which questions you got right or wrong, with full explanations context.</p>
        </div>
        <div class="feature-card glass reveal">
          <div class="feature-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="9" rx="1"/><rect x="14" y="3" width="7" height="5" rx="1"/><rect x="14" y="12" width="7" height="9" rx="1"/><rect x="3" y="16" width="7" height="5" rx="1"/></svg></div>
          <h3>Personal Dashboard</h3><p>Track scores, streaks, and category performance in one visual workspace.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Team -->
  <section class="section" style="padding-top:0;">
    <div class="container">
      <div class="section-head reveal">
        <span class="eyebrow">Meet the Team</span>
        <h2>The people behind NovaQuiz</h2>
      </div>
      <div class="grid grid-4">
        <div class="team-card glass reveal"><div class="team-avatar">PN</div><h4>Priya Nair</h4><div class="role">Founder &amp; CEO</div><p>Former teacher turned edtech builder.</p></div>
        <div class="team-card glass reveal"><div class="team-avatar">DV</div><h4>Dev Verma</h4><div class="role">Lead Engineer</div><p>Obsessed with fast, accessible interfaces.</p></div>
        <div class="team-card glass reveal"><div class="team-avatar">MH</div><h4>Maya Hussain</h4><div class="role">Head of Content</div><p>Curates and reviews every question bank.</p></div>
        <div class="team-card glass reveal"><div class="team-avatar">TO</div><h4>Tomiwa Okafor</h4><div class="role">Product Designer</div><p>Designs every pixel with clarity in mind.</p></div>
      </div>
    </div>
  </section>

  <!-- Statistics -->
  <section class="section" style="padding-top:0;">
    <div class="container">
      <div class="grid grid-4">
        <div class="stat-card glass reveal"><div class="stat-number" data-count="2.1" data-suffix="M+">0</div><div class="stat-label">Exams Completed</div></div>
        <div class="stat-card glass reveal"><div class="stat-number" data-count="120" data-suffix="+">0</div><div class="stat-label">Mock Exams</div></div>
        <div class="stat-card glass reveal"><div class="stat-number" data-count="40" data-suffix="K+">0</div><div class="stat-label">Active Learners</div></div>
        <div class="stat-card glass reveal"><div class="stat-number" data-count="4.9" data-suffix="/5">0</div><div class="stat-label">Average Rating</div></div>
      </div>
    </div>
  </section>
</main>
</asp:Content>

