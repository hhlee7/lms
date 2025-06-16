<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 관리 페이지</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>앨범 관리 페이지</h1>
	<a href="/admin/main">[메인 페이지]</a>
	
	<a href="/admin/albumInsert">앨범 등록</a>
	
	<table border="1">
		<tr>
			<th>#</th>
			<th>과목</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${albumList}" var="ab">
		<tr>
			<td>${ab.albumId}</td>
			<td>${ab.subjectName}</td>
			<td><a href="albumOne?albumId=${ab.albumId}">${ab.title}</a></td>
			<td>${ab.createdAt}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>