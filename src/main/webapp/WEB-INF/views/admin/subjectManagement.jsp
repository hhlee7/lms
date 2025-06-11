<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>subjectManagement</title>
</head>
<body>
	<h1>과목 관리</h1>
	
	<table border="1">
	<c:forEach var="subject" items="${subjectList}">
		<tr>
			<td>${subject.subjectName}</td>
			<td><a href="/admin/modifySubject?subjectId=${subject.subjectId}">수정</a></td>
			<td><a href="/admin/removeSubject">삭제</a></td>
		</tr>
	</c:forEach>
	</table>
	
	<a href="/admin/createSubject">과목 추가</a>
</body>
</html>