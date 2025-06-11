<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<form method="post" name="userForm" id="userForm" action="login">
		<div>아이디 : <input type="text" name="userId" id="userId"></div>
		<div>비밀번호 : <input type="password" name="password" id="password"></div>
		<button type="submit">로그인</button>
	</form>
</body>
</html>