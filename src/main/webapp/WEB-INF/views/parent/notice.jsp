<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<td><a href="/parent/noticeOne?noticeId=${notice.noticeId}">${notice.title}</a></td>
				<td>관리자</td>
				<td>${notice.createdAt}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="page">
    <c:if test="${page > 1}">
        <a href="?page=${page - 1}&size=${size}">이전</a>
    </c:if>

    <c:forEach var="i" begin="1" end="${totalPage}">
        <c:choose>
            <c:when test="${i == page}">
                <strong>${i}</strong>
            </c:when>
            <c:otherwise>
                <a href="?page=${i}&size=${size}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${page < totalPage}">
        <a href="?page=${page + 1}&size=${size}">다음</a>
    </c:if>
</div>

</body>
</html>