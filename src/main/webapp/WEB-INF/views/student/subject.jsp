<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 소개</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>과목 소개</title>
	<style>
		body {
			font-family: 'Segoe UI', 'Arial', sans-serif;
			background-color: #f4f7fb;
			margin: 0;
		}

		h1 {
			text-align: center;
			color: #0b3c5d;
			font-size: 2rem;
			margin-bottom: 40px;
		}

		.subject-container {
			max-width: 1200px;
			margin: 0 auto;
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
			gap: 24px;
			padding: 0 20px;
		}

		.subject-card {
			background-color: #ffffff;
			border-radius: 12px;
			box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
			transition: transform 0.2s ease, box-shadow 0.3s ease;
			overflow: hidden;
			text-align: center;
		}

		.subject-card:hover {
			transform: translateY(-6px);
			box-shadow: 0 10px 24px rgba(0, 0, 0, 0.15);
		}

		.subject-card img {
			width: 100%;
			height: 180px;
			object-fit: cover;
			border-bottom: 1px solid #eee;
		}

		.subject-card-name {
			padding: 14px;
			font-size: 16px;
			font-weight: 600;
			color: #333;
		}
	</style>
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	<h1>과목 소개</h1>
	<div class="subject-container">
		<c:forEach var="subject" items="${subjectList}">
			<div class="subject-card">
				<a href="/student/subjectOne?subjectName=${subject.subjectName}">
					<img src="/images/${subject.subjectName}.jpg" alt="${subject.subjectName}수업">
					<div class="subject-card-name">${subject.subjectName}</div>
				</a>
			</div>
		</c:forEach>
	</div>
</body>
</html>