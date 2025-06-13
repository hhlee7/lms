<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>materialManagement</title>
</head>
<body>
	<h1>교보재 관리</h1>
	
	<h2>교보재 목록</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과목</th>
			<th>품목</th>
			<th>개수</th>
			<th>사용중</th>
			<th>요일</th>
			<th>시작 시간</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="list" items="${materialList}">
		<tr>
			<td>${list.materialId}</td>
			<td>${list.subjectName}</td>
			<td>${list.materialTitle}</td>
			<td>${list.totalCount}</td>
			<td>${list.usedCount}</td>
			<td>${list.dayOfWeek}</td>
			<td>${list.startTime}</td>
			<td>
				<a href="/admin/modifyMaterial?materialId=${list.materialId}">수정</a>
			</td>
			<td>
				<form method="post" action="/admin/removeMaterial">
					<input type="hidden" name="materialId" value="${list.materialId}">
					<button type="submit">삭제</button>
				</form>
			</td>
		</tr>
	</c:forEach>
	</table>
	<a href="/admin/createMaterial">교보재 등록</a>
</body>
</html>