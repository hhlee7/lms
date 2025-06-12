<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyMaterial</title>
</head>
<body>
	<h1>교보재 관리</h1>
	
	<h2>교보재 수정</h2>
	<form method="post" name="materialForm" id="materialForm" action="/admin/modifyMaterial">
		<input type="hidden" name="materialId" value="${material.materialId}">
		<table border="1">
		<tr>
			<th>수업</th>
			<td>
				<select name="lectureId" id="lectureId">
					<c:forEach var="list" items="${list}">
						<c:choose>
							<c:when test="${list.lectureId == material.lectureId}">
								<option value="${list.lectureId}" selected>${list.lectureId}(${list.subjectName})</option>
							</c:when>
							<c:otherwise>
								<option value="${list.lectureId}">${list.lectureId}(${list.subjectName})</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
		<tr>
			<th>품목</th>
			<td>
				<input type="text" name="materialTitle" id="materialTitle" value="${material.materialTitle}">
			</td>
		</tr>
		<tr>
			<th>개수</th>
			<td>
				<input type="number" name="totalCount" id="totalCount" value="${material.totalCount}">
			</td>
		</tr>
		<tr>
			<th>사용 횟수</th>
			<td>
				<input type="number" name="usedCount" id="totalCount" value="${material.usedCount}">
			</td>
		</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>