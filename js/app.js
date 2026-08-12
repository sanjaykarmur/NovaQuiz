/* =========================================================
   NovaQuiz — app.js
   Shared functionality used across every page: theme toggle,
   mobile navigation, toast notifications, scroll reveals,
   animated counters, and the hero constellation canvas.
   ========================================================= */

/* ---------- Page loader ---------- */
window.addEventListener('load', () => {
  const loader = document.querySelector('.page-loader');
  if (loader) setTimeout(() => loader.classList.add('hidden'), 280);
});

/* ---------- Theme (dark/light) ---------- */
const NovaTheme = {
  KEY: 'novaquiz_theme',
  init(){
    const saved = localStorage.getItem(this.KEY) || 'dark';
    document.documentElement.setAttribute('data-theme', saved);
    document.querySelectorAll('[data-theme-toggle]').forEach(btn=>{
      btn.addEventListener('click', () => this.toggle());
    });
  },
  toggle(){
    const current = document.documentElement.getAttribute('data-theme');
    const next = current === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', next);
    localStorage.setItem(this.KEY, next);
  }
};
NovaTheme.init();

/* ---------- Mobile nav burger ---------- */
document.addEventListener('DOMContentLoaded', () => {
  const burger = document.querySelector('.nav-burger');
  const links = document.querySelector('.nav-links');
  if (burger && links){
    burger.addEventListener('click', () => {
      burger.classList.toggle('open');
      links.classList.toggle('open');
    });
    links.querySelectorAll('a').forEach(a => a.addEventListener('click', () => {
      burger.classList.remove('open');
      links.classList.remove('open');
    }));
  }

  /* Mark active nav link based on current file */
  const page = location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-links a[data-page]').forEach(a=>{
    if (a.dataset.page === page) a.classList.add('active');
  });

  /* Session-aware nav (Login/Signup <-> Dashboard/Logout) */
  const session = NovaAuth.getSession();
  const loginBtn = document.querySelector('[data-nav="login"]');
  const signupBtn = document.querySelector('[data-nav="signup"]');
  if (session && loginBtn && signupBtn){
    loginBtn.textContent = session.name.split(' ')[0];
    loginBtn.setAttribute('href', 'dashboard.html');
    signupBtn.textContent = 'Logout';
    signupBtn.setAttribute('href', '#');
    signupBtn.addEventListener('click', (e)=>{
      e.preventDefault();
      NovaAuth.logout();
      location.reload();
    });
  }

  initReveal();
  initCounters();
  initHeroCanvas();
});

/* ---------- Scroll reveal ---------- */
function initReveal(){
  const items = document.querySelectorAll('.reveal');
  if (!items.length) return;
  const obs = new IntersectionObserver((entries)=>{
    entries.forEach(entry=>{
      if (entry.isIntersecting){
        entry.target.classList.add('in');
        obs.unobserve(entry.target);
      }
    });
  }, { threshold:0.15 });
  items.forEach(el=>obs.observe(el));
}

/* ---------- Animated counters ---------- */
function initCounters(){
  const counters = document.querySelectorAll('[data-count]');
  if (!counters.length) return;
  const obs = new IntersectionObserver((entries)=>{
    entries.forEach(entry=>{
      if (!entry.isIntersecting) return;
      const el = entry.target;
      const target = parseFloat(el.dataset.count);
      const suffix = el.dataset.suffix || '';
      const duration = 1400;
      const start = performance.now();
      function tick(now){
        const p = Math.min((now-start)/duration, 1);
        const eased = 1 - Math.pow(1-p, 3);
        const value = target < 10 ? (target*eased).toFixed(1) : Math.floor(target*eased);
        el.textContent = value + suffix;
        if (p < 1) requestAnimationFrame(tick);
        else el.textContent = target + suffix;
      }
      requestAnimationFrame(tick);
      obs.unobserve(el);
    });
  }, { threshold:0.4 });
  counters.forEach(el=>obs.observe(el));
}

/* ---------- Toast notifications ---------- */
const NovaToast = {
  container(){
    let c = document.querySelector('.toast-container');
    if (!c){
      c = document.createElement('div');
      c.className = 'toast-container';
      document.body.appendChild(c);
    }
    return c;
  },
  icons:{
    success: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M8 12l3 3 5-6"/></svg>',
    error: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M15 9l-6 6M9 9l6 6"/></svg>',
    info: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4M12 8h.01"/></svg>'
  },
  show(title, message='', type='info', duration=3800){
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.innerHTML = `
      <span class="toast-icon">${this.icons[type] || this.icons.info}</span>
      <span class="toast-text"><strong>${title}</strong>${message ? message : ''}</span>
    `;
    this.container().appendChild(toast);
    setTimeout(()=>{
      toast.classList.add('hide');
      setTimeout(()=>toast.remove(), 300);
    }, duration);
  }
};

/* ---------- Hero constellation canvas ----------
   Signature visual: nodes representing knowledge points
   drift and connect when close, echoing "Nova" (star) + exams. */
function initHeroCanvas(){
  const canvas = document.querySelector('.hero-canvas');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  let w, h, nodes = [];
  const isLight = () => document.documentElement.getAttribute('data-theme') === 'light';

  function resize(){
    const rect = canvas.parentElement.getBoundingClientRect();
    w = canvas.width = rect.width * devicePixelRatio;
    h = canvas.height = rect.height * devicePixelRatio;
    canvas.style.width = rect.width + 'px';
    canvas.style.height = rect.height + 'px';
    const count = Math.min(70, Math.floor((rect.width * rect.height) / 14000));
    nodes = Array.from({length: count}, () => ({
      x: Math.random()*w, y: Math.random()*h,
      vx: (Math.random()-0.5)*0.28*devicePixelRatio,
      vy: (Math.random()-0.5)*0.28*devicePixelRatio,
      r: (Math.random()*1.6+0.8)*devicePixelRatio
    }));
  }

  function frame(){
    ctx.clearRect(0,0,w,h);
    const linkDist = 130*devicePixelRatio;
    const dotColor = isLight() ? '124,111,240' : '156,144,255';
    for (let i=0;i<nodes.length;i++){
      const n = nodes[i];
      n.x += n.vx; n.y += n.vy;
      if (n.x < 0 || n.x > w) n.vx *= -1;
      if (n.y < 0 || n.y > h) n.vy *= -1;
      ctx.beginPath();
      ctx.arc(n.x, n.y, n.r, 0, Math.PI*2);
      ctx.fillStyle = `rgba(${dotColor},0.8)`;
      ctx.fill();
      for (let j=i+1;j<nodes.length;j++){
        const m = nodes[j];
        const dx = n.x-m.x, dy = n.y-m.y;
        const dist = Math.sqrt(dx*dx+dy*dy);
        if (dist < linkDist){
          ctx.beginPath();
          ctx.moveTo(n.x,n.y); ctx.lineTo(m.x,m.y);
          ctx.strokeStyle = `rgba(${dotColor},${0.16*(1-dist/linkDist)})`;
          ctx.lineWidth = devicePixelRatio;
          ctx.stroke();
        }
      }
    }
    requestAnimationFrame(frame);
  }

  resize();
  window.addEventListener('resize', resize);
  requestAnimationFrame(frame);
}

/* ---------- Small helpers ---------- */
function formatDate(d){
  return new Date(d).toLocaleDateString('en-US', { month:'short', day:'numeric', year:'numeric' });
}
function formatTime(seconds){
  const m = Math.floor(seconds/60).toString().padStart(2,'0');
  const s = Math.floor(seconds%60).toString().padStart(2,'0');
  return `${m}:${s}`;
}
