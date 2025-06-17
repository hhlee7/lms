<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>공지사항 상세</h1>
	<table border="1">
			<tr>
				<th>제목</th>
				<td>${notice.title}</td>
			</tr>
			<tr>
				<th>작성 관리자</th>
				<td>${notice.adminName}</td>
			</tr>
			<tr>
				<th>공지 대상</th>
				<td>${notice.roleName}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" rows="5" cols="50" readonly>${notice.content}</textarea></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${notice.createdAt}</td>
			</tr>
		</table>
	<a href="/admin/noticeModify?noticeId=${notice.noticeId}">수정</a>
	<a href="/admin/noticeManagement">뒤로</a>
</body>
</html>