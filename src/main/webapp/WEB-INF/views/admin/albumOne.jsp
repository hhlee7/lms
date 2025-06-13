<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>앨범 상세 페이지</h1>
	<a href="albumManagement">뒤로</a>
	
	<c:if test="${album != null}">
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${album.title}</td>
			</tr>
			<tr>
				<th>과목</th>
				<td>${album.subjectName}</td>
			</tr>
			<tr>
				<th>설명</th>
				<td>${album.description}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${album.createdAt}</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test="${photoList != null && not empty photoList}">
	    <div style="display: flex; flex-wrap: wrap; gap: 10px;">
	        <c:forEach items="${photoList}" var="photo">
			    <div style="border: 1px solid #ccc; padding: 5px; margin: 10px;">
			        <img src="${photo.filePath}" 
			             alt="사진" 
			             style="width: 200px; height: auto;">
			    </div>
			</c:forEach>
	    </div>
	</c:if>
</body>
</html>
