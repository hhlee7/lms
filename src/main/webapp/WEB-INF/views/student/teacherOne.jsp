<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 상세 정보</title>

<!-- ✅ 폰트 로딩 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">

<style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      margin: 0;
      background-color: #f5f6fa;
      color: #2c3e50;
      line-height: 1.6;
    }

    .container {
      max-width: 800px;
      margin: 40px auto;
      padding: 30px 40px;
      background: #ffffff;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    h1 {
      font-family: 'Jua', sans-serif;
      font-size: 32px;
      color: #2980b9;
      margin-bottom: 30px;
      letter-spacing: 1px;
      text-align: center;
    }

    .description {
      background-color: #ecf0f1;
      padding: 20px 25px;
      border-radius: 10px;
      margin-bottom: 30px;
      font-size: 17px;
      color: #34495e;
      box-shadow: inset 0 0 5px rgba(0,0,0,0.05);
    }

    .description p {
      margin: 10px 0;
      font-weight: 500;
    }

    .description strong {
      color: #2c3e50;
      font-weight: 700;
      letter-spacing: 0.5px;
    }

    .rating {
      font-size: 20px;
      font-weight: 600;
      color: #e67e22;
      margin-bottom: 35px;
      text-align: center;
      user-select: none;
    }

    .rating span {
      font-size: 26px;
      vertical-align: middle;
      margin-left: 8px;
      color: #f39c12;
      text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
    }

    .review {
      border-top: 1px solid #dcdcdc;
      padding: 18px 0;
      font-size: 16px;
      color: #34495e;
    }

    .review:first-child {
      border-top: none;
    }

    .review-rating {
      font-weight: 700;
      color: #f39c12;
      margin-bottom: 8px;
      user-select: none;
      font-size: 20px;
    }

    .review-content {
      color: #2c3e50;
      line-height: 1.7;
      font-style: italic;
      quotes: "“" "”" "‘" "’";
    }

    .review-content::before {
      content: open-quote;
    }

    .review-content::after {
      content: close-quote;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
    	<h1>${teacher.teacherName} 강사 정보</h1>

    	<div class="description">
      		<p><strong>최종 학력:</strong> ${teacher.lastEducation}</p>
      		<p><strong>경력:</strong> ${teacher.personalHistory}</p>
    	</div>

    	<c:if test="${not empty rating}">
      		<div class="rating">
        		평균 평점 :
        		<span>
          			<c:forEach var="i" begin="1" end="${rating}">
            			⭐
          			</c:forEach>
        		</span>
        		(${rating})
      		</div>
    	</c:if>

    	<c:forEach var="review" items="${reviewList}">
      		<div class="review">
        		<div class="review-rating">
          			<c:forEach var="i" begin="1" end="${review.ratingTeacher}">
            			⭐
          			</c:forEach>
        		</div>
        		<div class="review-content">${review.content}</div>
      		</div>
    	</c:forEach>
  	</div>
</body>
</html>
