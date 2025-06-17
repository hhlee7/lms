<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>사진첩</h1>
	
	<form id="searchForm" method="get" action="/student/album">
	    <input type="text" name="searchWord" placeholder="앨범 제목 검색" value="${searchWord}" />
	        <button type="submit">검색</button>
	</form>

	<table border="1">
		<tr>
			<th>#</th>
			<th>과목</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="album" items="${albumList}">
		<tr>
			<td>${album.albumId}</td>
			<td>${album.subjectName}</td>
			<td><a href="albumOne?albumId=${album.albumId}">${album.title}</a></td>
			<td>${album.createdAt}</td>
		</tr>
		</c:forEach>
	</table>
	
	<c:set var="startPage" value="${page - 2 < 1 ? 1 : page - 2}" />
	<c:set var="endPage" value="${page + 2 > totalPage ? totalPage : page + 2}" />
	
	<!-- 처음 버튼 -->
	<c:if test="${page > 1}">
	    <a href="?page=1&size=${size}&searchWord=${searchWord}">처음</a>
	    <a href="?page=${page - 1}&size=${size}&searchWord=${searchWord}">이전</a>
	</c:if>
	
	<!-- 페이지 번호들 -->
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
	    <c:choose>
	        <c:when test="${i == page}">
	            <strong>${i}</strong>
	        </c:when>
	        <c:otherwise>
	            <a href="?page=${i}&size=${size}&searchWord=${searchWord}">${i}</a>
	        </c:otherwise>
	    </c:choose>
	</c:forEach>
	
	<!-- 다음, 끝 버튼 -->
	<c:if test="${page < totalPage}">
	    <a href="?page=${page + 1}&size=${size}&searchWord=${searchWord}">다음</a>
	    <a href="?page=${totalPage}&size=${size}&searchWord=${searchWord}">끝</a>
	</c:if>
</body>
</html>