<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 배차 조회</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	<c:forEach var="dispatch" items="${dispatchList}">
		<div>
			<p>과목명: ${dispatch.subjectName}</p>
            <p>강사명: ${dispatch.teacherName}</p>
            <p>요일: ${dispatch.dayOfWeek}</p>
            <p>시간: ${dispatch.startTime} ~ ${dispatch.endTime}</p>
			<p>기사님: ${dispatch.driverName}</p>
			<p>주차장소: ${dispatch.location}</p>
			<p>차량번호: ${dispatch.vehicleNo}</p>
			<p>기사 연락처: ${dispatch.driverPhone}</p>
			<hr>
		</div>
	</c:forEach>
</body>
</html>