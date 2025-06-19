<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강사 소개</title>
	<style>
		body {
			font-family: 'Segoe UI', 'Arial', sans-serif;
			background-color: #f4f7fb;
			margin: 0;
			padding: 120px 20px 40px;
		}

		h1 {
			text-align: center;
			color: #0b3c5d;
			font-size: 2rem;
			margin-bottom: 40px;
		}

		.teacher-grid {
			max-width: 1200px;
			margin: 0 auto;
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			gap: 24px;
			padding: 0 20px;
		}

		.teacher-card {
			background-color: #ffffff;
			border-radius: 12px;
			box-shadow: 0 6px 16px rgba(0, 0, 0, 0.08);
			overflow: hidden;
			text-align: center;
			transition: transform 0.2s ease, box-shadow 0.3s ease;
		}

		.teacher-card:hover {
			transform: translateY(-6px);
			box-shadow: 0 10px 24px rgba(0, 0, 0, 0.1);
		}

		.teacher-card img {
			width: 100%;
			height: 240px;
			object-fit: cover;
			background-color: #ddd;
		}

		.teacher-name {
			padding: 16px;
			font-size: 17px;
			font-weight: 600;
			color: #333;
			border-top: 1px solid #eee;
		}

		.teacher-name a {
			text-decoration: none;
			color: #0077cc;
		}

		.teacher-name a:hover {
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<h1>강사 소개</h1>
	<div class="teacher-grid">
		<c:forEach var="teacher" items="${teacherList}">
			<div class="teacher-card">
				<!-- 추후 src에 실제 이미지 파일명 삽입 -->
				<img src="/images/teacher-default.png" alt="${teacher.userName}">
				<div class="teacher-name">
					<a href="/parent/teacherOne?teacherId=${teacher.userId}">
						${teacher.userName}
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
