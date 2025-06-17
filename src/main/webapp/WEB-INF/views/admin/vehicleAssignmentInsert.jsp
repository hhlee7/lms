<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 배정</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>차량 배정 페이지 입니다.</h1>
	<form action="vehicleAssignmentInsert" method="post" name="vehicleAssignment" id="vehicleAssignment">
		<c:if test="${vehicleAssignment != null}">
			    <input type="hidden" id="assignmentId" name="assignmentId" value="${vehicleAssignment.assignmentId}">
		</c:if>
		<table border="1">
		<tr>
			<th>#</th>
			<td><input type="text" id="vehicleId" name="vehicleId" value="${vehicle.vehicleId}" readonly></td>
		</tr>
		<tr>
			<th>차량 번호</th>
			<td><input type="text" id="vehicleNo" name="vehicleNo" value="${vehicle.vehicleNo}" readonly></td>
		</tr>
		<tr>
			<th>최대 인원</th>
			<td>${vehicle.capacity}</td>
		</tr>
		
		<tr>
			<th>운전기사 선택</th>
			<td>
				<select name="driverId" id="driverId">
				    <option value="">기사 없음</option>
				    <c:forEach var="dr" items="${driverList}">
				        <option value="${dr.userId}" 
				            <c:if test="${vehicleAssignment != null && vehicleAssignment.driverId == dr.userId}">
				                selected
				            </c:if>
				        >[${dr.userId}] ${dr.userName}</option>
				    </c:forEach>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>주차 위치</th>
			<td>
			<c:if test="${vehicleAssignment != null}">
			    <input type="text" id="location" name="location" value="${vehicleAssignment.location}">
			</c:if>
			<c:if test="${vehicleAssignment == null}">
			    <input type="text" id="location" name="location">
			</c:if>
			</td>
		</tr>
			
		</table>
		<button type="submit">배정</button>
	</form>
	<a href="/admin/vehicleManagement">뒤로</a>
</body>
</html>