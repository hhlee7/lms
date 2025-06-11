<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$('#roleId').change(function () {
			let selectedRole = $(this).val();
			let roleFieldsHtml = '';
			if (selectedRole === '4') {
				// 학부모: 자녀 ID 입력
				roleFieldsHtml = `
					<tr>
						<td>자녀 ID</td>
						<td><input type="text" name="studentId" id="studentId" /></td>
					</tr>`;
			}
	
			// 기존 내용 지우고 새로 추가
			$('#roleFieldsArea').html(roleFieldsHtml);
		});
	});
</script>
</head>
<body>
	<h1>관리자 회원 추가 페이지</h1>
	<form action="userInsert" method="post" name="user" id="user">
		<table border="1">
			<tr>
				<td>역할</td>
				<td>
				<select name="roleId" id="roleId">
					<c:forEach var="role" items="${roleList}">
						<option value="${role.roleId}"
							<c:if test="${role.roleId == selectedUser.roleId}">selected</c:if>>
							${role.roleName}
						</option>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userId" name="userId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password" name="password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="userName" name="userName"></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input type="text" id="email" name="email"></td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="phone" name="phone"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="address" name="address"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" id="birth" name="birth"></td>
			</tr>
			
			<tbody id="roleFieldsArea"></tbody>
		</table>
		<button type="submit">추가</button>
	</form>
	<a href="userManagement">뒤로</a>
</body>
</html>