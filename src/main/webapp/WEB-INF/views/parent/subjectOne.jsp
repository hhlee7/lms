<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과목 상세 정보</title>
	<style>
		body {
			font-family: 'Segoe UI', 'Arial', sans-serif;
			background-color: #f4f7fb;
			margin: 0;
		}

		.container {
			max-width: 800px;
			margin: 0 auto;
			background-color: #ffffff;
			padding: 40px;
			border-radius: 16px;
			box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
			border: 1px solid #e0e7ff;
		}

		h1 {
			font-size: 28px;
			font-weight: bold;
			color: #0b3c5d;
			background: linear-gradient(to right, #e6f0ff, #ffffff);
			padding: 20px;
			border-radius: 12px;
			text-align: center;
			margin-bottom: 24px;
			box-shadow: inset 0 -1px 0 #dce4f9;
		}

		.subject-desc {
			font-size: 16px;
			color: #444;
			line-height: 1.7;
			background-color: #f9fbff;
			padding: 20px;
			border-radius: 8px;
			border: 1px solid #dbe4f1;
			margin-bottom: 30px;
		}

		.rating {
			font-size: 18px;
			color: #0077cc;
			font-weight: 600;
			text-align: center;
			margin-bottom: 24px;
		}

		.rating::before {
			content: "⭐ ";
			font-size: 20px;
			color: gold;
		}

		.review-card {
			background-color: #ffffff;
			border: 1px solid #dde6f2;
			border-left: 6px solid #007acc;
			border-radius: 10px;
			padding: 20px;
			margin-bottom: 20px;
			box-shadow: 0 4px 10px rgba(0, 0, 0, 0.06);
			transition: transform 0.2s;
		}

		.review-card:hover {
			transform: translateY(-4px);
			box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
		}

		.review-card span {
			display: block;
			color: #333;
			font-size: 15px;
			margin-bottom: 8px;
		}

		.review-card span::before {
			font-weight: bold;
			margin-right: 4px;
		}

		.review-card span:first-child::before {
			content: "⭐ 평점:";
			color: #f39c12;
		}

		.review-card span:last-child::before {
			content: "💬 리뷰:";
			color: #0077cc;
		}
		.subject-image {
			text-align: center; 
			margin-top: 40px;
		}
		
		.subject-image img {
			width: 800px;
			height: auto;
			border-radius: 12px;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		}
		
		.subject-image-scroll {
			margin-top: 40px;
			overflow-x: auto;
			white-space: nowrap;
		}
		
		.scroll-wrapper {
			width: max-content;
			display: inline-block;
		}
		
	</style>
</head>
<body>
	<div class="container">
		<h1>${subject.subjectName} 수업 정보</h1>

		<div class="subject-desc">
			${subject.description}
		</div>
		
		<div class="subject-image">
			<c:choose>
				<c:when test="${subject.subjectName eq '피아노'}">
					<img src="/images/피아노트로피2.png" alt="피아노">
					<img src="/images/피아노레슨3.png" alt="피아노">
				</c:when>
				<c:when test="${subject.subjectName eq '코딩'}">
					<img src="/images/코딩1.jpg" alt="코딩">
					<img src="/images/코딩수업.jpg" alt="코딩">
				</c:when>
				<c:when test="${subject.subjectName eq '축구'}">
					<img src="/images/과목소개축구.png" alt="축구">
				</c:when>
				<c:otherwise>
					<img src="/images/default.jpg" alt="기본 이미지">
				</c:otherwise>
			</c:choose>
		</div>

		<c:if test="${not empty rating}">
			<p class="rating">평균 평점 : ${rating}</p>
		</c:if>

		<c:forEach var="review" items="${reviewList}">
			<div class="review-card">
				<span>${review.ratingLecture}</span>
				<span>${review.content}</span>
			</div>
		</c:forEach>
	</div>
</body>
</html>
