<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paymentList</title>
</head>
<body>
	<h1>수강료 납부 내역</h1>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과목</th>
			<th>이름</th>
			<th>금액</th>
			<th>납부 시간</th>
		</tr>
	<c:forEach var="list" items="${paymentList}">
		<tr>
			<td>${list.paymentId}</td>
			<td>${list.subjectName}</td>
			<td>${list.studentName}</td>
			<td>${list.amount}</td>
			<td>${list.paidAt}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>