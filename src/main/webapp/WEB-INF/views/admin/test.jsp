<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>admin Test</h1>
	${loginUser.userName} 님 환영합니다.
	
	<div><a href="/admin/subjectManagement">과목 관리</a></div>
	<div><a href="/admin/studentEnrollmentList">수강 신청 현황</a></div>
	<div><a href="/admin/paymentList">수강료 납부 내역</a></div>
	<div><a href="/admin/enrollmentCancelList">수강 신청 취소 내역</a></div>
	<div><a href="/admin/refundList">환불 관리</a></div>
	<div><a href="/admin/lectureList">수업 관리</a></div>
	<div><a href="/admin/classroomManagement">강의실 관리</a></div>
	<div><a href="/admin/materialManagement">교보재 관리</a></div>
	<div><a href="/admin/materialRequestManagement">교보재 요청 관리</a></div>
	<div><a href="/admin/attendanceManagement">출결 관리</a></div>
	<div><a href="/admin/satisfactionList">만족도 평가 및 리뷰 조회</a></div>
</body>
</html>