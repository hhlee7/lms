<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>refundList</title>
</head>
<body>
	<h1>환불 내역</h1>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>과목</th>
			<th>환불상태</th>
			<th>환불처리</th>
		</tr>
	<c:forEach var="list" items="${refundList}">
		<tr>
			<td>${list.studentName}</td>
			<td>${list.subjectName}</td>
			<td>${list.status}</td>
			<td>
				<c:if test="${list.status == 'REFUNDWAIT'}">
					<form method="post" action="/admin/changeRefund">
						<input type="hidden" name="enrollmentId" value="${list.enrollmentId}">
						<button type="submit">환불처리</button>
					</form>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>