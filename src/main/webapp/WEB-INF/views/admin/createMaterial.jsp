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
	
	<h2>교보재 등록</h2>
	<form method="post" name="materialForm" id="materialForm" action="/admin/createMaterial">
		<table border="1">
		<tr>
			<th>수업</th>
			<td>
				<select name="lectureId" id="lectureId">
					<c:forEach var="list" items="${list}">
						<option value="${list.lectureId}">${list.lectureId}(${list.subjectName})</option>
					</c:forEach>
				</select>
			</td>
		<tr>
			<th>품목</th>
			<td>
				<input type="text" name="materialTitle" id="materialTitle">
			</td>
		</tr>
		<tr>
			<th>개수</th>
			<td>
				<input type="number" name="totalCount" id="totalCount">
			</td>
		</tr>
		<tr>
			<th>사용 횟수</th>
			<td>
				<input type="number" name="usedCount" id="totalCount">
			</td>
		</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>