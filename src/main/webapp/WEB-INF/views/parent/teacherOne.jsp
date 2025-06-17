<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 상세 정보</title>
</head>
<body>
	<h1>${teacher.teacherName} 강사 정보</h1>
	<p>최종 학력 : ${teacher.lastEducation}</p>
	<p>경력 : ${teacher.personalHistory}</p>
	<c:if test="${not empty rating}">
	    <p>평균 평점 : ${rating}</p>
	</c:if>
	
	<c:forEach var="review" items="${reviewList}">
		<div>
			<span>평점 : ${review.ratingTeacher}</span>
			<br>
			<span>리뷰 : ${review.content}</span>	
		</div>
		<br><br>
	</c:forEach>
</body>
</html>