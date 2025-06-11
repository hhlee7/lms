<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>createSubject</title>
</head>
<body>
	<h1>과목 추가</h1>
	<form method="post" name="subjectForm" id="subjectForm" action="/admin/createSubject">
		<div>과목 이름 : <input type="text" name="subjectName" id="subjectId"></div>
		<div>과목 소개 : <textarea rows="5" cols="30" name="description" id="description"></textarea></div>
		<button type="submit">등록</button>
	</form>
</body>
</html>