<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.afterSchoolLms.dto.User" %>
<%
    User loginUser = (User) session.getAttribute("loginUser");
    String teacherName = loginUser != null ? loginUser.getUserName() : "강사";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>강사 메인 페이지</title>
    
    <!-- 아이콘용 CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: bold;
        }

        .logo img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
            border-radius: 50%;
        }

        .menu a {
            margin-left: 30px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 15px;
        }

        .menu a i {
            color: #1ec9d8;
        }

        .main {
            text-align: center;
            margin-top: 200px;
        }

        .main h1 {
            font-size: 32px;
            font-weight: bold;
            color: #222;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.2);
        }

        .main p {
            font-size: 16px;
            color: #777;
            margin-top: 10px;
            margin-bottom: 40px;
        }

        .btn-wrap {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            max-width: 900px;
            margin: 0 auto;
        }

        .btn-menu {
            padding: 20px 30px;
            background-color: #1ec9d8;
            color: white;
            border: none;
            border-radius: 10px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            transition: 0.3s;
            min-width: 150px;
            justify-content: center;
        }

        .btn-menu:hover {
            background-color: #0bbacb;
        }
    </style>
</head>
<body>

    <!-- 상단바 -->
    <div class="header">
    <div class="logo">
        <img src="https://upload.wikimedia.org/wikipedia/commons/9/98/Microsoft_Edge_logo_%282019%29.svg" alt="로고" />
        방과후 교육 
    </div>
    <div class="menu">
        <a href="/logout"><i class="fas fa-right-from-bracket"></i> 로그아웃</a>
    </div>
</div>

    <!-- 본문 -->
    <div class="main">
        <h1><%= teacherName %> 강사님 반갑습니다!</h1>
        <p>아이들과 함께 웃고 배우는, 최고의 하루를 만들어보세요</p>

     <div class="btn-wrap">
	    <a class="btn-menu" href="/teacher/lecture/list"><i class="fas fa-chalkboard-teacher"></i> 수업 조회</a>
	    <a class="btn-menu" href="/teacher/student/list"><i class="fas fa-user-graduate"></i> 학생 조회</a>
	    <a class="btn-menu" href="/teacher/student/vehicle"><i class="fas fa-bus"></i> 배차 조회</a>
	    <a class="btn-menu" href="/teacher/attendance/check"><i class="fas fa-clipboard-check"></i> 출석 체크</a>
	    <a class="btn-menu" href="/teacher/attendance/list"><i class="fas fa-calendar-check"></i> 출결 조회</a>
	    <a class="btn-menu" href="/teacher/material/list"><i class="fas fa-book"></i> 교보제 조회</a>
	    <a class="btn-menu" href="/teacher/material/request"><i class="fas fa-plus-circle"></i> 교보제 요청</a>
	    <a class="btn-menu" href="/teacher/album/list"><i class="fas fa-image"></i> 사진첩</a>
	    <a class="btn-menu" href="/teacher/notice/list"><i class="fas fa-bullhorn"></i> 공지사항</a>
	    <a class="btn-menu" href="/teacher/profile"><i class="fas fa-user-circle"></i> 개인정보</a>
	</div>

</body>
</html>
