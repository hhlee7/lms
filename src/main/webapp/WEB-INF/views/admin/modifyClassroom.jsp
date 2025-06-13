<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyClassroom</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#classroomForm').submit(function(e) {
			const classroomName = $('#classroomName').val().trim();
			const location = $('#location').val().trim();
			const capacity = $('#capacity').val();
			
			if(classroomName == '') {
				alert("강의실 이름을 입력하세요.");
				e.preventDefault();
				return;
			}
		
			if(location == '') {
				alert("강의실 위치를 입력하세요.");
				e.preventDefault();
				return;
			}
			
			if(capacity == '' || isNaN(capacity) || capacity <= 4) {
				alert("수용 인원은 5명 이상이어야 합니다.");
				e.preventDefault();
				return;
			}
		});
	});
</script>
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