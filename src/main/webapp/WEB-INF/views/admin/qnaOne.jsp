<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>Q&A 상세 페이지</h1>
	<a href="qnaManagement">뒤로</a>
	
	<form action="qnaAnswer" method="post" name="qna" id="qna">
		<input type="hidden" name="qnaId" id="qnaId" value="${qna.qnaId}">
		<input type="hidden" name="adminId" id="adminId" value="${loginUser.userId}">
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${qna.question}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${qna.parentId}</td>
			</tr>
			<tr>
				<th>답하기</th>
				<td><textarea id="answer" name="answer" cols="50" rows="5">${qna.answer}</textarea></td>
			</tr>
		</table>
		<button type="submit">답하기</button>
	</form>
</body>
</html>