<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 조회</title>
<style>
  body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
  }

  .container {
    max-width: 600px;
    margin: 80px auto;
    padding: 40px;
    background-color: #fff;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    text-align: center;
  }

  h2 {
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 30px;
    color: #222;
  }

  .info {
    text-align: left;
    font-size: 16px;
    color: #444;
    margin-bottom: 30px;
    line-height: 1.8;
  }

  .info p {
    margin: 10px 0;
    border-bottom: 1px solid #eee;
    padding-bottom: 8px;
  }

  .btn-group {
    display: flex;
    justify-content: center;
    gap: 12px;
    flex-wrap: wrap;
  }

  .btn {
    display: inline-block;
    background-color: #00cfe8;
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 500;
    cursor: pointer;
    text-decoration: none;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    transition: background-color 0.3s;
  }

  .btn:hover {
    background-color: #00b8cf;
  }
</style>
<script>
  window.onload = function() {
    const success = '<c:out value="${success}" />';
    const error = '<c:out value="${error}" />';
    if (success) alert(success);
    if (error) alert(error);
  }
</script>
</head>
<body>
  <div class="container">
    <h2>개인정보 조회</h2>
    <div class="info">
      <p>이름: ${loginUser.userName}</p>
      <p>생년월일: ${loginUser.birth}</p>
      <p>전화번호: ${loginUser.phone}</p>
      <p>주소: ${loginUser.address}</p>
      <p>학력: </p>
      <p>이력: </p>
    </div>
    <div class="btn-group">
      <a href="/teacher/profile/edit" class="btn">✏️ 수정하기</a>
      <button class="btn" onclick="history.back()">🔙 뒤로가기</button>
    </div>
  </div>
</body>
</html>
