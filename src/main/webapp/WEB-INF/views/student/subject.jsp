<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 소개</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<hr>
	<h1>과목 소개</h1>
	<c:forEach var="subject" items="${subjectList}">
		<div>
			<a href="/student/subjectOne?subjectName=${subject.subjectName}">
				<img src="/images/${subject.subjectName}.jpeg" alt="${subject.subjectName}수업" style="width:150px; height:150px;">
			</a>
		</div>
	</c:forEach>
</body>
</html>