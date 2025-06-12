<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>classroomManagement</title>
</head>
<body>
	<h1>강의실 관리</h1>
	
	<h2>강의실 등록</h2>
	<form method="post" name="classroomForm" id="classroomForm" action="/admin/createClassroom">
		<div>이름 : <input type="text" name="classroomName" id="classroomName"></div>
		<div>위치 : <input type="text" name="location" id="location"></div>
		<div>수용 인원 : <input type="number" name="capacity" id="capacity"></div>
		<button type="submit">등록</button>
	</form>
	
	<h2>강의실 목록</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>위치</th>
			<th>수용 인원</th>
			<th>현재 배정 과목</th>
			<th>현재 배정 강사</th>
			<th>강의 시작 시간</th>
			<th>강의 종료 시간</th>
			<th>수정</th>
		</tr>
	<c:forEach var="list" items="${classroomList}">
		<tr>
			<td>${list.classroomId}</td>
			<td>${list.classroomName}</td>
			<td>${list.location}</td>
			<td>${list.capacity}</td>
			<td>${list.subjectName}</td>
			<td>${list.teacherName}</td>
			<td>${list.startTime}</td>
			<td>${list.endTime}</td>
			<td><a href="/admin/modifyClassroom?classroomId=${list.classroomId}">수정</a></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>