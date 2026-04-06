<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login — MediVision AI</title>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root{--orange:#FF6B2B;--orange-light:#FF8C5A;--orange-pale:#FFF0E8;--cream:#FFFAF6;--gray-900:#111827;--gray-600:#4B5563;--gray-400:#9CA3AF;--gray-200:#E5E7EB;}
*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;}
body{font-family:'Plus Jakarta Sans',sans-serif;background:var(--cream);min-height:100vh;display:flex;align-items:center;justify-content:center;overflow:hidden;}
.bg-circles{position:fixed;inset:0;pointer-events:none;}
.circle{position:absolute;border-radius:50%;opacity:0.07;}
.circle-1{width:600px;height:600px;background:var(--orange);top:-200px;right:-200px;animation:float 8s ease-in-out infinite;}
.circle-2{width:400px;height:400px;background:var(--orange-light);bottom:-150px;left:-100px;animation:float 10s ease-in-out infinite reverse;}
.circle-3{width:200px;height:200px;background:var(--orange);top:40%;left:20%;animation:float 6s ease-in-out infinite;}
@keyframes float{0%,100%{transform:translateY(0)}50%{transform:translateY(-20px)}}

.auth-card{
  background:white;border-radius:24px;width:100%;max-width:420px;
  padding:40px;position:relative;z-index:10;
  box-shadow:0 24px 64px rgba(0,0,0,0.08),0 4px 16px rgba(255,107,43,0.06);
  border:1px solid rgba(255,107,43,0.08);
  animation:slideUp 0.5s ease;
}
@keyframes slideUp{from{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translateY(0)}}

.auth-logo{text-align:center;margin-bottom:28px;}
.logo-icon{width:60px;height:60px;border-radius:16px;background:linear-gradient(135deg,var(--orange),var(--orange-light));display:flex;align-items:center;justify-content:center;font-size:26px;color:white;margin:0 auto 12px;box-shadow:0 8px 24px rgba(255,107,43,0.3);}
.auth-title{font-size:22px;font-weight:800;color:var(--gray-900);}
.auth-subtitle{font-size:13px;color:var(--gray-400);margin-top:4px;}

.demo-chips{display:flex;gap:8px;margin-bottom:24px;}
.demo-chip{flex:1;padding:8px 10px;border-radius:10px;border:1.5px solid var(--gray-200);background:var(--cream);cursor:pointer;transition:all 0.2s;text-align:center;}
.demo-chip:hover,.demo-chip.selected{border-color:var(--orange);background:var(--orange-pale);}
.demo-chip-label{font-size:11px;font-weight:600;color:var(--gray-400);}
.demo-chip-val{font-size:13px;font-weight:700;color:var(--gray-900);}
.demo-chip.selected .demo-chip-label{color:var(--orange);}

.form-group{margin-bottom:16px;}
.form-label{display:block;font-size:13px;font-weight:600;color:var(--gray-900);margin-bottom:6px;}
.input-wrap{position:relative;}
.input-wrap i{position:absolute;left:14px;top:50%;transform:translateY(-50%);color:var(--gray-400);font-size:14px;}
.form-control{
  width:100%;padding:12px 14px 12px 40px;
  border:1.5px solid var(--gray-200);border-radius:10px;
  font-family:inherit;font-size:14px;color:var(--gray-900);
  background:white;outline:none;transition:all 0.2s;
}
.form-control:focus{border-color:var(--orange);box-shadow:0 0 0 3px rgba(255,107,43,0.1);}
.eye-toggle{position:absolute;right:14px;top:50%;transform:translateY(-50%);cursor:pointer;color:var(--gray-400);font-size:14px;background:none;border:none;}
.eye-toggle:hover{color:var(--orange);}

.btn-login{
  width:100%;padding:13px;border-radius:12px;border:none;
  background:linear-gradient(135deg,var(--orange),var(--orange-light));
  color:white;font-family:inherit;font-size:15px;font-weight:700;
  cursor:pointer;box-shadow:0 6px 20px rgba(255,107,43,0.3);
  transition:all 0.2s;display:flex;align-items:center;justify-content:center;gap:8px;
  margin-top:8px;
}
.btn-login:hover{transform:translateY(-1px);box-shadow:0 10px 28px rgba(255,107,43,0.35);}
.btn-login:active{transform:translateY(0);}

.divider{text-align:center;position:relative;margin:20px 0;}
.divider::before{content:'';position:absolute;left:0;top:50%;right:0;height:1px;background:var(--gray-200);}
.divider span{background:white;padding:0 12px;font-size:12px;color:var(--gray-400);position:relative;}

.auth-link{text-align:center;font-size:13px;color:var(--gray-600);}
.auth-link a{color:var(--orange);font-weight:700;text-decoration:none;}
.auth-link a:hover{text-decoration:underline;}

.alert{padding:10px 14px;border-radius:10px;font-size:13px;font-weight:500;margin-bottom:16px;display:flex;align-items:center;gap:8px;}
.alert-error{background:#FEF2F2;color:#991B1B;border:1px solid #FEE2E2;}
.alert-success{background:#ECFDF5;color:#065F46;border:1px solid #D1FAE5;}
</style>
</head>
<body>
<div class="bg-circles">
  <div class="circle circle-1"></div>
  <div class="circle circle-2"></div>
  <div class="circle circle-3"></div>
</div>

<div class="auth-card">
  <div class="auth-logo">
    <div class="logo-icon"><i class="fas fa-heartbeat"></i></div>
    <div class="auth-title">Welcome back</div>
    <div class="auth-subtitle">Login to MediVision AI</div>
  </div>

  {% with messages = get_flashed_messages(with_categories=true) %}
  {% for cat, msg in messages %}
  <div class="alert alert-{{ cat }}"><i class="fas fa-{{ 'check-circle' if cat == 'success' else 'exclamation-circle' }}"></i>{{ msg }}</div>
  {% endfor %}
  {% endwith %}

  <!-- Demo chips -->
  <div class="demo-chips">
    <div class="demo-chip" onclick="fillCreds('admin','admin123',this)">
      <div class="demo-chip-label">👑 Admin</div>
      <div class="demo-chip-val">admin / admin123</div>
    </div>
    <div class="demo-chip" onclick="fillCreds('demo','user123',this)">
      <div class="demo-chip-label">👤 User</div>
      <div class="demo-chip-val">demo / user123</div>
    </div>
  </div>

  <form method="POST" action="/login" id="loginForm">
    <div class="form-group">
      <label class="form-label">Username</label>
      <div class="input-wrap">
        <i class="fas fa-user"></i>
        <input type="text" name="username" id="username" class="form-control" placeholder="Enter username" required autocomplete="off">
      </div>
    </div>
    <div class="form-group">
      <label class="form-label">Password</label>
      <div class="input-wrap">
        <i class="fas fa-lock"></i>
        <input type="password" name="password" id="password" class="form-control" placeholder="Enter password" required>
        <button type="button" class="eye-toggle" onclick="togglePw()"><i class="fas fa-eye" id="eyeIcon"></i></button>
      </div>
    </div>
    <button type="submit" class="btn-login" id="loginBtn">
      <i class="fas fa-sign-in-alt"></i> Login to MediVision
    </button>
  </form>

  <div class="divider"><span>or</span></div>
  <div class="auth-link">Don't have an account? <a href="/signup">Create one free</a></div>
  <div class="auth-link" style="margin-top:8px;"><a href="/"><i class="fas fa-arrow-left"></i> Back to home</a></div>
</div>

<script>
function fillCreds(u, p, el) {
  document.getElementById('username').value = u;
  document.getElementById('password').value = p;
  document.querySelectorAll('.demo-chip').forEach(c => c.classList.remove('selected'));
  el.classList.add('selected');
}
function togglePw() {
  const pw = document.getElementById('password');
  const icon = document.getElementById('eyeIcon');
  if (pw.type === 'password') { pw.type = 'text'; icon.className = 'fas fa-eye-slash'; }
  else { pw.type = 'password'; icon.className = 'fas fa-eye'; }
}
document.getElementById('loginForm').addEventListener('submit', function() {
  const btn = document.getElementById('loginBtn');
  btn.innerHTML = '<span style="width:18px;height:18px;border:2px solid rgba(255,255,255,0.3);border-top-color:white;border-radius:50%;animation:spin 0.7s linear infinite;display:inline-block;"></span> Logging in...';
  btn.disabled = true;
});
</script>
<style>@keyframes spin{from{transform:rotate(0)}to{transform:rotate(360deg)}}</style>
</body>
</html>
