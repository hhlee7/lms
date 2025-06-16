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
<script>

	$(document).ready(function() {
		
		
		function targetSearch(){
			const selectedLecture = $('#targetLecture').val();
			const url = new URL(window.location.href);
			
			if(selectedLecture != ''){
				url.searchParams.set('lectureId', selectedLecture);
			}
	
			// 검색 조건도 유지하고 싶다면 다음도 함께 포함
			const searchName = $('#searchName').val();

			url.searchParams.set("lectureId", selectedLecture);
			url.searchParams.set("searchName", searchName);
	
			location.href = url.toString();
		}
		
		$('#searchBtn').click(targetSearch);
		$('#targetLecture').change(targetSearch);
	});
	
</script>
</head>
<body>
	<h1>학생 배차 관리 페이지.</h1>
	<a href="/admin/main">[메인 페이지]</a>
	
	<div>
		수업 선택
		<select id="targetLecture" name="targetLecture">
			<option value="">전체</option>
			<c:forEach items="${lectureList}" var="lec">
				<option <c:if test="${lectureId == lec.lectureId}">selected</c:if>
				value="${lec.lectureId}">[${lec.subjectName}] ${lec.dayOfWeek}요일 ${lec.startTime} ~ ${lec.endTime}</option>
			</c:forEach>
		</select>
	</div>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>학년</th>
			<th>차량번호</th>
			<th>기사님</th>
			<th>수업</th>
			<th>요일</th>
			<th>탑승시간</th>
		</tr>
		<c:forEach var="dp" items="${dispatchList}">
			<tr>
				<td><a href="userOne?userId=${dp.studentId}">${dp.studentName}</a></td>
				<td>${dp.vehicleNo}</td>
				<td>${dp.vehicleNo}</td>
				<td><a href="userOne?userId=${dp.driverId}">${dp.driverName}</a></td>
				<td>${dp.subjectName}</td>
				<td>${dp.dayOfWeek}</td>
				<td>${dp.endTime}</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 이름 검색 -->
	이름 : <input type="text" name="searchName" id="searchName" value="${searchName}">
	<button type="button" name="searchBtn" id="searchBtn">검색</button>
</body>
</html>