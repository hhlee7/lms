<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 상세 정보</title>
<style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background-color: #f5f6fa;
      color: #333;
    }

    .container {
      max-width: 800px;
      margin: 40px auto;
      padding: 20px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    h1 {
      font-size: 24px;
      color: #007acc;
      margin-bottom: 20px;
    }

    .description {
      background-color: #f0f4f8;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 20px;
    }

    .rating {
      font-size: 18px;
      margin-bottom: 30px;
    }

    .rating span {
      color: #f5a623;
      font-size: 20px;
    }

    .review {
      border-top: 1px solid #ddd;
      padding: 16px 0;
    }

    .review:first-child {
      border-top: none;
    }

    .review-rating {
      font-weight: bold;
      color: #444;
      margin-bottom: 6px;
    }

    .review-content {
      color: #555;
      line-height: 1.5;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
  	<div class="container">
    	<h1>${subject.subjectName} 수업 정보</h1>

    	<div class="description">
      		${subject.description}
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
          			<c:forEach var="i" begin="1" end="${review.ratingLecture}">
            			⭐
          			</c:forEach>
        		</div>
        		<div class="review-content">"${review.content}"</div>
      		</div>
    	</c:forEach>
  	</div>
</body>
</html>