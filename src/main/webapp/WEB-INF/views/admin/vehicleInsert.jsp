<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 등록</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>차량 등록 페이지</h1>
	<form action="vehicleInsert" method="post" name=vehicle id=vehicle>
		<table border="1">
			<tr>
				<th>차량 번호</th>
				<td><input type="text" id="vehicleNo" name="vehicleNo"></td>
			</tr>
			<tr>
				<th>최대 수용 인원</th>
				<td><input type="number" id="capacity" name="capacity"></td>
			</tr>
		</table>
		
		<button type="submit">추가</button>
	</form>
	<a href="vehicleManagement">뒤로</a>
</body>
</html>