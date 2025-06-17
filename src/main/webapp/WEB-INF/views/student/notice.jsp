<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 조회</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>공지사항</h1>
   	<table border="1">
		<tr>
        	<th>번호</th>
			<th>제목</th>
        	<th>작성자</th>
        	<th>작성일</th>
      	</tr>
      	<c:forEach var="notice" items="${noticeList}">
			<tr>
				<td>${notice.noticeId}</td>
            	<td><a href="/student/noticeOne?noticeId=${notice.noticeId}">${notice.title}</a></td>
            	<td>관리자</td>
            	<td>${notice.createdAt}</td>
			</tr>
		</c:forEach>
	</table>
   
	<c:set var="startPage" value="${page - 2 < 1 ? 1 : page - 2}" />
	<c:set var="endPage" value="${page + 2 > totalPage ? totalPage : page + 2}" />
	
	<!-- 처음 버튼 -->
	<c:if test="${page > 1}">
	    <a href="?page=1&size=${size}">처음</a>
	    <a href="?page=${page - 1}&size=${size}">이전</a>
	</c:if>
	
	<!-- 페이지 번호들 -->
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
	    <c:choose>
	        <c:when test="${i == page}">
	            <strong>${i}</strong>
	        </c:when>
	        <c:otherwise>
	            <a href="?page=${i}&size=${size}">${i}</a>
	        </c:otherwise>
	    </c:choose>
	</c:forEach>
	
	<!-- 다음, 끝 버튼 -->
	<c:if test="${page < totalPage}">
	    <a href="?page=${page + 1}&size=${size}">다음</a>
	    <a href="?page=${totalPage}&size=${size}">끝</a>
	</c:if>
</body>
</html>