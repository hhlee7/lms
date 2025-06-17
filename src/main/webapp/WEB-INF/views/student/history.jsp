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
        background-color: #f5f6fa;
        margin: 0;
        padding: 30px;
        color: #333;
    }

    .container {
        max-width: 800px;
        margin: 40px auto;
    }

    .history-card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        padding: 20px 30px;
        margin-bottom: 30px;
    }

    .history-card h3 {
        color: #007acc;
        margin-bottom: 10px;
    }

    .rating-row {
        margin: 15px 0;
    }

    .stars {
        color: #f5a623;
        font-size: 20px;
    }

    .review-content {
        background-color: #f0f4f8;
        padding: 15px;
        border-radius: 8px;
        margin-top: 15px;
        line-height: 1.6;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
        <c:forEach var="history" items="${historyList}">
            <div class="history-card">
                <h3>과목: ${history.subjectName}</h3>
                <h3>강사: ${history.teacherName}</h3>

                <div class="rating-row">
                    <strong>강사 평점:</strong>
                    <span class="stars">
                        <c:forEach var="i" begin="1" end="${history.ratingTeacher}">⭐</c:forEach>
                    </span>
                </div>

                <div class="rating-row">
                    <strong>강의 평점:</strong>
                    <span class="stars">
                        <c:forEach var="i" begin="1" end="${history.ratingLecture}">⭐</c:forEach>
                    </span>
                </div>

                <c:if test="${not empty history.content}">
                    <div class="review-content">
                        <strong>후기:</strong><br>
                        ${history.content}
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>
</body>
</html>