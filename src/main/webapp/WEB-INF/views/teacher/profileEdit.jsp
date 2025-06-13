<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>개인정보 수정</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 600px;
      margin: 80px auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 24px;
      color: #222;
    }

    form p {
      margin-bottom: 15px;
      font-size: 16px;
      color: #333;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px 12px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      box-sizing: border-box;
      margin-top: 6px;
    }

    hr {
      margin: 30px 0;
      border: none;
      border-top: 1px solid #eee;
    }

    .btn-group {
      display: flex;
      justify-content: center;
      gap: 12px;
      margin-top: 30px;
    }

    button {
      background-color: #00cfe8;
      color: white;
      border: none;
      padding: 12px 20px;
      font-size: 15px;
      font-weight: 500;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    button:hover {
      background-color: #00b8cf;
    }
  </style>

  <script>
    window.onload = function () {
      const success = '${success}';
      const error = '${error}';

      if (success) alert(success);
      if (error) alert(error);
    };
  </script>
</head>
<body>
  <div class="container">
    <h2>개인정보 수정</h2>
    <form method="post" action="/teacher/profile/edit">
      <p>이름: ${teacher.name}</p>
      <p>생년월일: ${teacher.birth}</p>
      <p>최종학력: ${teacher.lastEducation}</p>
      <p>이력: ${teacher.personalHistory}</p>

      <p>전화번호:  
        <input type="text" name="phone" value="${teacher.phone}" />
      </p>
      <p>주소:  
        <input type="text" name="address" value="${teacher.address}" />
      </p>

      <hr>

      <p>현재 비밀번호:  
        <input type="password" name="currentPassword" />
      </p>
      <p>새 비밀번호:  
        <input type="password" name="newPassword" />
      </p>
      <p>새 비밀번호 확인:  
        <input type="password" name="confirmPassword" />
      </p>

      <div class="btn-group">
        <button type="submit">✏️ 수정하기</button>
        <button type="button" onclick="history.back()">🔙 뒤로가기</button>
      </div>
    </form>
  </div>
</body>
</html>
