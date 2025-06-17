<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 소개</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>강사 소개</h1>
	<c:forEach var="teacher" items="${teacherList}">
		<div>
			<a href="/student/teacherOne?teacherId=${teacher.userId}">${teacher.userName}</a>
		</div>
	</c:forEach>
</body>
</html>