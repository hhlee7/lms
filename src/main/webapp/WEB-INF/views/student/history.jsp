<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 작성내역 보기</title>

<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Jua&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f0f2f5;
        margin: 0;
        padding: 40px 20px;
        color: #000;
        font-size: 18px;
    }

    .container {
        max-width: 860px;
        margin: 0 auto;
    }

    .section-header {
        text-align: center;
        margin-bottom: 50px;
    }

    .section-header h1 {
        font-family: 'Jua', sans-serif;
        font-size: 28px;
        color: #000;
        margin-bottom: 10px;
    }

    .section-header p {
        color: #444;
        font-size: 15px;
    }

    .history-card {
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.06);
        padding: 30px;
        margin-bottom: 40px;
        transition: transform 0.2s ease;
        font-weight: 500;
    }

    .history-card:hover {
        transform: translateY(-4px);
    }

    .info-row-top {
        display: flex;
        gap: 40px;
        align-items: center;
        margin-bottom: 20px;
        color: #000;
        font-size: 18px;
        font-weight: 600;
    }

    .info-item {
        display: flex;
        align-items: center;
        gap: 8px;
        white-space: nowrap;
    }

    .info-item .label {
        font-weight: 700;
        color: #555;
        min-width: 80px;
    }

    .info-row {
        margin-bottom: 15px;
        color: #000;
        font-weight: 600;
        font-size: 18px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .stars {
        color: #f5a623;
        font-size: 22px;
        user-select: none;
    }

    .review-content {
        background-color: #eef5fc;
        padding: 20px;
        border-radius: 10px;
        margin-top: 15px;
        font-size: 16px;
        line-height: 1.6;
        color: #333;
        white-space: pre-wrap;
        word-break: break-word;
        text-align: left;
    }

    .review-content .title {
        font-weight: 700;
        margin-bottom: 10px;
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
                <div class="info-row-top">
                    <div class="info-item">
                        <span class="label">📘 과목:</span>
                        <span>${history.subjectName}</span>
                    </div>
                    <div class="info-item">
                        <span class="label">👨‍🏫 강사:</span>
                        <span>${history.teacherName}</span>
                    </div>
                </div>

                <div class="info-row">
                    <span class="label">강사 평점:</span>
                    <span class="stars">
                        <c:forEach var="i" begin="1" end="5">
                            <c:choose>
                                <c:when test="${i <= history.ratingTeacher}">&#9733;</c:when>
                                <c:otherwise>&#9734;</c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </span>
                </div>

                <div class="info-row">
                    <span class="label">수업 평점:</span>
                    <span class="stars">
                        <c:forEach var="i" begin="1" end="5">
                            <c:choose>
                                <c:when test="${i <= history.ratingLecture}">&#9733;</c:when>
                                <c:otherwise>&#9734;</c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </span>
                </div>

                <c:if test="${not empty history.content}">
                    <div class="review-content">
                        <div class="title">📝 후기 내용:</div>
                        <div>${history.content}</div>
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>
</body>
</html>
