<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 관리</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>차량 관리 페이지 입니다.</h1>
	<a href="adminMain">[메인 페이지]</a>
	<c:if test="${vehicleList == null}">
		차량이 없습니다.
	</c:if>
	
	<a href="vehicleInsert">차량 등록</a>
	<c:if test="${vehicleList != null}">
		<table border="1">
		<tr>
			<th>#</th>
			<th>차량 번호</th>
			<th>인원</th>
			<th>기사님</th>
			<th>전화번호</th>
			<th>정정</th>
		</tr>
			<c:forEach var="vehicle" items="${vehicleList}">
				<tr>
					<td>${vehicle.vehicleId}</td>
					<td>${vehicle.vehicleNo}</td>
					<td>${vehicle.capacity}</td>
					<td>${vehicle.driverName}</td>
					<td>${vehicle.phone}</td>
					<td><a href="vehicleModify?vehicleId=${vehicle.vehicleId}">수정</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>