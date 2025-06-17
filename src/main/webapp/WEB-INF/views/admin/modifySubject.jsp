<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifySubject</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#subjectName').on('input', function() {
			// 입력값이 비어 있지 않으면 에러 메시지 제거
			if($(this).val().trim() != '') {
				$('#checkSubject').text('');
			}
		});
		
		$('#description').on('input', function() {
			// 입력값이 비어 있지 않으면 에러 메시지 제거
			if($(this).val().trim() != '') {
				$('#checkDescription').text('');
			}
		});
		
		// 폼 제출되기 전 유효성 검사 수행
		$('#subjectForm').submit(function(e) {
			// 입력값 가져오기 (공백 제거)
			const subjectName = $('#subjectName').val().trim();
			const description = $('#description').val().trim();
			
			// 과목 이름 유효성 검사
			if(subjectName == '') {
				$('#checkSubject').css('color', 'red').text('과목 이름을 입력하세요.');
				e.preventDefault();
				return;
			}
			
			// 과목 소개 유효성 검사
			if(description == '') {
				$('#checkDescription').css('color', 'red').text('과목 소개를 입력하세요.');
				e.preventDefault();
				return;
			}
		});
	});
</script>
</head>
<body>
	<h1>과목 수정</h1>
	<form method="post" name="subjectForm" id="subjectForm" action="/admin/modifySubject">
		<input type="hidden" name="subjectId" value="${subject.subjectId}">
		<div>
			과목 이름 : <input type="text" name="subjectName" id="subjectName" value="${subject.subjectName}">
			<span id="checkSubject" style="color:red; margin-left:10px;"></span>
		</div>
		<div>
			과목 소개 : <textarea rows="5" cols="30" name="description" id="description">${subject.description}</textarea>
			<span id="checkDescription" style="color:red; margin-left:10px;"></span>
		</div>
		<button type="submit">수정</button>
	</form>
</body>
</html>