<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 개인정보 페이지</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f5f8fc;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 600px;
        margin: 40px auto;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        padding: 30px;
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    td {
        padding: 12px 15px;
        border-bottom: 1px solid #ddd;
    }

    td:first-child {
        font-weight: bold;
        background-color: #f0f4f8;
        width: 30%;
        color: #333;
    }

    td:last-child {
        color: #555;
    }

    .btn-group {
        text-align: center;
    }

    .btn-group a {
        display: inline-block;
        padding: 10px 20px;
        margin: 10px 10px 0;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        transition: background-color 0.3s ease;
    }

    .btn-group a:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
	    <h2>👨‍✈️ 기사 개인정보</h2>

	    <table>
	        <tr>
	            <td>이름</td>
	            <td>${user.userName}</td>
	        </tr>
	        <tr>
	            <td>생년월일</td>
	            <td>${user.birth}</td>
	        </tr>
	        <tr>
	            <td>이메일</td>
	            <td>${user.email}</td>
	        </tr>
	        <tr>
	            <td>주소</td>
	            <td>${user.address}</td>
	        </tr>
	        <tr>
	            <td>전화번호</td>
	            <td>${user.phone}</td>
	        </tr>
	    </table>

	    <div class="btn-group">
	        <a href="/driver/updateInformation">개인정보 수정</a>
	        <a href="/driver/updatePassword">비밀번호 수정</a>
	    </div>
	</div>
</body>
</html>