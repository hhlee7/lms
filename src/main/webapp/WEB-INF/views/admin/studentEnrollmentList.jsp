<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 현황</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		function targetSearch(){
			const selectedSubject = $('#targetSubject').val();
			const url = new URL(window.location.href);
			
			url.searchParams.set('searchType', selectedSubject);
			url.searchParams.set('page', 1); // 페이지 리셋

			// 검색 조건도 유지하고 싶다면 다음도 함께 포함
			const searchWord = $('#searchWord').val();
			const searchType = url.searchParams.get("searchType") || "title";
			url.searchParams.set("searchWord", searchWord);
			url.searchParams.set("searchType", searchType);

			location.href = url.toString();
		}
		
		$('#searchBtn').click(targetSearch);
		
		$('#targetSubject').change(targetSearch);
	});
</script>
</head>
<body>
	<h1>수강 신청 현황</h1>
	
	<div><a href="/adminMain">[메인 페이지]</a></div>
	
	과목 선택 : <select name="targetSubject" id="targetSubject">
		<option id="targetSubject" value="all">전체</option>
		<c:if test="${subjectList != null}">
			<c:forEach var="subject" items="${subjectList}">
				<option value="${subject.subjectName}"
					<c:if test="${param.searchType == subject.subjectName}">selected</c:if>>
					${subject.subjectName}
				</option>
			</c:forEach>
		</c:if>
	</select>
	
	<br>
	
	<!-- 수강 신청 리스트 출력 -->
	<c:if test="${studentEnrollmentList != null}">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>신청 과목</th>
				<th>신청일</th>
				<th>수강료 납부 현황</th>
			</tr>
		<c:forEach var="list" items="${studentEnrollmentList}">
			<tr>
				<td>${list.enrollmentId}</td>
				<td>${list.studentName}</td>
				<td>${list.subjectName}</td>
				<td>${list.enrolledAt}</td>
				<td>${list.status}</td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
	
	<!-- 이름 검색 -->
	이름 : <input type="text" name="searchWord" id="searchWord" value="${page.searchWord}">
	<button type="button" name="searchBtn" id="searchBtn">검색</button>
	
	<!-- 페이지 그룹 이동 및 번호 출력 -->
	<div>
		<!-- 이전 그룹 이동 -->
		<c:if test="${page.prevGroup}">
			<a href="/admin/studentEnrollmentList?page=${page.prevGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">«</a>
		</c:if>
	
		<!-- 페이지 번호 리스트 -->
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			<c:choose>
				<c:when test="${i == page.currentPage}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="/admin/studentEnrollmentList?page=${i}&searchWord=${page.searchWord}&searchType=${page.searchType}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 그룹 이동 -->
		<c:if test="${page.nextGroup}">
			<a href="/admin/studentEnrollmentList?page=${page.nextGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">»</a>
		</c:if>
	</div>
</body>
</html>