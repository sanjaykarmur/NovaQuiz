/* =========================================================
   NovaQuiz — result.js
   ========================================================= */

document.addEventListener('DOMContentLoaded', () => {
  const wrap = document.querySelector('[data-result-wrap]');
  if (!wrap) return;

  const raw = sessionStorage.getItem('novaquiz_last_result');
  if (!raw){
    wrap.innerHTML = `
      <div class="glass text-center" style="padding:60px 30px;">
        <h2 style="margin-bottom:10px;">No recent result found</h2>
        <p style="color:var(--text-dim); margin-bottom:24px;">Take an exam first to see your results here.</p>
        <a href="exams.html" class="btn btn-primary">Browse Exams</a>
      </div>`;
    return;
  }

  const result = JSON.parse(raw);
  const wrong = result.total - result.score;

  /* Score ring */
  const circumference = 2 * Math.PI * 82;
  const ring = document.querySelector('.result-ring-fill');
  ring.style.strokeDasharray = circumference;
  ring.style.strokeDashoffset = circumference;
  document.querySelector('.pct').textContent = result.percentage + '%';

  requestAnimationFrame(() => {
    setTimeout(() => {
      ring.style.strokeDashoffset = circumference - (result.percentage/100) * circumference;
    }, 150);
  });

  const passed = result.percentage >= 50;
  document.querySelector('[data-result-title]').textContent = passed ? 'Great work! 🎉' : 'Keep practicing 💪';
  document.querySelector('[data-result-sub]').textContent = `You scored ${result.score} out of ${result.total} on ${result.subject}.`;

  document.querySelector('[data-stat-score]').textContent = `${result.score}/${result.total}`;
  document.querySelector('[data-stat-correct]').textContent = result.score;
  document.querySelector('[data-stat-wrong]').textContent = wrong;
  document.querySelector('[data-stat-time]').textContent = formatTime(result.timeTaken);

  /* Review list */
  const reviewContainer = document.querySelector('[data-review-list]');
  reviewContainer.innerHTML = result.review.map((r,i) => {
    const isCorrect = r.selectedIndex === r.correctIndex;
    return `
      <div class="review-item glass reveal in">
        <div class="review-item-head">
          <div><strong>Q${i+1}.</strong> ${r.question}</div>
          <span class="review-badge ${isCorrect ? 'correct':'incorrect'}">${isCorrect ? '✓ Correct' : '✕ Incorrect'}</span>
        </div>
        ${r.options.map((opt, oi) => {
          let cls = '';
          if (oi === r.correctIndex) cls = 'correct-answer';
          else if (oi === r.selectedIndex) cls = 'wrong-answer';
          return `<div class="review-opt ${cls}">${String.fromCharCode(65+oi)}. ${opt} ${oi===r.correctIndex ? ' — Correct answer' : (oi===r.selectedIndex ? ' — Your answer' : '')}</div>`;
        }).join('')}
        ${r.selectedIndex === null ? '<div class="review-opt wrong-answer">Not answered</div>' : ''}
      </div>
    `;
  }).join('');

  document.querySelector('[data-retake]')?.setAttribute('href', `exam.html?id=${result.examId}`);
});
