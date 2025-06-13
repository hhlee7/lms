<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>materialRequestManagement</title>
</head>
<body>
	<h1>교보재 요청 관리</h1>
	
	<h2>교보재 요청 목록</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>요청사항</th>
			<th>요청일</th>
			<th>신청자</th>
			<th>과목</th>
			<th>시작 시간</th>
			<th>요일</th>
			<th>상태</th>
			<th>요청처리</th>
		</tr>
	<c:forEach var="list" items="${materialRequestList}">
		<tr>
			<td>${list.requestId}</td>
			<td>${list.content}</td>
			<td>${list.requestedAt}</td>
			<td>${list.teacherName}</td>
			<td>${list.subjectName}</td>
			<td>${list.startTime}</td>
			<td>${list.dayOfWeek}</td>
			<td>${list.status}</td>
			<td>
				<c:if test="${list.status == '요청완료'}">
					<form method="post" action="/admin/changeMaterialRequestStatus">
						<input type="hidden" name="requestId" value="${list.requestId}">
						<button type="submit">완료처리</button>
					</form>
				</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>