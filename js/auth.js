/* =========================================================
   NovaQuiz — auth.js
   Handles localStorage-backed users, sessions, and the
   login / sign-up form logic (validation + UX feedback).
   NOTE: demo-only auth (no real hashing/back-end).
   ========================================================= */

const NovaAuth = {
  USERS_KEY: 'novaquiz_users',
  SESSION_KEY: 'novaquiz_session',

  getUsers(){
    return JSON.parse(localStorage.getItem(this.USERS_KEY) || '[]');
  },
  saveUsers(users){
    localStorage.setItem(this.USERS_KEY, JSON.stringify(users));
  },
  findUser(emailOrUsername){
    const q = emailOrUsername.trim().toLowerCase();
    return this.getUsers().find(u => u.email.toLowerCase() === q || u.username.toLowerCase() === q);
  },
  register(user){
    const users = this.getUsers();
    users.push(user);
    this.saveUsers(users);
  },
  getSession(){
    return JSON.parse(localStorage.getItem(this.SESSION_KEY) || 'null');
  },
  setSession(user, remember){
    const session = { name:user.fullName, username:user.username, email:user.email, loggedInAt:Date.now() };
    localStorage.setItem(this.SESSION_KEY, JSON.stringify(session));
  },
  logout(){
    localStorage.removeItem(this.SESSION_KEY);
  },
  requireAuth(){
    if (!this.getSession()){
      window.location.href = 'login.html';
    }
  }
};

/* ---------- Field validation helpers ---------- */
function setFieldState(input, valid, message){
  const group = input.closest('.form-group');
  if (!group) return;
  const hint = group.querySelector('.field-hint');
  group.classList.remove('valid','invalid');
  if (input.value.trim() === '' && !group.classList.contains('touched')) return;
  group.classList.add(valid ? 'valid' : 'invalid');
  if (hint) hint.textContent = valid ? '' : message;
}
const Validators = {
  email: v => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v),
  phone: v => /^[0-9]{10,15}$/.test(v.replace(/[\s\-+]/g,'')),
  minLen: (v,n) => v.length >= n,
  notEmpty: v => v.trim().length > 0
};

/* ---------- Password strength ---------- */
function passwordStrength(pw){
  let score = 0;
  if (pw.length >= 8) score++;
  if (/[A-Z]/.test(pw)) score++;
  if (/[0-9]/.test(pw)) score++;
  if (/[^A-Za-z0-9]/.test(pw)) score++;
  if (pw.length >= 12) score++;
  return Math.min(score, 4); // 0-4
}
const STRENGTH_LABELS = ['Very weak','Weak','Fair','Strong','Very strong'];
const STRENGTH_COLORS = ['var(--coral)','var(--coral)','var(--gold)','var(--green)','var(--green)'];

/* ---------- LOGIN PAGE ---------- */
function initLoginForm(){
  const form = document.getElementById('loginForm');
  if (!form) return;

  const emailInput = form.querySelector('#email');
  const passInput = form.querySelector('#password');
  const togglePw = form.querySelector('[data-toggle-password]');

  togglePw?.addEventListener('click', () => {
    passInput.type = passInput.type === 'password' ? 'text' : 'password';
    togglePw.classList.toggle('showing');
  });

  emailInput.addEventListener('blur', () => {
    emailInput.closest('.form-group').classList.add('touched');
    setFieldState(emailInput, Validators.notEmpty(emailInput.value), 'Enter your email or username to continue.');
  });
  passInput.addEventListener('blur', () => {
    passInput.closest('.form-group').classList.add('touched');
    setFieldState(passInput, Validators.minLen(passInput.value,6), 'Password must be at least 6 characters.');
  });

  form.addEventListener('submit', (e)=>{
    e.preventDefault();
    let valid = true;
    if (!Validators.notEmpty(emailInput.value)){ setFieldState(emailInput,false,'Enter your email or username.'); emailInput.closest('.form-group').classList.add('touched'); valid=false; }
    if (!Validators.minLen(passInput.value,6)){ setFieldState(passInput,false,'Password must be at least 6 characters.'); passInput.closest('.form-group').classList.add('touched'); valid=false; }
    if (!valid) return;

    const submitBtn = form.querySelector('button[type="submit"]');
    submitBtn.disabled = true;
    submitBtn.innerHTML = 'Signing in <span class="btn-spinner"></span>';

    setTimeout(()=>{
      const user = NovaAuth.findUser(emailInput.value);
      if (!user || user.password !== passInput.value){
        NovaToast.show('Login failed', 'Check your credentials and try again.', 'error');
        submitBtn.disabled = false;
        submitBtn.textContent = 'Log In';
        return;
      }
      NovaAuth.setSession(user, form.querySelector('#remember').checked);
      NovaToast.show('Welcome back!', `Signed in as ${user.fullName}.`, 'success');
      setTimeout(()=> window.location.href = 'dashboard.html', 700);
    }, 700);
  });
}

/* ---------- SIGNUP PAGE ---------- */
function initSignupForm(){
  const form = document.getElementById('signupForm');
  if (!form) return;

  const fields = {
    fullName: form.querySelector('#fullName'),
    username: form.querySelector('#username'),
    email: form.querySelector('#suEmail'),
    mobile: form.querySelector('#mobile'),
    password: form.querySelector('#suPassword'),
    confirm: form.querySelector('#confirmPassword'),
    terms: form.querySelector('#terms')
  };
  const strengthBar = form.querySelector('.strength-bar-fill');
  const strengthLabel = form.querySelector('.strength-label');

  fields.password.addEventListener('input', () => {
    const s = passwordStrength(fields.password.value);
    strengthBar.style.width = `${(s/4)*100}%`;
    strengthBar.style.background = STRENGTH_COLORS[s];
    strengthLabel.textContent = fields.password.value ? STRENGTH_LABELS[s] : '';
    strengthLabel.style.color = STRENGTH_COLORS[s];
  });

  const rules = [
    [fields.fullName, v => Validators.notEmpty(v) && v.trim().length>=3, 'Enter your full name (min. 3 characters).'],
    [fields.username, v => /^[a-zA-Z0-9_]{4,16}$/.test(v), '4–16 characters: letters, numbers, underscore.'],
    [fields.email, v => Validators.email(v), 'Enter a valid email address.'],
    [fields.mobile, v => Validators.phone(v), 'Enter a valid mobile number (10+ digits).'],
    [fields.password, v => passwordStrength(v) >= 2, 'Use 8+ characters with a number and uppercase letter.'],
    [fields.confirm, v => v === fields.password.value && v.length>0, 'Passwords do not match.']
  ];
  rules.forEach(([input, fn, msg])=>{
    input.addEventListener('blur', ()=>{
      input.closest('.form-group').classList.add('touched');
      setFieldState(input, fn(input.value), msg);
    });
    input.addEventListener('input', ()=>{
      if (input.closest('.form-group').classList.contains('touched')) setFieldState(input, fn(input.value), msg);
    });
  });

  form.addEventListener('submit', (e)=>{
    e.preventDefault();
    let valid = true;
    rules.forEach(([input, fn, msg])=>{
      input.closest('.form-group').classList.add('touched');
      const ok = fn(input.value);
      setFieldState(input, ok, msg);
      if (!ok) valid = false;
    });
    if (!fields.terms.checked){
      NovaToast.show('Accept the terms', 'Please accept the Terms & Conditions to continue.', 'error');
      valid = false;
    }
    if (NovaAuth.findUser(fields.email.value) || NovaAuth.findUser(fields.username.value)){
      NovaToast.show('Account exists', 'That email or username is already registered.', 'error');
      valid = false;
    }
    if (!valid) return;

    const submitBtn = form.querySelector('button[type="submit"]');
    submitBtn.disabled = true;
    submitBtn.innerHTML = 'Creating account <span class="btn-spinner"></span>';

    setTimeout(()=>{
      const user = {
        fullName: fields.fullName.value.trim(),
        username: fields.username.value.trim(),
        email: fields.email.value.trim(),
        mobile: fields.mobile.value.trim(),
        password: fields.password.value
      };
      NovaAuth.register(user);
      NovaAuth.setSession(user, true);
      NovaToast.show('Account created!', 'Welcome to NovaQuiz.', 'success');
      setTimeout(()=> window.location.href = 'dashboard.html', 800);
    }, 800);
  });
}

document.addEventListener('DOMContentLoaded', () => {
  initLoginForm();
  initSignupForm();

  /* Social login buttons — UI only */
  document.querySelectorAll('.social-login-btn').forEach(btn=>{
    btn.addEventListener('click', ()=> NovaToast.show('Not connected', 'Social login is a UI preview in this demo.', 'info'));
  });

  /* Forgot password — UI only */
  const forgot = document.querySelector('[data-forgot-password]');
  forgot?.addEventListener('click', (e)=>{
    e.preventDefault();
    NovaToast.show('Reset link sent', 'Check your inbox for password reset instructions.', 'info');
  });
});
