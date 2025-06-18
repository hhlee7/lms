<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 만족도 평가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f5f6fa;
        margin: 0;
    }

    .container {
        max-width: 960px;
        margin: 60px auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    }

    h1 {
        text-align: center;
        color: #007acc;
        margin-bottom: 40px;
        font-weight: bold;
    }

    .evaluation-card {
        border: 1px solid #dee2e6;
        border-radius: 10px;
        padding: 25px;
        margin-bottom: 25px;
        background-color: #f9fbfd;
        transition: box-shadow 0.2s ease;
    }

    .evaluation-card:hover {
        box-shadow: 0 4px 16px rgba(0,0,0,0.06);
    }

    .card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }

    .card-header h2 {
        font-size: 20px;
        color: #007acc;
        margin: 0;
    }

    .status-badge {
        font-size: 13px;
        font-weight: 500;
        padding: 5px 12px;
        border-radius: 20px;
    }

    .done {
        background-color: #d4edda;
        color: #155724;
    }

    .not-done {
        background-color: #f8d7da;
        color: #721c24;
    }

    .lecture-info p {
        margin: 5px 0;
        font-size: 14px;
        color: #444;
    }
    
    lecture-info {
	    margin-bottom: 20px;
	}
	
	.lecture-info p {
	    margin: 10px 0;
	    font-size: 14px;
	    color: #444;
	}
	
	.actions {
	    display: flex;
	    flex-wrap: wrap;
	    gap: 10px;
	    margin-top: 10px;
	}

    .actions a {
        margin-right: 10px;
        padding: 7px 14px;
        background-color: #007acc;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-size: 14px;
        transition: background-color 0.2s ease;
    }

    .actions a:hover {
        background-color: #005f99;
    }

    .actions .disabled {
        background-color: #cccccc;
        color: #666;
        cursor: not-allowed;
        pointer-events: none;
    }

    .actions span {
        font-size: 14px;
        margin-right: 10px;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
        <h1>📝 수업 만족도 평가</h1>

        <c:forEach var="lecture" items="${lectureDoneList}">
	        <div class="evaluation-card">
	            <div class="card-header">
	                <h2>📘 ${lecture.subjectName}</h2>
	                <c:choose>
	                    <c:when test="${not empty lecture.satisfactionId}">
	                        <span class="status-badge done">✅ 평가 완료</span>
	                    </c:when>
	                    <c:otherwise>
	                        <span class="status-badge not-done">⚠️ 미평가</span>
	                    </c:otherwise>
	                </c:choose>
	            </div>

	            <div class="lecture-info">
	                <p>👨‍🏫 <strong>강사:</strong> ${lecture.teacherName}</p>
	                <p>🗓️ <strong>요일:</strong> ${lecture.dayOfWeek}</p>
	                <p>⏰ <strong>시간:</strong> ${lecture.startTime} ~ ${lecture.endTime}</p>
	                <p>📅 <strong>수업 기간:</strong> ${lecture.startDate} ~ ${lecture.endDate}</p>
	            </div>

	            <div class="actions">
	                <c:choose>
	                    <c:when test="${not empty lecture.satisfactionId}">
	                        <span>✔️ 만족도 평가 완료</span>
	                    </c:when>
	                    <c:otherwise>
	                        <a href="/student/evaluation?paymentId=${lecture.paymentId}&subjectName=${lecture.subjectName}&teacherName=${lecture.teacherName}">
	                            ✍️ 평가하기
	                        </a>
	                    </c:otherwise>
	                </c:choose>

	                <c:choose>
	                    <c:when test="${not empty lecture.satisfactionId}">
	                        <c:choose>
	                            <c:when test="${not empty lecture.reviewId}">
	                                <span>📝 리뷰 완료</span>
	                            </c:when>
	                            <c:otherwise>
	                                <a href="/student/review?satisfactionId=${lecture.satisfactionId}&subjectName=${lecture.subjectName}&teacherName=${lecture.teacherName}">
	                                    💬 리뷰 쓰기
	                                </a>
	                            </c:otherwise>
	                        </c:choose>
	                    </c:when>
	                    <c:otherwise>
	                        <a class="disabled">리뷰 작성 불가</a>
	                    </c:otherwise>
	                </c:choose>

	                <c:if test="${not empty lecture.satisfactionId}">
	                    <a href="/student/history?paymentId=${lecture.paymentId}">📄 내 작성 내역</a>
	                </c:if>
	            </div>
	        </div>
	    </c:forEach>
    </div>
</body>
</html>
