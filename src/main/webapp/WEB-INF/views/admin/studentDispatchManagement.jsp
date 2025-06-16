<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 배차 관리</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>학생 배차 관리 페이지.</h1>
	<a href="adminMain">[메인 페이지]</a>
	
	<div>
		수업 선택
		<select id="lectureId" name="lectureId">
			<option value="all">전체</option>
			<c:forEach items="${lectureList}" var="lec">
				<option value="${lec.lectureId}">[${lec.subjectName}] ${lec.dayOfWeek}요일 ${lec.startTime} ~ ${lec.endTime}</option>
			</c:forEach>
		</select>
	</div>
	
	<table border="1">
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>	
	</table>
</body>
</html>