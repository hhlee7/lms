<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 수업 조회</title>
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

    .lecture-card {
        background-color: #f0f4f8;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 20px;
        box-shadow: 0 1px 6px rgba(0,0,0,0.1);
        transition: transform 0.2s ease;
    }

    .lecture-card:hover {
        transform: translateY(-3px);
    }

    .lecture-card h2 {
        margin-top: 0;
        color: #007acc;
        font-size: 22px;
    }

    .lecture-info p {
        margin: 6px 0;
        line-height: 1.4;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
        <h1>내 수업 조회</h1>

        <c:forEach var="lecture" items="${lectureList}">
            <div class="lecture-card">
                <h2>${lecture.subjectName}</h2>
                <div class="lecture-info">
                    <p><strong>강사명:</strong> ${lecture.teacherName}</p>
                    <p><strong>요일:</strong> ${lecture.dayOfWeek}</p>
                    <p><strong>시간:</strong> ${lecture.startTime} ~ ${lecture.endTime}</p>
                    <p><strong>강의실:</strong> ${lecture.classroomName}</p>
                    <p><strong>위치:</strong> ${lecture.classroomLocation}</p>
                    <p><strong>수업 기간:</strong> ${lecture.startDate} ~ ${lecture.endDate}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>