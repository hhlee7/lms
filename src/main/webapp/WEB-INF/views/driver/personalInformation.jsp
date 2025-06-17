<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 개인정보 페이지</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<table border="1">
		<tr>
			<td>이름</td>
			<td>${user.userName}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${user.birth}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${user.email}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${user.address}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${user.phone}</td>
		</tr>
	</table>
	
	<a href="/driver/updateInformation">개인정보 수정</a>
	<a href="/driver/updatePassword">비밀번호 수정</a>
</body>
</html>