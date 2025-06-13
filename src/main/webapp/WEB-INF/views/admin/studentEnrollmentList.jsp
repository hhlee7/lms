<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentEnrollmentList</title>
</head>
<body>
	<h1>수강 신청 현황</h1>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>신청 과목</th>
			<th>신청일</th>
			<th>수강료 납부 현황</th>
		</tr>
	<c:forEach var="list" items="${studentEnrollmentList}">
		<tr>
			<td>${list.enrollmentId}</td>
			<td>${list.studentName}</td>
			<td>${list.subjectName}</td>
			<td>${list.enrolledAt}</td>
			<td>${list.status}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>