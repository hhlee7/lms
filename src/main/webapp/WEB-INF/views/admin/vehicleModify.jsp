<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 수정</title>
</head>
<body>
	<h1>차량 수정 페이지</h1>
	<form action="vehicleModify" method="post" name=vehicle id=vehicle>
		<input type="hidden" id="vehicleId" name="vehicleId" value="${vehicle.vehicleId}">
		<table border="1">
			<tr>
				<th>차량 번호</th>
				<td><input type="text" id="vehicleNo" name="vehicleNo" value="${vehicle.vehicleNo}"></td>
			</tr>
			<tr>
				<th>최대 수용 인원</th>
				<td><input type="number" id="capacity" name="capacity" value="${vehicle.capacity}"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
	<a href="vehicleManagement">뒤로</a>
</body>
</html>