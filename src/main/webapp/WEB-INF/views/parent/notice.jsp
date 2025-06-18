<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f7fb;
    margin: 0;
    padding: 120px 0 40px;
  }

  h1 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 30px;
    font-size: 28px;
  }

  table {
    width: 90%;
    margin: 0 auto;
    border-collapse: collapse;
    background-color: #ffffff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  }

  th, td {
    padding: 14px 18px;
    text-align: center;
    border-bottom: 1px solid #eaeaea;
    font-size: 16px;
  }

  th {
    background-color: #f0f4ff;
    color: #333;
    font-weight: 600;
  }

  tr:hover td {
    background-color: #f9fbff;
  }

  td a {
    color: #0077cc;
    text-decoration: none;
  }

  td a:hover {
    text-decoration: underline;
  }

  .page {
    text-align: center;
    margin-top: 30px;
  }

  .page a {
    margin: 0 4px;
    padding: 6px 12px;
    text-decoration: none;
    color: #0077cc;
    border: 1px solid #ccc;
    border-radius: 6px;
    background-color: #fff;
    transition: all 0.2s ease;
  }

  .page a:hover {
    background-color: #e6f0ff;
  }

  .page strong {
    margin: 0 4px;
    padding: 6px 12px;
    background-color: #0077cc;
    color: white;
    border-radius: 6px;
  }
</style>
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