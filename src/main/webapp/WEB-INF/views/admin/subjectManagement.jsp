<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 관리</title>
</head>
<body>
	<h1>과목 관리</h1>

	<div><a href="/admin/main">[메인 페이지]</a></div>
	
	<div><a href="/admin/createSubject">과목 등록</a></div>
	
	<table border="1">
		<tr>
			<th>과목</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="subject" items="${subjectList}">
		<tr>
			<td>${subject.subjectName}</td>
			<td><a href="/admin/modifySubject?subjectId=${subject.subjectId}">수정</a></td>
			<td>
				<form method="post" action="/admin/removeSubject">
					<input type="hidden" name="subjectId" value="${subject.subjectId}">
					<button type="submit" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
				</form>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>