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
		$('#classroomName').on('input', function() {
			// 입력값이 비어 있지 않으면 에러 메시지 제거
			if($(this).val().trim() != '') {
				$('#classroomNameCheck').text('');
			}
		});
		
		$('#location').on('input', function() {
			// 입력값이 비어 있지 않으면 에러 메시지 제거
			if($(this).val().trim() != '') {
				$('#locationCheck').text('');
			}
		});
		
		$('#capacity').on('input', function() {
			// 입력값이 비어 있지 않으면 에러 메시지 제거
			if($(this).val().trim() != '') {
				$('#capacityCheck').text('');
			}
		});
		
		// 폼 제출되기 전 유효성 검사 수행
		$('#classroomForm').submit(function(e) {
			const classroomName = $('#classroomName').val().trim();
			const location = $('#location').val().trim();
			const capacity = $('#capacity').val();
			
			// 강의실 이름 유효성 검사
			if(classroomName == '') {
				$('#classroomNameCheck').css('color', 'red').text('강의실 이름을 입력하세요.');
				e.preventDefault();
				return;
			}
			
			// 강의실 위치 유효성 검사
			if(location == '') {
				$('#locationCheck').css('color', 'red').text('강의실 위치를 입력하세요.');
				e.preventDefault();
				return;
			}
			
			// 강의실 수용 인원 유효성 검사
			if(capacity == '' || isNaN(capacity) || capacity <= 4) {
				$('#capacityCheck').css('color', 'red').text('수용 인원은 5명 이상이어야 합니다.');
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
		<div>
			이름 : <input type="text" name="classroomName" id="classroomName" value="${classroom.classroomName}">
			<span id="classroomNameCheck" style="color:red; margin-left:10px;"></span>
		</div>
		<div>
			위치 : <input type="text" name="location" id="location" value="${classroom.location}">
			<span id="locationCheck" style="color:red; margin-left:10px;"></span>
		</div>
		<div>
			수용 인원 : <input type="number" name="capacity" id="capacity" value="${classroom.capacity}">
			<span id="capacityCheck" style="color:red; margin-left:10px;"></span>
		</div>
		<button type="submit">수정</button>
	</form>
</body>
</html>