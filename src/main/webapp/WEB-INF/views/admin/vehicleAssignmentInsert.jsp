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
	
	<table border="1">
	<tr>
		<th>#</th>
		<td>${vehicle.vehicleId}</td>
	</tr>
	<tr>
		<th>차량 번호</th>
		<td>${vehicle.vehicleNo}</td>
	</tr>
	<tr>
		<th>최대 인원</th>
		<td>${vehicle.capacity}</td>
	</tr>
	
	<tr>
		<th>수업 선택</th>
		<td>
			<select>
				<option>==수업선택==</option>
				<c:forEach var="lec" items="${lectureList}">
					<option>[${lec.subjectName}] ${lec.dayOfWeek}요일 ${lec.startTime} ~ ${lec.endTime}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>주차 위치</th>
		<td><input type="text" id="location" name="location"></td>
	</tr>
	
	</table>
	
	<a href="vehicleManagement">뒤로</a>
</body>
</html>