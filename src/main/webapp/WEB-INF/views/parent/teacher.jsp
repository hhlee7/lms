<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 소개</title>
</head>
<body>
	<h1>강사 소개</h1>
	<c:forEach var="teacher" items="${teacherList}">
		<div>
			<a href="/parent/teacherOne?teacherId=${teacher.userId}">${teacher.userName}</a>
		</div>
	</c:forEach>
</body>
</html>