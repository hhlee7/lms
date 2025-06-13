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
		<a href="userManagement">[학부모 Q&A]</a>
	</div>
</body>
</html>