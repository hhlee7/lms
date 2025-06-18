<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f7fb;
    margin: 0;
	padding: 120px 0 40px;
  }

  h1 {
    text-align: center;
    color: #2c3e50;
    font-size: 28px;
    margin-bottom: 40px;
  }

  .notice-table {
    width: 70%;
    margin: 0 auto;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    font-size: 16px;
  }

  .notice-table th {
    width: 20%;
    background-color: #f0f4ff;
    color: #333;
    text-align: left;
    padding: 14px;
    border-bottom: 1px solid #e0e0e0;
  }

  .notice-table td {
    padding: 14px;
    border-bottom: 1px solid #e0e0e0;
    background-color: #ffffff;
  }

  .notice-table tr:last-child td,
  .notice-table tr:last-child th {
    border-bottom: none;
  }

  .back-button {
    display: block;
    width: 120px;
    text-align: center;
    margin: 30px auto 0;
    padding: 10px 0;
    background-color: #0077cc;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    transition: background-color 0.2s ease;
  }

  .back-button:hover {
    background-color: #005fa3;
  }
</style>
</head>
<body>
	<h1>공지사항</h1>
	<table class="notice-table">
		<tr>
			<th>번호</th>
			<td>${notice.noticeId}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${notice.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${notice.content}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>관리자</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${notice.createdAt}</td>
		</tr>
	</table>
	
	<a class="back-button" href="/parent/notice">목록으로</a>
</body>
</html>