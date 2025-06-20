<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>로그인 - 송린초등학교</title>
  <style>
    body {
      margin: 0;
      font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
      background: linear-gradient(145deg, #e0f7fa, #ffffff);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-wrapper {
      background: white;
      padding: 40px 50px;
      border-radius: 16px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.1);
      width: 400px;
      text-align: center;
    }
    .login-wrapper h2 {
      margin-bottom: 30px;
      font-size: 24px;
      color: #333;
    }
    .login-wrapper input[type="text"],
    .login-wrapper input[type="password"] {
      width: 100%;
      padding: 12px 15px;
      margin-bottom: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 16px;
    }
    .login-wrapper button {
      width: 100%;
      padding: 12px;
      background-color: #3bc9db;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      color: white;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .login-wrapper button:hover {
      background-color: #33b2c4;
    }
    .login-wrapper .info {
      margin-top: 20px;
      font-size: 0.9rem;
      color: #888;
    }
  </style>
</head>
<body>

<div class="login-wrapper">
  <h2>로그인</h2>
  <form method="post" action="/login">
    <input type="text" name="userId" placeholder="아이디를 입력하세요" required />
    <input type="password" name="password" placeholder="비밀번호를 입력하세요" required />
    <button type="submit">로그인</button>
  </form>
  <div class="info">
    ※ 아이디와 비밀번호는 학교측에 문의하세요.
  </div>
</div>

</body>
</html>
