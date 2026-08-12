/* =========================================================
   NovaQuiz — dashboard.js
   ========================================================= */

const NovaHistory = {
  KEY: 'novaquiz_history',
  get(){ return JSON.parse(localStorage.getItem(this.KEY) || '[]'); },
  add(entry){
    const list = this.get();
    list.unshift(entry);
    localStorage.setItem(this.KEY, JSON.stringify(list));
  }
};

/* Seed a little demo history the very first time, so the dashboard
   never looks empty for a first-time visitor exploring the UI. */
function seedDemoHistoryIfEmpty(){
  if (NovaHistory.get().length) return;
  const demo = [
    { subject:'General Science', category:'Science', score:8, total:10, percentage:80, timeTaken:640, date: Date.now()-86400000*1 },
    { subject:'Algebra Fundamentals', category:'Mathematics', score:6, total:8, percentage:75, timeTaken:510, date: Date.now()-86400000*3 },
    { subject:'Programming Basics', category:'Computer Science', score:7, total:10, percentage:70, timeTaken:1020, date: Date.now()-86400000*6 },
    { subject:'World Geography', category:'Geography', score:4, total:5, percentage:80, timeTaken:280, date: Date.now()-86400000*9 },
    { subject:'English Grammar', category:'English', score:5, total:6, percentage:83, timeTaken:300, date: Date.now()-86400000*12 }
  ];
  localStorage.setItem(NovaHistory.KEY, JSON.stringify(demo));
}

document.addEventListener('DOMContentLoaded', () => {
  if (!document.querySelector('.dash-wrap')) return;
  seedDemoHistoryIfEmpty();

  const session = NovaAuth.getSession();
  const nameEl = document.querySelector('[data-user-name]');
  if (nameEl) nameEl.textContent = session ? session.name.split(' ')[0] : 'Guest';
  const guestBanner = document.querySelector('.guest-banner');
  if (guestBanner) guestBanner.style.display = session ? 'none' : 'flex';

  const history = NovaHistory.get();

  renderStreak(history);
  renderUpcoming();
  renderRecentResults(history);
  renderNotifications();
  renderProgress(history);
  renderChart(history);
});

function renderStreak(history){
  const el = document.querySelector('[data-exam-count]');
  if (el) el.textContent = history.length;
  const avgEl = document.querySelector('[data-avg-score]');
  if (avgEl){
    const avg = history.length ? Math.round(history.reduce((a,h)=>a+h.percentage,0)/history.length) : 0;
    avgEl.textContent = avg + '%';
  }
}

function renderUpcoming(){
  const container = document.querySelector('[data-upcoming]');
  if (!container) return;
  const upcoming = [
    { subject:'Programming Basics', date:'Tomorrow, 10:00 AM', dur:'25 min' },
    { subject:'World History', date:'Fri, 3:00 PM', dur:'18 min' },
    { subject:'General Science', date:'Next Mon, 9:30 AM', dur:'20 min' }
  ];
  container.innerHTML = upcoming.map(u => `
    <div class="list-item">
      <div class="li-left">
        <div class="li-icon"><svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M8 2v4M16 2v4M3 10h18"/></svg></div>
        <div><div class="li-title">${u.subject}</div><div class="li-sub">${u.date} · ${u.dur}</div></div>
      </div>
      <a href="exams.html" class="btn btn-outline btn-sm">Prepare</a>
    </div>
  `).join('');
}

function renderRecentResults(history){
  const container = document.querySelector('[data-recent-results]');
  if (!container) return;
  if (!history.length){
    container.innerHTML = `<p style="color:var(--text-faint); font-size:0.88rem;">No exams taken yet. Head to the Exams page to get started.</p>`;
    return;
  }
  container.innerHTML = history.slice(0,5).map(h => {
    const cls = h.percentage >= 75 ? 'good' : h.percentage >= 50 ? 'mid' : 'low';
    return `
      <div class="result-row">
        <div><div class="li-title">${h.subject}</div><div class="li-sub">${formatDate(h.date)}</div></div>
        <div class="result-score ${cls}">${h.percentage}%</div>
      </div>
    `;
  }).join('');
}

function renderNotifications(){
  const container = document.querySelector('[data-notifications]');
  if (!container) return;
  const notifs = [
    { text:'Your result for <b>General Science</b> is ready.', time:'2 hours ago' },
    { text:'New exam added: <b>Programming Basics</b>.', time:'Yesterday' },
    { text:'You\'re on a 3-exam streak this week — keep going!', time:'2 days ago' },
    { text:'Reminder: <b>World History</b> mock exam this Friday.', time:'3 days ago' }
  ];
  container.innerHTML = notifs.map(n => `
    <div class="notif-item">
      <span class="notif-dot"></span>
      <div><div class="notif-text">${n.text}</div><div class="notif-time">${n.time}</div></div>
    </div>
  `).join('');
}

function renderProgress(history){
  const container = document.querySelector('[data-progress]');
  if (!container) return;
  const byCategory = {};
  history.forEach(h => {
    if (!byCategory[h.category]) byCategory[h.category] = [];
    byCategory[h.category].push(h.percentage);
  });
  let entries = Object.entries(byCategory).map(([cat, arr]) => [cat, Math.round(arr.reduce((a,b)=>a+b,0)/arr.length)]);
  if (!entries.length){
    entries = [['Mathematics',0],['Science',0],['English',0]];
  }
  container.innerHTML = entries.slice(0,5).map(([cat, pct]) => `
    <div class="progress-item">
      <div class="progress-label"><span>${cat}</span><span>${pct}%</span></div>
      <div class="progress-track"><div class="progress-fill" data-target="${pct}" style="width:0"></div></div>
    </div>
  `).join('');
  requestAnimationFrame(() => {
    setTimeout(()=>{
      container.querySelectorAll('.progress-fill').forEach(el => {
        el.style.width = el.dataset.target + '%';
      });
    }, 150);
  });
}

/* ---------- Performance chart (vanilla canvas line chart) ---------- */
function renderChart(history){
  const canvas = document.querySelector('#performanceChart');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');

  const dataset = history.slice(0, 8).reverse();
  const labels = dataset.map(h => new Date(h.date).toLocaleDateString('en-US',{month:'short', day:'numeric'}));
  const values = dataset.length ? dataset.map(h => h.percentage) : [0];

  function draw(){
    const rect = canvas.parentElement.getBoundingClientRect();
    const dpr = devicePixelRatio || 1;
    canvas.width = rect.width * dpr;
    canvas.height = 220 * dpr;
    canvas.style.width = rect.width + 'px';
    canvas.style.height = '220px';
    ctx.scale(dpr, dpr);

    const W = rect.width, H = 220;
    const padL = 34, padR = 14, padT = 18, padB = 30;
    const plotW = W - padL - padR, plotH = H - padT - padB;

    ctx.clearRect(0,0,W,H);

    const isLight = document.documentElement.getAttribute('data-theme') === 'light';
    const gridColor = isLight ? 'rgba(20,20,40,0.08)' : 'rgba(255,255,255,0.08)';
    const textColor = isLight ? '#8C8FB0' : '#6E7196';

    /* Grid + Y labels */
    ctx.font = '11px Inter, sans-serif';
    ctx.fillStyle = textColor;
    ctx.strokeStyle = gridColor;
    ctx.lineWidth = 1;
    for (let i=0;i<=4;i++){
      const y = padT + (plotH/4)*i;
      ctx.beginPath(); ctx.moveTo(padL, y); ctx.lineTo(W-padR, y); ctx.stroke();
      ctx.fillText((100 - i*25) + '%', 0, y+4);
    }

    if (values.length < 2){
      ctx.fillStyle = textColor;
      ctx.textAlign = 'center';
      ctx.fillText('Take a few exams to see your trend here', W/2, H/2);
      ctx.textAlign = 'left';
      return;
    }

    const stepX = plotW / (values.length-1);
    const points = values.map((v,i) => ({ x: padL + stepX*i, y: padT + plotH - (v/100)*plotH }));

    /* Gradient area fill */
    const grad = ctx.createLinearGradient(0,padT,0,padT+plotH);
    grad.addColorStop(0, 'rgba(124,111,240,0.35)');
    grad.addColorStop(1, 'rgba(124,111,240,0)');
    ctx.beginPath();
    ctx.moveTo(points[0].x, padT+plotH);
    points.forEach(p => ctx.lineTo(p.x,p.y));
    ctx.lineTo(points[points.length-1].x, padT+plotH);
    ctx.closePath();
    ctx.fillStyle = grad;
    ctx.fill();

    /* Line */
    ctx.beginPath();
    points.forEach((p,i) => i===0 ? ctx.moveTo(p.x,p.y) : ctx.lineTo(p.x,p.y));
    const lineGrad = ctx.createLinearGradient(padL,0,W-padR,0);
    lineGrad.addColorStop(0, '#7C6FF0');
    lineGrad.addColorStop(1, '#4FD1C5');
    ctx.strokeStyle = lineGrad;
    ctx.lineWidth = 2.6;
    ctx.lineJoin = 'round';
    ctx.stroke();

    /* Points + X labels */
    ctx.textAlign = 'center';
    points.forEach((p,i) => {
      ctx.beginPath();
      ctx.arc(p.x, p.y, 4, 0, Math.PI*2);
      ctx.fillStyle = isLight ? '#fff' : '#0A0D1A';
      ctx.fill();
      ctx.lineWidth = 2;
      ctx.strokeStyle = '#7C6FF0';
      ctx.stroke();
      ctx.fillStyle = textColor;
      ctx.fillText(labels[i], p.x, H-8);
    });
    ctx.textAlign = 'left';
  }

  draw();
  window.addEventListener('resize', draw);
  document.querySelector('[data-theme-toggle]')?.addEventListener('click', () => setTimeout(draw, 50));
}
