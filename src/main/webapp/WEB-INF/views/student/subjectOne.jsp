<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 상세 정보</title>

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
	<jsp:include page="header.jsp" />
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
        		<div class="review-content">${review.content}</div>
      		</div>
    	</c:forEach>
  	</div>
</body>
</html>