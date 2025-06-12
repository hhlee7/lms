<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>과목 소개</h1>
	<div>
		<a href="/parent/subjectOne?type=soccer">
			<img src="/images/soccer.jpeg" alt="축구수업" style="width:150px; height:150px;">

		</a>
	</div>
	
	<div>
		<a href="/parent/subjectOne?type=piano">
			<img src="/images/piano.jpeg" alt="피아노수업" style="width:150px; height:150px;">
		</a>
	</div>
	
	<div>
		<a href="/parent/subjectOne?type=coding">
			<img src="/images/coding.jpeg" alt="코딩수업" style="width:150px; height:150px;">
		</a>
	</div>
</body>
</html>