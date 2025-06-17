<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        background-color: #f5f6fa;
        color: #333;
    }

    .container {
        max-width: 900px;
        margin: 40px auto;
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #007acc;
        margin-bottom: 30px;
    }

    #searchForm {
        text-align: center;
        margin-bottom: 25px;
    }

    #searchForm input[type="text"] {
        padding: 8px 12px;
        width: 250px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    #searchForm button {
        padding: 8px 16px;
        background-color: #007acc;
        color: white;
        border: none;
        border-radius: 5px;
        margin-left: 8px;
        cursor: pointer;
    }

    #searchForm button:hover {
        background-color: #005f99;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table th, table td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: center;
    }

    table th {
        background-color: #f0f4f8;
        color: #333;
    }

    table tr:hover {
        background-color: #f9f9f9;
    }

    table a {
        color: #007acc;
        text-decoration: none;
    }

    table a:hover {
        text-decoration: underline;
    }

    .pagination {
        text-align: center;
        margin-top: 30px;
    }

    .pagination a, .pagination strong {
        display: inline-block;
        margin: 0 5px;
        padding: 6px 12px;
        color: #007acc;
        text-decoration: none;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-weight: bold;
    }

    .pagination a:hover {
        background-color: #f0f0f0;
    }

    .pagination strong {
        background-color: #007acc;
        color: white;
        border-color: #007acc;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
        <h1>사진첩</h1>

        <form id="searchForm" method="get" action="/student/album">
            <input type="text" name="searchWord" placeholder="앨범 제목 검색" value="${searchWord}" />
            <button type="submit">검색</button>
        </form>

        <table>
            <thead>
                <tr>
                    <th>과목</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="album" items="${albumList}">
                    <tr>
                        <td>${album.subjectName}</td>
                        <td><a href="albumOne?albumId=${album.albumId}">${album.title}</a></td>
                        <td>${album.createdAt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="pagination">
            <c:set var="startPage" value="${page - 2 < 1 ? 1 : page - 2}" />
            <c:set var="endPage" value="${page + 2 > totalPage ? totalPage : page + 2}" />

            <!-- 처음 / 이전 -->
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

            <!-- 다음 / 끝 -->
            <c:if test="${page < totalPage}">
                <a href="?page=${page + 1}&size=${size}&searchWord=${searchWord}">다음</a>
                <a href="?page=${totalPage}&size=${size}&searchWord=${searchWord}">끝</a>
            </c:if>
        </div>
    </div>
</body>
</html>