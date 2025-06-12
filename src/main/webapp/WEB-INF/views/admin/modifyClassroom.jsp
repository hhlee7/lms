<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyClassroom</title>
</head>
<body>
	<h1>강의실 관리</h1>
	
	<h2>강의실 수정</h2>
	<form method="post" name="classroomForm" id="classroomForm" action="/admin/modifyClassroom">
		<input type="hidden" name="classroomId" value="${classroom.classroomId}">
		<div>이름 : <input type="text" name="classroomName" id="classroomName" value="${classroom.classroomName}"></div>
		<div>위치 : <input type="text" name="location" id="location" value="${classroom.location}"></div>
		<div>수용 인원 : <input type="number" name="capacity" id="capacity" value="${classroom.capacity}"></div>
		<button type="submit">수정</button>
	</form>
</body>
</html>