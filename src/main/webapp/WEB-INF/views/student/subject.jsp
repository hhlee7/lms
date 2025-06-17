<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 소개</title>
<style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background-color: #f5f6fa;
      color: #333;
    }

    .container {
      max-width: 1080px;
      margin: 0 auto;
      padding: 40px 20px;
    }

    h2 {
      text-align: center;
      margin-bottom: 40px;
      color: #222;
    }

    .subject-gallery {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 20px;
    }

    .subject-card {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0,0,0,0.06);
      transition: transform 0.2s ease;
      text-align: center;
    }

    .subject-card:hover {
      transform: translateY(-6px);
    }

    .subject-card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
      background-color: #f8f8f8;
    }

    .subject-info {
      padding: 16px;
    }

    .subject-info h4 {
      margin: 0;
      font-size: 1.05rem;
      color: #222;
    }
  </style>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="container">
		<h2>과목 소개</h2>

		<div class="subject-gallery">
      		<c:forEach var="subject" items="${subjectList}">
        		<div class="subject-card">
          			<a href="/student/subjectOne?subjectName=${subject.subjectName}">
            			<img src="/images/${subject.subjectName}.jpeg" alt="${subject.subjectName} 수업"
                 			onerror="this.src='/images/default.jpg'" />
          			</a>
					<div class="subject-info">
            			<h4>${subject.subjectName}</h4>
          			</div>
        		</div>
      		</c:forEach>
    	</div>
  	</div>
</body>
</html>