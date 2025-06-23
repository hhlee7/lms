<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 수업 조회</title>

<!-- ✅ Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    	background-color: #f9f9fb;
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
        color: #000; /* 검정색으로 변경 */
        margin-bottom: 40px;
        font-weight: 700;
        font-family: 'Jua', 'Noto Sans KR', sans-serif;
        font-size: 2.5rem;
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

    .lecture-header h2 {
        font-size: 22px;
        margin: 0;
        color: #000;
        font-weight: 600;
    }

    .teacher {
	    font-size: 18px;
	    font-weight: 600;
	    color: #222;
	    margin-top: 10px;
	}

    .lecture-info {
        font-size: 17px;
        color: #333;
        margin-top: 15px;
    }

    .lecture-info p {
        margin: 8px 0;
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
	                <h2>${lecture.subjectName} ${lecture.lectureId}기</h2>
	            </div>
                <div class="teacher">👨‍🏫 ${lecture.teacherName}</div>
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
