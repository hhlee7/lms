<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 작성내역 보기</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 40px 20px;
        color: #333;
    }

    .container {
        max-width: 860px;
        margin: 0 auto;
    }

    .history-card {
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.06);
        padding: 30px;
        margin-bottom: 40px;
        transition: transform 0.2s ease;
    }

    .history-card:hover {
        transform: translateY(-4px);
    }

    .history-card h3 {
        color: #007acc;
        margin: 0 0 10px 0;
        font-size: 20px;
    }

    .rating-row {
        margin: 20px 0;
        text-align: center;
        font-size: 16px;
        font-weight: 500;
    }

    .stars {
        color: #f5a623;
        font-size: 22px;
        margin-left: 10px;
    }

    .review-content {
        position: relative;
        background-color: #eef5fc;
        padding: 20px;
        border-radius: 10px;
        margin-top: 25px;
        font-size: 15px;
        line-height: 1.7;
        color: #444;
    }

    .review-content::before {
        content: "";
        position: absolute;
        top: -10px;
        left: 25px;
        width: 0;
        height: 0;
        border-left: 10px solid transparent;
        border-right: 10px solid transparent;
        border-bottom: 10px solid #eef5fc;
    }

    .section-header {
        text-align: center;
        margin-bottom: 50px;
    }

    .section-header h1 {
        font-size: 28px;
        color: #007acc;
        margin-bottom: 10px;
    }

    .section-header p {
        color: #666;
        font-size: 15px;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <div class="section-header">
            <h1>📄 내가 작성한 평가 내역</h1>
            <p>내가 남긴 별점과 후기를 한눈에 확인할 수 있어요.</p>
        </div>

        <c:forEach var="history" items="${historyList}">
            <div class="history-card">
                <h3>📘 과목: ${history.subjectName}</h3>
                <h3>👨‍🏫 강사: ${history.teacherName}</h3>

                <div class="rating-row">
                    강사 평점:
                    <span class="stars">
                        <c:forEach var="i" begin="1" end="${history.ratingTeacher}">★</c:forEach>
                    </span>
                </div>

                <div class="rating-row">
                    강의 평점:
                    <span class="stars">
                        <c:forEach var="i" begin="1" end="${history.ratingLecture}">★</c:forEach>
                    </span>
                </div>

                <c:if test="${not empty history.content}">
                    <div class="review-content">
                        <strong>📝 후기 내용:</strong><br>
                        ${history.content}
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>
</body>
</html>
