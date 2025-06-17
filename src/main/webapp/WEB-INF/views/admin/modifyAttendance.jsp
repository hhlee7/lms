<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyAttendance</title>
</head>
<body>
	<h1>출결 관리</h1>
	
	<h2>출결 수정</h2>
	<form method="post" name="changeAttendanceStatus" id="changeAttendanceStatus" action="/admin/changeAttendanceStatus">
	<input type="hidden" name="attendanceId" value="${attendance.attendanceId}">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>날짜</th>
			<th>상태</th>
			<th>과목</th>
			<th>수업 시작 시간</th>
			<th>요일</th>
			<th>강의실</th>
			<th>강사</th>
			<th>수정</th>
		</tr>
		<tr>
			<td>${attendance.attendanceId}</td>
			<td>${attendance.studentName}</td>
			<td>${attendance.attendDate}</td>
			<td>
				<select name="status" id="status">
			    	<c:choose>
			    		<c:when test="${attendance.status == '출석'}">
					        <option value="출석" selected>출석</option>
			    		</c:when>
			    		<c:otherwise>
					        <option value="출석">출석</option>
			    		</c:otherwise>
			    	</c:choose>
			    	<c:choose>
			    		<c:when test="${attendance.status == '지각'}">
					        <option value="지각" selected>지각</option>
			    		</c:when>
			    		<c:otherwise>
					        <option value="지각">지각</option>
			    		</c:otherwise>
			    	</c:choose>
			    	<c:choose>
			    		<c:when test="${attendance.status == '결석'}">
					        <option value="결석" selected>결석</option>
			    		</c:when>
			    		<c:otherwise>
					        <option value="결석">결석</option>
			    		</c:otherwise>
			    	</c:choose>
			    </select>
			</td>
			<td>${attendance.subjectName}</td>
			<td>${attendance.startTime}</td>
			<td>${attendance.dayOfWeek}</td>
			<td>${attendance.classroomName}</td>
			<td>${attendance.teacherName}</td>
			<td>
				<button type="submit">수정</button>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>