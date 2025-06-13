<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 관리</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>Q&A 관리 페이지</h1>
	<a href="adminMain">[메인 페이지]</a>
	
	<table border="1">
		<tr>
			<th>#</th>
			<th>질문자 아이디</th>
			<th>답변자 아이디</th>
			<th>질문</th>
			<th>작성일</th>
			<th>응답일</th>
		</tr>
		<c:forEach items="${qnaList}" var="qna">
			<tr>
				<td>${qna.qnaId}</td>
				<td><a href="userOne?userId=${qna.parentId}">${qna.parentId}</a></td>
				<td><a href="userOne?userId=${qna.adminId}">${qna.adminId}</a></td>
				<td><a href="qnaOne?qnaId=${qna.qnaId}">${qna.question}</a></td>
				<td>${qna.createdAt}</td>
				<td>${qna.answeredAt}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>