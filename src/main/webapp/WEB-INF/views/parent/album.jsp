<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<html>
<head>
    <title>사진첩</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #f4f4f4; }
        .pagination a, .pagination strong {
            margin: 0 3px; text-decoration: none; padding: 5px 10px;
            border: 1px solid #ccc; border-radius: 4px;
        }
        .pagination strong {
            background-color: #ddd;
            font-weight: bold;
        }
        .search-form {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<h2>사진첩</h2>

<form method="get" action="/parent/album" class="search-form">
    <input type="text" name="keyword" placeholder="앨범 제목 검색" value="${keyword}" />
    <button type="submit">검색</button>
</form>

<table>
    <thead>
        <tr>
            <th>앨범 번호</th>
            <th>강좌 번호</th>
            <th>제목</th>
            <th>설명</th>
            <th>생성일</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="album" items="${albumList}">
            <tr>
                <td>${album.album_id}</td>
                <td>${album.lecture_id}</td>
                <td>${album.title}</td>
                <td>${album.description}</td>
                <td>${album.created_at}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty albumList}">
            <tr><td colspan="5" style="text-align:center;">검색된 사진첩이 없습니다.</td></tr>
        </c:if>
    </tbody>
</table>

<div class="pagination" style="margin-top: 20px;">
    <c:forEach begin="1" end="${lastPage}" var="i">
        <c:choose>
            <c:when test="${i == page}">
                <strong>${i}</strong>
            </c:when>
            <c:otherwise>
                <a href="/parent/album?page=${i}&keyword=${keyword}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>

</body>
</html>
