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
			<p>차량번호: ${dispatch.vehicleNo}</p>
            <p>요일: ${dispatch.dayOfWeek}</p>
            <p>차량 운행 시작시간 : ${dispatch.endTime}</p>
            <p>차량 운행기간 : ${dispatch.startDate} ~ ${dispatch.endDate}
			<hr>
		</div>
	</c:forEach>
</body>
</html>