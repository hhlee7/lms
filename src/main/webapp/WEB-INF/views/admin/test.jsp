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
	<div><a href="/admin/paymentList">수업료 납부 내역</a></div>
	<div><a href="/admin/enrollmentCancelList">수강 신청 취소 내역</a></div>
	<div><a href="/admin/refundList">환불 내역</a></div>
	<div><a href="/admin/lectureList">수업 목록</a></div>
</body>
</html>