<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교보재 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		function targetSearch(){
			const selectedSubject = $('#targetSubject').val();
			const searchWord = $('#searchWord').val();
			const url = new URL(window.location.href);
			
			// 검색 조건 설정
			url.searchParams.set('searchType', selectedSubject);
			url.searchParams.set("searchWord", searchWord);
			url.searchParams.set('page', 1); // 페이지 리셋

			// 새 주소로 이동
			location.href = url.toString();
		}

		// 과목 select 박스 변경 시
		$('#targetSubject').change(targetSearch);
		
		// 검색 버튼 클릭 시
		$('#searchBtn').click(targetSearch);
	});
</script>
</head>
<body>
	<h1>교보재 관리</h1>
	
	<h2>교보재 목록</h2>
	
	<div><a href="/admin/main">[메인 페이지]</a></div>
	
	<div><a href="/admin/createMaterial">교보재 등록</a></div>
	
	과목 선택 :
	<select name="targetSubject" id="targetSubject">
		<option value="all">전체</option>
		<c:if test="${subjectList != null}">
			<c:forEach var="subject" items="${subjectList}">
				<c:choose>
					<c:when test="${param.searchType == subject.subjectName}">
						<option value="${subject.subjectName}" selected>
							${subject.subjectName}
						</option>
					</c:when>
					<c:otherwise>
						<option value="${subject.subjectName}">
							${subject.subjectName}
						</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
	</select>
	
	<br>
	
	<!-- 교보재 목록 조회 -->
	<c:choose>
		<c:when test="${empty materialList}">
			<p>조회된 교보재 목록이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>과목</th>
					<th>품목</th>
					<th>개수</th>
					<th>요일</th>
					<th>수업 시작 시간</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			<c:forEach var="list" items="${materialList}">
				<tr>
					<td>${list.materialId}</td>
					<td>${list.subjectName}</td>
					<td>${list.materialTitle}</td>
					<td>${list.totalCount}</td>
					<td>${list.dayOfWeek}</td>
					<td>${list.startTime}</td>
					<td>
						<a href="/admin/modifyMaterial?materialId=${list.materialId}">수정</a>
					</td>
					<td>
						<form method="post" action="/admin/removeMaterial">
							<input type="hidden" name="materialId" value="${list.materialId}">
							<button type="submit" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
						</form>
					</td>
				</tr>
			</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	
	<!-- 이름 검색 -->
	<div>
		품목 : <input type="text" name="searchWord" id="searchWord" value="${page.searchWord != null ? page.searchWord : ''}">
		<button type="button" name="searchBtn" id="searchBtn">검색</button>
	</div>
	
	<!-- 페이지 그룹 이동 및 번호 출력 -->
	<div>
		<!-- 이전 그룹 이동 -->
		<c:if test="${page.prevGroup}">
			<a href="/admin/materialManagement?page=${page.prevGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">«</a>
		</c:if>
	
		<!-- 페이지 번호 리스트 -->
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			<c:choose>
				<c:when test="${i == page.currentPage}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="/admin/materialManagement?page=${i}&searchWord=${page.searchWord}&searchType=${page.searchType}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 그룹 이동 -->
		<c:if test="${page.nextGroup}">
			<a href="/admin/materialManagement?page=${page.nextGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">»</a>
		</c:if>
	</div>
</body>
</html>