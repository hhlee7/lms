<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attendanceManagement</title>
</head>
<body>
	<h1>출결 관리</h1>
	
	<h2>출결 목록</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>날짜</th>
			<th>상태</th>
			<th>과목</th>
			<th>강좌 시작 시간</th>
			<th>요일</th>
			<th>강의실</th>
			<th>강사</th>
			<th>수정</th>
		</tr>
	<c:forEach var="list" items="${attendanceList}">
		<tr>
			<td>${list.attendanceId}</td>
			<td>${list.studentName}</td>
			<td>${list.attendDate}</td>
			<td>${list.status}</td>
			<td>${list.subjectName}</td>
			<td>${list.startTime}</td>
			<td>${list.dayOfWeek}</td>
			<td>${list.classroomName}</td>
			<td>${list.teacherName}</td>
			<td>
				<a href="/admin/modifyAttendance?attendanceId=${list.attendanceId}">수정</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>