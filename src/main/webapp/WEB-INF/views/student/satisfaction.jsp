<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 만족도 평가 페이지</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        background-color: #f5f6fa;
        color: #333;
    }

    .container {
        max-width: 900px;
        margin: 40px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    h1 {
        font-size: 28px;
        color: #007acc;
        margin-bottom: 30px;
        text-align: center;
    }

    .evaluation-card {
        background-color: #f0f4f8;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 20px;
        box-shadow: 0 1px 6px rgba(0,0,0,0.1);
        transition: transform 0.2s ease;
    }

    .evaluation-card:hover {
        transform: translateY(-3px);
    }

    .evaluation-card h2 {
        margin-top: 0;
        color: #007acc;
        font-size: 22px;
    }

    .lecture-info p {
        margin: 6px 0;
        line-height: 1.4;
    }

    .actions {
        margin-top: 15px;
    }

    .actions a {
        display: inline-block;
        margin-right: 10px;
        padding: 8px 14px;
        background-color: #007acc;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
        transition: background-color 0.2s ease;
    }

    .actions a:hover {
        background-color: #005f99;
    }

    .actions span {
        font-size: 14px;
        color: #555;
        margin-right: 10px;
    }

    .actions .disabled {
        color: gray;
        cursor: not-allowed;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
        <h1>만족도 평가</h1>

        <c:forEach var="lecture" items="${lectureDoneList}">
            <div class="evaluation-card">
                <h2>${lecture.subjectName}</h2>
                <div class="lecture-info">
                    <p><strong>강사명:</strong> ${lecture.teacherName}</p>
                    <p><strong>요일:</strong> ${lecture.dayOfWeek}</p>
                    <p><strong>시간:</strong> ${lecture.startTime} ~ ${lecture.endTime}</p>
                    <p><strong>강의실:</strong> ${lecture.classroomName}</p>
                    <p><strong>위치:</strong> ${lecture.classroomLocation}</p>
                    <p><strong>수업 기간:</strong> ${lecture.startDate} ~ ${lecture.endDate}</p>
                </div>

                <div class="actions">
                    <c:choose>
                        <c:when test="${not empty lecture.satisfactionId}">
                            <span>✅ 만족도 평가 완료</span>
                        </c:when>
                        <c:otherwise>
                            <a href="/student/evaluation?paymentId=${lecture.paymentId}&subjectName=${lecture.subjectName}&teacherName=${lecture.teacherName}">
                                만족도 평가
                            </a>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${not empty lecture.satisfactionId}">
                            <c:choose>
                                <c:when test="${not empty lecture.reviewId}">
                                    <span>📝 리뷰 작성 완료</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="/student/review?satisfactionId=${lecture.satisfactionId}&subjectName=${lecture.subjectName}&teacherName=${lecture.teacherName}">
                                        리뷰 작성
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <span class="disabled">리뷰 작성 불가</span>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${not empty lecture.satisfactionId}">
                        <a href="/student/history?paymentId=${lecture.paymentId}">내 작성내역 보기</a>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>