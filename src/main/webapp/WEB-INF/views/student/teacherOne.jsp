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

    .img-box {
      text-align: center;
      margin-bottom: 25px;
    }

    .img-box img {
      width: 250px;
      height: 160px;
      border-radius: 8px;
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
    	
    	<!-- ✅ 이미지 가운데 정렬용 div 추가 -->
    	<div class="img-box">
      		<c:if test="${teacher.userId == 'teacher001'}">
                 <img src="https://image.kmib.co.kr/online_image/2015/0908/201509080720_61160009832235_1.jpg"
                 alt="${teacher.userName} 사진"
                 style="width:400px; height:300px; margin-top:10px; border-radius:8px;">
             </c:if>
             
             <c:if test="${teacher.userId == 'teacher002'}">
             	<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5286%2F2017%2F05%2F25%2F20170525000052_20170525143101862.jpg&type=sc960_832"
             	alt="${teacher.userName} 사진"
             	style="width:400px; height:300px; margin-top:10px; border-radius:8px;">
             </c:if>
             
             <c:if test="${teacher.userId == 'teacher003'}">
                 <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5193%2F2016%2F10%2F20%2F731846_260953_1042_99_20161020025119.jpg&type=sc960_832"
                 	  alt="${teacher.userName} 사진"
                      style="width:400px; height:300px; margin-top:10px; border-radius:8px;">
             </c:if>
               
                <c:if test="${teacher.userId == 'teacher004'}">
                 <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F015%2F2016%2F11%2F16%2F03.12842368.1_99_20161116114704.jpg&type=sc960_832"
                      alt="${teacher.userName} 사진"
                      style="width:400px; height:300px; margin-top:10px; border-radius:8px;">
             </c:if>
             
             <c:if test="${teacher.userId == 'teacher005'}">
                  <img src="data:image/jpeg;base64,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" 
                       alt="${teacher.userName} 사진"
                       style="width:400px; height:300px; margin-top:10px; border-radius:8px;">
              </c:if>
              
              <c:if test="${teacher.userId == 'teacher006'}">
                  <img src="data:image/jpeg;base64,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" 
                       alt="${teacher.userName} 사진"
                       style="width:400px; height:300px; margin-top:10px; border-radius:8px;">
              </c:if>
    	</div>

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
