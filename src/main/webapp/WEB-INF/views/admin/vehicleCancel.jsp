<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배차 취소 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		function targetSearch(){
			const searchDate = $('#searchDate').val();
			const searchName = $('#searchWord').val();
			const url = new URL(window.location.href);

			if(searchDate !== '') {
				url.searchParams.set('searchDate', searchDate);
			}
			url.searchParams.set('searchName', searchName);

			location.href = url.toString();
		}

		$('#searchBtn').click(targetSearch);
		$('#searchDate').change(targetSearch);
	});
</script>
</head>
<body>
	<h1>배차 취소 관리 페이지 입니다.</h1>
	<a href="/admin/main">[메인 페이지]</a>

	<!-- 날짜 선택 -->
	<div>
		날짜 선택 : 
		<input type="date" id="searchDate" name="searchDate" value="${param.searchDate}">
	</div>

	<!-- 취소 목록 -->
	<c:if test="${cancelList != null}">
		<table border="1">
			<tr>
				<th>학생</th>
				<th>과목</th>
				<th>사유</th>
				<th>요일</th>
				<th>취소 시간</th>
			</tr>
			<c:forEach var="can" items="${cancelList}">
				<tr>
					<td>${can.studentName}</td>
					<td>${can.subjectName}</td>
					<td>${can.cancelReason}</td>
					<td>${can.dayOfWeek}</td>
					<td>${can.decidedAt}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<!-- 이름 검색 -->
	이름 : 
	<input type="text" name="searchWord" id="searchWord" value="${param.searchName}">
	<button type="button" name="searchBtn" id="searchBtn">검색</button>
	
	<!-- 페이지 그룹 이동 및 번호 출력 -->
	<div>
		<!-- 이전 그룹 이동 -->
		<c:if test="${page.prevGroup}">
			<a href="?page=${page.prevGroupPage}&searchName=${param.searchName}&searchDate=${param.searchDate}">«</a>
		</c:if>
	
		<!-- 페이지 번호 리스트 -->
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			<c:choose>
				<c:when test="${i == page.currentPage}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="?page=${i}&searchName=${param.searchName}&searchDate=${param.searchDate}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 그룹 이동 -->
		<c:if test="${page.nextGroup}">
			<a href="?page=${page.nextGroupPage}&searchName=${param.searchName}&searchDate=${param.searchDate}">»</a>
		</c:if>
	</div>
</body>
</html>
