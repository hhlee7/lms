<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 상세 정보</title>
<style>
	body {
		font-family: 'Segoe UI', 'Arial', sans-serif;
		background-color: #f4f7fb;
		margin: 0;
		color: #333;
	}
	
	h1 {
		font-size: 2rem;
		color: #0b3c5d;
		text-align: center;
		margin-bottom: 30px;
	}
	
	p {
		font-size: 16px;
		margin: 10px 0;
		line-height: 1.5;
		background-color: #fff;
		padding: 12px 20px;
		border-radius: 8px;
		box-shadow: 0 4px 10px rgba(0,0,0,0.05);
		border: 1px solid #dbe4f1;
		max-width: 600px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.rating {
		font-weight: 600;
		color: #0077cc;
		text-align: center;
		font-size: 18px;
		margin: 24px 0;
	}
	
	.review {
		max-width: 600px;
		margin: 20px auto;
		padding: 20px;
		background-color: #ffffff;
		border-left: 6px solid #007acc;
		border-radius: 10px;
		box-shadow: 0 4px 12px rgba(0,0,0,0.08);
		transition: transform 0.2s ease;
	}
	
	.review:hover {
		transform: translateY(-4px);
		box-shadow: 0 6px 18px rgba(0,0,0,0.12);
	}
	
	.review span {
		display: block;
		margin-bottom: 10px;
		font-size: 15px;
		color: #444;
	}
	
	.review span:first-child {
		font-weight: bold;
		color: #f39c12;
	}
	
	.review span:last-child {
		font-weight: bold;
		color: #0077cc;
	}
</style>
</head>
<body>
	<h1>${teacher.teacherName} 강사 정보</h1>
	<p>최종 학력 : ${teacher.lastEducation}</p>
	<p>경력 : ${teacher.personalHistory}</p>
	<c:if test="${not empty rating}">
	    <p>평균 평점 : ${rating}</p>
	</c:if>
	
	<c:forEach var="review" items="${reviewList}">
		<div class="review">
			<span>평점 : ${review.ratingTeacher}</span>
			<br>
			<span>리뷰 : ${review.content}</span>	
		</div>
		<br><br>
	</c:forEach>
</body>
</html>