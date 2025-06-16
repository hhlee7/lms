<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>공지사항 등록 페이지</h1>
	<a href="/admin/noticeManagement">뒤로</a>
	
	<form action="noticeInsert" method="post">
	<input type="hidden" name="adminId" id="adminId" value="${loginUser.userId}">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${loginUser.userName}</td>
			</tr>
			<tr>
				<td>대상</td>
				<td>
					<select id="targetRoleId" name="targetRoleId">
						<c:forEach items="${roleList}" var="role">
							<option value="${role.roleId}">${role.roleName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" placeholder="제목을 입력해주세요."></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" rows="5" cols="50"></textarea></td>
			</tr>
		</table>
		<button type="submit">작성</button>
	</form>
</body>
</html>