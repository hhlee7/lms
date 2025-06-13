<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${studentName}의 배차 취소 신청</h1>
	
	<form method="post" action="/parent/cancelVehicle">
		<div>
			취소 사유 : <input type="text" id="reason" name="reason" required>
		</div>
		<button type="submit">신청하기</button>
	</form>
</body>
</html>