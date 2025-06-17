<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 개인정보 페이지</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        background-color: #f5f6fa;
        color: #333;
    }

    .container {
        max-width: 800px;
        margin: 40px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    h1 {
        font-size: 28px;
        color: #007acc;
        text-align: center;
        margin-bottom: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    table, th, td {
        border: 1px solid #ccc;
    }

    td {
        padding: 12px 16px;
        font-size: 16px;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr td:first-child {
        font-weight: bold;
        width: 30%;
        background-color: #f0f4f8;
    }

    .edit-link {
        display: inline-block;
        margin-top: 20px;
        text-align: center;
        width: 100%;
    }

    .edit-link a {
        color: #fff;
        background-color: #007acc;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 6px;
        transition: background-color 0.2s ease;
    }

    .edit-link a:hover {
        background-color: #005f99;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
        <h1>내 개인정보</h1>
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
                <td>학년</td>
                <td>${grade}</td>
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

        <div class="edit-link">
            <a href="/student/updateInformation">비밀번호 수정</a>
        </div>
    </div>
</body>
</html>