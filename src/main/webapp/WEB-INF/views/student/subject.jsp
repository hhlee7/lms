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

	.subject-card p strong {
	  font-family: 'Jua', sans-serif; /* 제목용 – 귀엽고 또렷 */
	  font-size: 1.2rem;
	  color: #333;
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
				        <c:choose>
				          <c:when test="${subject.subjectName eq '피아노'}">
				            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20250423_261%2F1745394958873am6aQ_JPEG%2F21013009329566293_1669727011.jpg&type=sc960_832" alt="피아노" />
				          </c:when>
				          <c:when test="${subject.subjectName eq '코딩'}">
				            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDEwMTRfMjY5%2FMDAxNzI4ODg5ODc2Njgy.BAH5YBH2s0Xr3FtmA6VfWVlbYWQoRd-IIK-m-qjmEZQg.2zz_zAkERznjhX9h3kD7tHT0ag7jiB4hQQopxg_AYd8g.JPEG%2Foutput_1602405098.jpg&type=sc960_832" alt="코딩" />
				          </c:when>
				          <c:when test="${subject.subjectName eq '축구'}">
				            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTA1MDhfNTIg%2FMDAxNzQ2NjczMzM1MDY1.xW5rPdTyyPQLbAZ5C_H9DcfayWic4Jr3WQMpfWOa_REg.SRLrxHvGhFiPNkW-4t-Qk3IAbs493-cTssOr8qbZl1gg.PNG%2F20250507151630.png&type=sc960_832" alt="축구" />
				          </c:when>
				          <c:otherwise>
				            <img src="/images/${subject.subjectName}.jpeg" alt="${subject.subjectName}" onerror="this.src='/images/default.jpg'" />
				          </c:otherwise>
				        </c:choose>
				      </a>
					<div class="subject-info">
            			<p><strong>${subject.subjectName}</strong></p>
          			</div>
        		</div>
      		</c:forEach>
    	</div>
  	</div>
</body>
</html>