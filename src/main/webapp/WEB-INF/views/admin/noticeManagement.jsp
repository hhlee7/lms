<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
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
			const searchType = url.searchParams.get("searchType") || "title";
			url.searchParams.set("searchWord", searchWord);
			url.searchParams.set("searchType", searchType);

			location.href = url.toString();
		}
		
		$('#searchBtn').click(targetSearch);
		
		$('#targetRole').change(targetSearch);
	});
</script>
<style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 40px;
      color: #212529;
    }

    h2 {
      text-align: center;
      font-size: 28px;
      margin-bottom: 40px;
    }

    .search-bar {
      display: flex;
      justify-content: center;
      margin-top: 40px;
      margin-bottom: 40px;
    }

    .search-bar input[type="text"] {
      padding: 8px;
      width: 280px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .search-bar button {
      margin-left: 8px;
      background-color: #20c997;
      border: none;
      color: white;
      padding: 8px 16px;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }

    .top-right {
      text-align: right;
      margin-bottom: 20px;
    }

    .top-right a button {
      background-color: #3bc9db;
      color: white;
      border: none;
      padding: 8px 16px;
      border-radius: 6px;
      font-weight: bold;
      cursor: pointer;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    th, td {
      border: 1px solid #dee2e6;
      padding: 12px;
      text-align: center;
    }

    th {
      background-color: #e9ecef;
    }

    tr:hover {
      background-color: #f1f3f5;
    }

    .pagination {
      text-align: center;
      margin-top: 20px;
    }

    .pagination a, .pagination strong {
      display: inline-block;
      margin: 0 5px;
      color: #007bff;
      text-decoration: none;
    }

    .pagination strong {
      color: #212529;
      font-weight: bold;
    }

  </style>

</head>
<body>
	<h1>공지사항 관리 페이지 입니다.</h1>
	
	<!-- 메인으로 이동 버튼 우측 -->
	  <div class="top-right">
	    <a href="/admin/main">
	      <button type="button">메인으로</button>
	    </a>
	    
	    <a href="noticeInsert">
	    	<button type="button">공지사항 등록</button>
	    </a>
	  </div>
	
	<c:if test="${noticeList == null}">
		공지사항이 없습니다.
	</c:if>
	
	
	역할 선택 : <select name="targetRole" id="targetRole">
		<option id="targetRole" value="all">전체</option>
		<c:if test="${roleList != null}">
			<c:forEach var="role" items="${roleList}">
				<option value="${role.roleName}"
					<c:if test="${param.searchType == role.roleName}">selected</c:if>>
					${role.roleName}
				</option>
			</c:forEach>
		</c:if>
	</select>
	
	<br>
	
	<!-- 공지사항 리스트 출력 -->
	<c:if test="${noticeList != null}">
		<table border="1">
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>대상</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="nt" items="${noticeList}">
			<tr>
				<td>${nt.noticeId}</td>
				<td><a href="noticeOne?noticeId=${nt.noticeId}">${nt.title}</a></td>
				<td>${nt.roleName}</td>
				<td>${nt.createdAt}</td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<!-- 제목 검색 -->
	
	<div class="search-bar">
     <form style="display: flex;">
       <input type="text" name="searchWord" id="searchWord" value="${page.searchWord}" placeholder="제목 검색..">
       <button type="button" name="searchBtn" id="searchBtn">검색</button>
     </form>
   </div>
	
	<!-- 페이지 그룹 이동 및 번호 출력 -->
	<div class="pagination">
		<!-- 이전 그룹 이동 -->
		<c:if test="${page.prevGroup}">
			<a href="/noticeManagement?page=${page.prevGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">«</a>
		</c:if>
	
		<!-- 페이지 번호 리스트 -->
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			<c:choose>
				<c:when test="${i == page.currentPage}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="/noticeManagement?page=${i}&searchWord=${page.searchWord}&searchType=${page.searchType}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 그룹 이동 -->
		<c:if test="${page.nextGroup}">
			<a href="/noticeManagement?page=${page.nextGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">»</a>
		</c:if>
	</div>
</body>
</html>