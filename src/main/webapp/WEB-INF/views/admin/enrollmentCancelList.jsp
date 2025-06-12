<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enrollmentCancelList</title>
</head>
<body>
	<h1>수강 신청 취소 내역</h1>
	
	<table border="1">
		<tr>
			<th>과목</th>
			<th>이름</th>
			<th>전화번호</th>
		</tr>
	<c:forEach var="list" items="${enrollmentCancelList}">
		<tr>
			<td>${list.subjectName}</td>
			<td>${list.studentName}</td>
			<td>${list.phone}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>