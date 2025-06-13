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
		$('#subjectForm').submit(function(e) {
			const subjectName = $('#subjectName').val().trim();
			const description = $('#description').val().trim();
			
			if(subjectName == '') {
				alert("과목 이름을 입력하세요.");
				e.preventDefault();
				return;
			}
		
			if(description == '') {
				alert("과목 소개를 입력하세요.");
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
		<div>과목 이름 : <input type="text" name="subjectName" id="subjectName" value="${subject.subjectName}"></div>
		<div>과목 소개 : <textarea rows="5" cols="30" name="description" id="description">${subject.description}</textarea></div>
		<button type="submit">수정</button>
	</form>
</body>
</html>