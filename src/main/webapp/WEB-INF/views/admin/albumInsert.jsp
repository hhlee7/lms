<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 등록</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>앨범 등록 페이지</h1>
	<a href="albumManagement">뒤로</a>
	
	<form action="albumInsert" method="post" name="album" id="album">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title"></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="description" id="description" rows="5" cols="50"></textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>