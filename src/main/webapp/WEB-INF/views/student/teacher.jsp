<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 소개</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
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
        margin-bottom: 30px;
        color: #007acc;
        text-align: center;
    }

    .teacher-list {
		display: flex;
	    flex-wrap: nowrap;
	    gap: 20px;
	    overflow-x: auto;
	    padding-bottom: 10px;
    }

    .teacher-card {
        background-color: #f0f4f8;
        border-radius: 8px;
        padding: 20px;
        width: 250px;
        text-align: center;
        box-shadow: 0 1px 6px rgba(0,0,0,0.1);
        transition: transform 0.2s ease;
    }

    .teacher-card:hover {
        transform: translateY(-5px);
    }

    .teacher-card a {
        text-decoration: none;
        color: #007acc;
        font-weight: bold;
        font-size: 18px;
    }

    .teacher-card a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
        <h1>강사 소개</h1>
        <div class="teacher-list">
            <c:forEach var="teacher" items="${teacherList}">
                <div class="teacher-card">
                    <a href="/student/teacherOne?teacherId=${teacher.userId}">
                        ${teacher.userName}
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>