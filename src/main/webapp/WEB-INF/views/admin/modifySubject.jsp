<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifySubject</title>
</head>
<body>
	<h1>과목 수정</h1>
	<form method="post" name="subjectForm" id="subjectForm" action="/admin/modifySubject">
		<input type="hidden" name="subjectId" value="${subject.subjectId}">
		<div>과목 이름 : <input type="text" name="subjectName" id="subjectId" value="${subject.subjectName}"></div>
		<div>과목 소개 : <textarea rows="5" cols="30" name="description" id="description">${subject.description}</textarea></div>
		<button type="submit">수정</button>
	</form>
</body>
</html>