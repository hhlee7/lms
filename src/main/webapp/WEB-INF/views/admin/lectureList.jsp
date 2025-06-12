<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lectureList</title>
</head>
<body>
	<h1>수업 목록</h1>
	
	<a href="/admin/createLecture">수업 등록</a>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과목</th>
			<th>강사</th>
			<th>강의실</th>
			<th>위치</th>
			<th>시작 시간</th>
			<th>종료 시간</th>
			<th>요일</th>
			<th>개강일</th>
			<th>종강일</th>
			<th>수정</th>
		</tr>
	<c:forEach var="list" items="${lectureList}">
		<tr>
			<td>${list.lectureId}</td>
			<td>${list.subjectName}</td>
			<td>${list.teacherName}</td>
			<td>${list.classroomName}</td>
			<td>${list.location}</td>
			<td>${list.startTime}</td>
			<td>${list.endTime}</td>
			<td>${list.dayOfWeek}</td>
			<td>${list.startDate}</td>
			<td>${list.endDate}</td>
			<td>
				<a href="/admin/modifyLecture?lectureId=${list.lectureId}">수정</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>