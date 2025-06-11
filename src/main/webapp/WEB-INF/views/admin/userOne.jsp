<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 정보</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>관리자 회원 정보 페이지</h1>
	<h3>${selectedUser.userName}님의 정보</h3>
	<form action="userOne" method="post" name="user" id="user">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userId" name="userId" value="${selectedUser.userId}" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="userName" name="userName" value="${selectedUser.userName}"></td>
			</tr>
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
				<td>email</td>
				<td><input type="text" id="email" name="email" value="${selectedUser.email}"></td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="phone" name="phone" value="${selectedUser.phone}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="address" name="address" value="${selectedUser.address}"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" id="birth" name="birth" value="${selectedUser.birth}"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
	
	<c:if test="${lectureList != null}">
		<c:forEach var="lec" items="${lectureList}">
			<table border="1">
				<tr>
					<td>과목</td>
					<td>${lec.subjectName}</td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	
	<!-- 자녀 정보이면서, 학부모 데이터를 출력 -->
	<c:if test="${parentUser != null}">
	<h3>학부모 정보</h3>
		<!-- 학부모 데이터를 forEach문으로 출력 -->
		<c:forEach var="parent" items="${parentUser}">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${parent.userId}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${parent.userName}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${parent.phone}</td>
				</tr>
			</table>
			<br>
		</c:forEach>	
	</c:if>
	
	<!-- 학부모 정보이면서, 자녀 학생 데이터를 출력 -->
	<c:if test="${studentUser != null}">
	<h3>자녀 정보</h3>
		<!-- 자녀가 여러명일수 있으니 forEach문으로 출력 -->
		<c:forEach var="student" items="${studentUser}">
		
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${student.userId}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${student.userName}</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${student.phone}</td>
				</tr>
			</table>
		
		</c:forEach>	
	</c:if>
	
	<a href="userManagement">뒤로</a>
</body>
</html>