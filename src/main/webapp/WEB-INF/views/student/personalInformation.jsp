<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 개인정보 페이지</title>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
	<hr>
	
	<table border="1">
		<tr>
			<td>이름</td>
			<td>${loginUser.userName}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${loginUser.birth}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${loginUser.email}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${loginUser.address}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${loginUser.phone}</td>
		</tr>
	</table>
	
	<a href="/student/updateInformation">개인정보 수정</a>
</body>
</html>