<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 관리</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		
		function targetSearch(){
			const selectedRole = $('#targetRole').val();
			const url = new URL(window.location.href);
			
			url.searchParams.set('searchType', selectedRole);
			url.searchParams.set('page', 1); // 페이지 리셋

			// 검색 조건도 유지하고 싶다면 다음도 함께 포함
			const searchWord = $('#searchWord').val();
			url.searchParams.set("searchWord", searchWord);

			location.href = url.toString();
		}
		
		$('#searchBtn').click(targetSearch);
		
		$('#targetRole').change(targetSearch);
	});
</script>
</head>
<body>
	<h1>Q&A 관리 페이지</h1>
	<a href="/admin/main">[메인 페이지]</a>
	<span style="color:red">미응답 Q&A : ${qnaCount} 개</span>
	<table border="1">
		<tr>
			<th>#</th>
			<th>질문자 아이디</th>
			<th>답변자 아이디</th>
			<th>질문</th>
			<th>작성일</th>
			<th>응답일</th>
		</tr>
		<c:forEach items="${qnaList}" var="qna">
			<tr>
				<td>${qna.qnaId}</td>
				<td><a href="userOne?userId=${qna.parentId}">${qna.parentId}</a></td>
				<td><a href="userOne?userId=${qna.adminId}">${qna.adminId}</a></td>
				<td><a href="qnaOne?qnaId=${qna.qnaId}">${qna.question}</a></td>
				<td>${qna.createdAt}</td>
				<td>${qna.answeredAt}</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 제목 검색 -->
	질문 제목 : <input type="text" name="searchWord" id="searchWord" value="${page.searchWord}">
	<button type="button" name="searchBtn" id="searchBtn">검색</button>
	
	<!-- 페이지 그룹 이동 및 번호 출력 -->
	<div>
		<!-- 이전 그룹 이동 -->
		<c:if test="${page.prevGroup}">
			<a href="/qnaManagement?page=${page.prevGroupPage}&searchWord=${page.searchWord}">«</a>
		</c:if>
	
		<!-- 페이지 번호 리스트 -->
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			<c:choose>
				<c:when test="${i == page.currentPage}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="/qnaManagement?page=${i}&searchWord=${page.searchWord}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 그룹 이동 -->
		<c:if test="${page.nextGroup}">
			<a href="/qnaManagement?page=${page.nextGroupPage}&searchWord=${page.searchWord}">»</a>
		</c:if>
	</div>
</body>
</html>