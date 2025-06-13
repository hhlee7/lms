<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>공지사항 수정 페이지</h1>
	<a href="noticeOne?noticeId=${notice.noticeId}">취소</a>
	
	<form action="noticeModify" method="post">
	<input type="hidden" name="noticeId" id="noticeId" value="${notice.noticeId}">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${notice.adminName}</td>
			</tr>
			<tr>
				<td>대상</td>
				<td>
					<select id="targetRoleId" name="targetRoleId">
						<c:forEach items="${roleList}" var="role">
							<option value="${role.roleId}"
								<c:if test="${notice.targetRoleId == role.roleId}">selected</c:if>
							>${role.roleName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" value="${notice.title}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" rows="5" cols="50">${notice.content}</textarea></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>