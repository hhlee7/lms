<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 상세 정보</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	<h1>${subject.subjectName} 수업 정보</h1>
	<p>${subject.description}</p>
	
	<c:if test="${not empty rating}">
		<p>평균 평점 : ${rating}</p>
	</c:if>

	<c:forEach var="review" items="${reviewList}">
		<div>
			<span>평점 : ${review.ratingLecture}</span>
			<br>
			<span>리뷰 : ${review.content}</span>	
		</div>
		<br><br>
	</c:forEach>
</body>
</html>