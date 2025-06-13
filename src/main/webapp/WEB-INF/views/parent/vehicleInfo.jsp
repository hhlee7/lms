<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty vehicleInfo}">
		<h1>${vehicleInfo.studentName}의 탑승 차량 정보</h1>
		<div>차량번호 : ${vehicleInfo.vehicleNo}</div>
		<div>기사님 이름 : ${vehicleInfo.driverName}</div>
		<div>기사님 연락처 : ${vehicleInfo.phone}</div>
		<div>출발 시간 : ${fn:substring(vehicleInfo.endTime, 0, 10)}</div>
		<a href="/parent/cancelVehicle?studentName=${vehicleInfo.studentName}">배차 취소신청</a>
	</c:if>

	<c:if test="${empty vehicleInfo}">
		<p>배차 정보가 없습니다.</p>
	</c:if>
</body>
</html>