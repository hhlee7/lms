<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 수업 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f2f5f9;
        margin: 0;
        padding: 0;
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
        color: #007bff;
        margin-bottom: 40px;
        font-weight: 600;
    }

    .lecture-card {
        border: 1px solid #e0e6ed;
        border-left: 5px solid #007bff;
        border-radius: 8px;
        padding: 20px 25px;
        margin-bottom: 25px;
        background-color: #f9fcff;
        transition: box-shadow 0.2s ease;
    }

    .lecture-card:hover {
        box-shadow: 0 4px 16px rgba(0,0,0,0.06);
    }

    .lecture-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }

    .lecture-header h2 {
        font-size: 22px;
        margin: 0;
        color: #007bff;
    }

    .lecture-header .teacher {
        font-size: 16px;
        color: #555;
    }

    .lecture-info {
        font-size: 15px;
        color: #444;
    }

    .lecture-info p {
        margin: 6px 0;
    }

    .icon {
        margin-right: 6px;
        color: #007bff;
        font-weight: bold;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
        <h1>내 수업 조회</h1>

        <c:forEach var="lecture" items="${lectureList}">
	        <div class="lecture-card">
	            <div class="lecture-header">
	                <h2>${lecture.subjectName}</h2>
	                <div class="teacher">👨‍🏫 ${lecture.teacherName}</div>
	            </div>
	            <div class="lecture-info">
	                <p><span class="icon">📅</span>요일: ${lecture.dayOfWeek}</p>
	                <p><span class="icon">⏰</span>시간: ${lecture.startTime} ~ ${lecture.endTime}</p>
	                <p><span class="icon">🏫</span>강의실: ${lecture.classroomName}</p>
	                <p><span class="icon">📍</span>위치: ${lecture.classroomLocation}</p>
	                <p><span class="icon">🗓️</span>기간: ${lecture.startDate} ~ ${lecture.endDate}</p>
	            </div>
	        </div>
	    </c:forEach>
    </div>
</body>
</html>