/* =========================================================
   NovaQuiz — exams.js
   Powers the Exams listing page and the Exam-taking page.
   EXAM_DATA mirrors data/questions.json — embedded directly so
   the site works when opened straight from disk (file://) without
   needing a local server for fetch().
   ========================================================= */

const EXAM_DATA = {
  exams: [
    { id:"math101", subject:"Algebra Fundamentals", category:"Mathematics", duration:15, difficulty:"Easy", icon:"calculator",
      description:"Core algebra concepts: equations, expressions and functions.",
      questions:[
        { q:"Solve for x: 2x + 6 = 14", options:["3","4","5","8"], answer:1 },
        { q:"What is the value of 5² − 3²?", options:["16","22","10","4"], answer:0 },
        { q:"Simplify: 3(x + 4) − 2x", options:["x + 12","x + 4","5x + 4","x + 8"], answer:0 },
        { q:"If f(x) = 2x + 1, what is f(3)?", options:["5","6","7","8"], answer:2 },
        { q:"What is the slope of y = 3x − 7?", options:["-7","3","7","-3"], answer:1 },
        { q:"Solve: x/4 = 9", options:["36","13","2.25","5"], answer:0 },
        { q:"Which is a quadratic equation?", options:["y = 2x + 1","y = x² + 1","y = 1/x","y = 3"], answer:1 },
        { q:"Factor: x² − 9", options:["(x-3)(x+3)","(x-9)(x+1)","(x-3)²","(x+9)(x-1)"], answer:0 }
      ]},
    { id:"sci101", subject:"General Science", category:"Science", duration:20, difficulty:"Medium", icon:"flask",
      description:"Physics, chemistry and biology basics for high-school level.",
      questions:[
        { q:"What gas do plants primarily absorb for photosynthesis?", options:["Oxygen","Nitrogen","Carbon dioxide","Hydrogen"], answer:2 },
        { q:"What is the SI unit of force?", options:["Joule","Newton","Watt","Pascal"], answer:1 },
        { q:"How many bones are in the adult human body?", options:["186","206","226","246"], answer:1 },
        { q:"What is the chemical symbol for Sodium?", options:["So","S","Na","Sd"], answer:2 },
        { q:"Which planet is known as the Red Planet?", options:["Venus","Jupiter","Mars","Saturn"], answer:2 },
        { q:"What is the powerhouse of the cell?", options:["Nucleus","Ribosome","Mitochondria","Golgi body"], answer:2 },
        { q:"Sound cannot travel through:", options:["Water","Vacuum","Steel","Air"], answer:1 },
        { q:"What is the boiling point of water at sea level (°C)?", options:["90","100","110","120"], answer:1 },
        { q:"DNA stands for:", options:["Deoxyribonucleic acid","Diribonucleic acid","Dual nucleic acid","Deoxyribose nuclear acid"], answer:0 },
        { q:"Which force keeps planets in orbit?", options:["Magnetism","Gravity","Friction","Tension"], answer:1 }
      ]},
    { id:"eng101", subject:"English Grammar", category:"English", duration:12, difficulty:"Easy", icon:"book",
      description:"Grammar, vocabulary and comprehension essentials.",
      questions:[
        { q:"Choose the correctly spelled word.", options:["Recieve","Receive","Receeve","Receve"], answer:1 },
        { q:"Identify the noun: 'The cat sleeps quietly.'", options:["sleeps","quietly","cat","the"], answer:2 },
        { q:"What is the past tense of 'go'?", options:["goed","gone","went","going"], answer:2 },
        { q:"Choose the correct article: '___ university'", options:["a","an","the only","no article"], answer:0 },
        { q:"'Quick' is an example of a/an:", options:["Noun","Adjective","Adverb","Pronoun"], answer:1 },
        { q:"Pick the synonym of 'happy'.", options:["Sad","Joyful","Angry","Tired"], answer:1 }
      ]},
    { id:"cs101", subject:"Programming Basics", category:"Computer Science", duration:25, difficulty:"Hard", icon:"code",
      description:"Logic, algorithms, and fundamentals of programming.",
      questions:[
        { q:"Which data structure uses FIFO order?", options:["Stack","Queue","Tree","Graph"], answer:1 },
        { q:"What is the time complexity of binary search?", options:["O(n)","O(n²)","O(log n)","O(1)"], answer:2 },
        { q:"Which symbol is used for comments in Python?", options:["//","#","<!-- -->","/* */"], answer:1 },
        { q:"What does HTML stand for?", options:["Hyper Trainer Markup Language","HyperText Markup Language","Hyper Text Marketing Language","Home Tool Markup Language"], answer:1 },
        { q:"Which is not a programming paradigm?", options:["Object-oriented","Functional","Circular","Procedural"], answer:2 },
        { q:"What does 'CSS' stand for?", options:["Cascading Style Sheets","Creative Style System","Computer Styled Sections","Colorful Style Sheets"], answer:0 },
        { q:"Which loop always runs at least once?", options:["for","while","do-while","foreach"], answer:2 },
        { q:"Which of these is a JavaScript framework?", options:["Django","Laravel","React","Flask"], answer:2 },
        { q:"What does 'JSON' stand for?", options:["JavaScript Object Notation","Java Standard Object Notation","JavaScript Oriented Network","Just Simple Object Notation"], answer:0 },
        { q:"Git is primarily used for:", options:["Styling","Version control","Testing","Deployment only"], answer:1 }
      ]},
    { id:"hist101", subject:"World History", category:"History", duration:18, difficulty:"Medium", icon:"landmark",
      description:"Key events and figures that shaped world history.",
      questions:[
        { q:"The Great Wall is located in which country?", options:["Japan","China","Mongolia","Korea"], answer:1 },
        { q:"World War II ended in the year:", options:["1943","1944","1945","1946"], answer:2 },
        { q:"Who was the first President of the United States?", options:["Lincoln","Jefferson","Washington","Adams"], answer:2 },
        { q:"The Renaissance began in which country?", options:["France","Italy","Spain","Germany"], answer:1 },
        { q:"The Pyramids of Giza are located in:", options:["Sudan","Egypt","Libya","Morocco"], answer:1 },
        { q:"Who wrote the Declaration of Independence?", options:["Franklin","Jefferson","Washington","Hamilton"], answer:1 }
      ]},
    { id:"geo101", subject:"World Geography", category:"Geography", duration:10, difficulty:"Easy", icon:"globe",
      description:"Continents, capitals, and geographic landmarks.",
      questions:[
        { q:"Which is the largest continent?", options:["Africa","Asia","Europe","Antarctica"], answer:1 },
        { q:"What is the longest river in the world?", options:["Amazon","Nile","Yangtze","Mississippi"], answer:1 },
        { q:"Mount Everest is located in:", options:["India","Nepal","China","Bhutan"], answer:1 },
        { q:"Which is the smallest country by area?", options:["Monaco","Vatican City","San Marino","Malta"], answer:1 },
        { q:"The Sahara Desert is located in:", options:["Asia","Australia","Africa","South America"], answer:2 }
      ]}
  ]
};

const EXAM_ICONS = {
  calculator: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="4" y="2" width="16" height="20" rx="2"/><path d="M8 6h8M8 10h.01M12 10h.01M16 10h.01M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01M16 18h.01"/></svg>',
  flask: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 2v6L4 18a2 2 0 002 3h12a2 2 0 002-3l-5-10V2"/><path d="M9 2h6"/><path d="M7 15h10"/></svg>',
  book: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 19.5A2.5 2.5 0 016.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z"/></svg>',
  code: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 18l6-6-6-6M8 6l-6 6 6 6"/></svg>',
  landmark: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 22h18M4 22V11M20 22V11M2 11l10-7 10 7M6 11v11M10 11v11M14 11v11M18 11v11"/></svg>',
  globe: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M2 12h20M12 2a15 15 0 010 20 15 15 0 010-20z"/></svg>'
};

/* =====================================================
   EXAMS LISTING PAGE
   ===================================================== */
function initExamsListing(){
  const grid = document.querySelector('[data-exam-grid]');
  if (!grid) return;

  const searchInput = document.querySelector('[data-exam-search]');
  const chips = document.querySelectorAll('.chip');
  let activeCategory = 'All';
  let query = '';

  function render(){
    const filtered = EXAM_DATA.exams.filter(ex => {
      const matchesCat = activeCategory === 'All' || ex.category === activeCategory;
      const matchesQuery = ex.subject.toLowerCase().includes(query) || ex.category.toLowerCase().includes(query);
      return matchesCat && matchesQuery;
    });

    if (!filtered.length){
      grid.innerHTML = `<div class="no-results">No exams match your search. Try a different keyword or category.</div>`;
      return;
    }

    grid.innerHTML = filtered.map(ex => `
      <div class="exam-card glass reveal in">
        <div class="exam-card-top">
          <div class="exam-icon">${EXAM_ICONS[ex.icon] || EXAM_ICONS.book}</div>
          <span class="badge badge-${ex.difficulty.toLowerCase()}">${ex.difficulty}</span>
        </div>
        <div>
          <h3>${ex.subject}</h3>
          <div class="exam-cat">${ex.category}</div>
        </div>
        <p class="exam-desc">${ex.description}</p>
        <div class="exam-meta">
          <span><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>${ex.duration} min</span>
          <span><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h11"/></svg>${ex.questions.length} Questions</span>
        </div>
        <a href="exam.html?id=${ex.id}" class="btn btn-primary btn-block">Start Exam</a>
      </div>
    `).join('');
  }

  searchInput?.addEventListener('input', (e) => { query = e.target.value.trim().toLowerCase(); render(); });
  chips.forEach(chip => {
    chip.addEventListener('click', () => {
      chips.forEach(c => c.classList.remove('active'));
      chip.classList.add('active');
      activeCategory = chip.dataset.category;
      render();
    });
  });

  render();
}

/* =====================================================
   EXAM-TAKING PAGE
   ===================================================== */
function initExamPage(){
  const shell = document.querySelector('.exam-shell');
  if (!shell) return;

  const params = new URLSearchParams(location.search);
  const examId = params.get('id');
  const exam = EXAM_DATA.exams.find(e => e.id === examId) || EXAM_DATA.exams[0];

  /* Randomize question order for a fresh attempt every time */
  const questions = shuffleArray(exam.questions.map((q,i) => ({...q, originalIndex:i})));
  const answers = new Array(questions.length).fill(null);
  let current = 0;

  document.querySelector('[data-exam-title]').textContent = exam.subject;
  document.querySelector('[data-exam-sub]').textContent = `${exam.category} · ${questions.length} Questions`;

  const qJump = document.querySelector('[data-q-jump]');
  qJump.innerHTML = questions.map((_, i) => `<button data-jump="${i}">${i+1}</button>`).join('');
  qJump.addEventListener('click', (e) => {
    const btn = e.target.closest('button[data-jump]');
    if (!btn) return;
    current = parseInt(btn.dataset.jump);
    renderQuestion();
  });

  function renderQuestion(){
    const q = questions[current];
    document.querySelector('[data-q-index]').textContent = `Question ${current+1} of ${questions.length}`;
    document.querySelector('[data-q-text]').textContent = q.q;
    const list = document.querySelector('[data-option-list]');
    list.innerHTML = q.options.map((opt,i) => `
      <div class="option ${answers[current]===i ? 'selected':''}" data-option="${i}" role="radio" tabindex="0" aria-checked="${answers[current]===i}">
        <span class="option-letter">${String.fromCharCode(65+i)}</span>
        <span class="option-text">${opt}</span>
      </div>
    `).join('');
    list.querySelectorAll('.option').forEach(opt => {
      opt.addEventListener('click', () => selectOption(parseInt(opt.dataset.option)));
      opt.addEventListener('keydown', (e) => { if (e.key==='Enter' || e.key===' ') { e.preventDefault(); selectOption(parseInt(opt.dataset.option)); } });
    });

    document.querySelector('[data-prev]').disabled = current === 0;
    const nextBtn = document.querySelector('[data-next]');
    const submitBtn = document.querySelector('[data-submit]');
    if (current === questions.length-1){
      nextBtn.style.display = 'none';
      submitBtn.style.display = 'inline-flex';
    } else {
      nextBtn.style.display = 'inline-flex';
      submitBtn.style.display = 'none';
    }

    document.querySelector('[data-progress-fill]').style.width = `${((current+1)/questions.length)*100}%`;
    qJump.querySelectorAll('button').forEach((btn,i) => {
      btn.classList.toggle('current', i===current);
      btn.classList.toggle('answered', answers[i] !== null);
    });
  }

  function selectOption(i){
    answers[current] = i;
    renderQuestion();
  }

  document.querySelector('[data-prev]').addEventListener('click', () => { if (current>0){ current--; renderQuestion(); } });
  document.querySelector('[data-next]').addEventListener('click', () => {
    if (answers[current] === null){ NovaToast.show('Select an answer', 'Please choose an option before continuing.', 'info'); return; }
    if (current < questions.length-1){ current++; renderQuestion(); }
  });
  document.querySelector('[data-submit]').addEventListener('click', () => submitExam());

  /* ---------- Timer ---------- */
  const timerEl = document.querySelector('[data-timer]');
  const timer = createCountdownTimer({
    totalSeconds: exam.duration * 60,
    onTick: (remaining, warn) => {
      timerEl.textContent = formatTime(remaining);
      timerEl.parentElement.classList.toggle('warn', warn);
    },
    onExpire: () => {
      NovaToast.show('Time is up!', 'Submitting your exam automatically.', 'error');
      setTimeout(submitExam, 900);
    }
  });
  timer.start();

  let submitted = false;
  function submitExam(){
    if (submitted) return;
    submitted = true;
    timer.stop();
    const timeTaken = timer.elapsed();

    let correct = 0;
    const reviewData = questions.map((q,i) => {
      const isCorrect = answers[i] === q.answer;
      if (isCorrect) correct++;
      return { question:q.q, options:q.options, correctIndex:q.answer, selectedIndex:answers[i] };
    });

    const percentage = Math.round((correct/questions.length)*100);
    const resultEntry = {
      examId: exam.id,
      subject: exam.subject,
      category: exam.category,
      score: correct,
      total: questions.length,
      percentage,
      timeTaken,
      date: Date.now(),
      review: reviewData
    };

    sessionStorage.setItem('novaquiz_last_result', JSON.stringify(resultEntry));
    const history = JSON.parse(localStorage.getItem('novaquiz_history') || '[]');
    history.unshift({ subject:resultEntry.subject, category:resultEntry.category, score:correct, total:questions.length, percentage, timeTaken, date:resultEntry.date });
    localStorage.setItem('novaquiz_history', JSON.stringify(history));

    window.location.href = 'result.html';
  }

  /* Warn before leaving mid-exam */
  window.addEventListener('beforeunload', (e) => {
    if (!submitted){ e.preventDefault(); e.returnValue = ''; }
  });

  renderQuestion();
}

function shuffleArray(arr){
  const a = [...arr];
  for (let i=a.length-1;i>0;i--){
    const j = Math.floor(Math.random()*(i+1));
    [a[i],a[j]] = [a[j],a[i]];
  }
  return a;
}

document.addEventListener('DOMContentLoaded', () => {
  initExamsListing();
  initExamPage();
});
