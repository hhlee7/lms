<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>학부모 메인</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .menu-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            max-width: 800px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .menu-item {
            background-color: #e2edff;
            border-radius: 12px;
            text-align: center;
            padding: 30px 20px;
            font-size: 18px;
            font-weight: bold;
            color: #003366;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        
        .menu-item:hover {
            background-color: #cce0ff;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
	<div class="menu-container">
		<a class="menu-item" href="/parent/lectureList">수강신청</a>
		<a class="menu-item" href="/parent/lecturePayOrCancel">결제</a>
		<a class="menu-item" href="/parent/lectureLegistrationList">수강 신청내역</a>
		<a class="menu-item" href="/parent/subject">자녀 수업조회</a>
		<a class="menu-item" href="/parent/attendance">자녀 출결조회</a>
		<a class="menu-item" href="/parent/vehicleInfo">자녀 배차조회</a>
	</div>
</body>
</html>