<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
</head>
<body>
	<h1>관리자 메인 페이지 입니다.</h1>
	${loginUser.userName} 님 환영합니다.
	<div>
		<a href="userManagement">[회원 관리]</a>
		<a href="vehicleManagement">[차량 관리]</a>
		<a href="noticeManagement">[공지사항 관리]</a>
		<a href="userManagement">[학생 배차 조회]</a>
		<a href="albumManagement">[수업 사진첩]</a>
		<a href="qnaManagement">[학부모 Q&A]</a>
	</div>
	<div>
	<a href="/admin/subjectManagement">[과목 관리]</a>
	</div>
	<div>
	[수강 신청 관리]
	<br>
	- <a href="/admin/studentEnrollmentList">수강 신청 현황</a>
	<br>
	- <a href="/admin/paymentList">수강료 납부 내역</a>
	<br>
	- <a href="/admin/enrollmentCancelList">수강 신청 취소 내역</a>
	</div>
	<div>
	<a href="/admin/refundList">[환불 관리]</a>
	<a href="/admin/lectureManagement">[수업 관리]</a>
	<a href="/admin/classroomManagement">[강의실 관리]</a>
	<a href="/admin/materialManagement">[교보재 관리]</a>
	<a href="/admin/materialRequestManagement">[교보재 요청 관리]</a>
	<a href="/admin/attendanceManagement">[출결 관리]</a>
	<a href="/admin/satisfactionList">[만족도 평가 및 리뷰 조회]</a>
	</div>
</body>
</html>