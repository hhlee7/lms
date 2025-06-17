<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>

    
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
	<h1>관리자 메인 페이지 입니다.</h1>
	${loginUser.userName} 님 환영합니다.
	<div>
		<a href="userManagement">[회원 관리]</a>
		<a href="vehicleManagement">[차량 관리]</a>
		<a href="noticeManagement">[공지사항 관리]</a>
		<a href="studentDispatchManagement">[학생 배차 조회]</a>
		<a href="vehicleCancel">[학생 배차 취소 조회]</a>
		<a href="albumManagement">[수업 사진첩]</a>
		<a href="qnaManagement">[학부모 Q&A] <span style="color:red">${qnaCount}!</span></a>
	</div>
	<div><a href="/admin/subjectManagement">과목 관리</a></div>
	<div><a href="/admin/studentEnrollmentList">수강 신청 현황</a></div>
	<div><a href="/admin/paymentList">수강료 납부 내역</a></div>
	<div><a href="/admin/enrollmentCancelList">수강 신청 취소 내역</a></div>
	<div><a href="/admin/refundList">환불 관리</a></div>
	<div><a href="/admin/lectureManagement">수업 관리</a></div>
	<div><a href="/admin/classroomManagement">강의실 관리</a></div>
	<div><a href="/admin/materialManagement">교보재 관리</a></div>
	<div><a href="/admin/materialRequestManagement">교보재 요청 관리</a></div>
	<div><a href="/admin/attendanceManagement">출결 관리</a></div>
	<div><a href="/admin/satisfactionList">만족도 평가 및 리뷰 조회</a></div>
</body>
</html>