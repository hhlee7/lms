<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        margin: 0;
        background-color: #f5f6fa;
        color: #222;
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
        color: #222;
        margin-bottom: 30px;
        font-weight: 700;
        font-family: 'Jua', sans-serif;
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
        font-weight: 500;
    }

    #searchForm button:hover {
        background-color: #005f99;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        font-size: 15px;
    }

    table th, table td {
        padding: 12px 15px;
        border: 1px solid #ddd;
        text-align: center;
        color: #222;
    }

    table th {
        background-color: #f0f4f8;
        font-weight: 600;
    }

    table tr:hover {
        background-color: #f9f9f9;
    }

    table a {
        color: #222;
        text-decoration: none;
        font-weight: 500;
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
        color: #444;
        text-decoration: none;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-weight: bold;
    }

    .pagination a:hover {
        background-color: #f0f0f0;
    }

    .pagination strong {
        background-color: #444;
        color: white;
        border-color: #444;
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

        <!-- 페이지네이션 계산 -->
        <c:if test="${totalPage <= 5}">
            <c:set var="startPage" value="1"/>
            <c:set var="endPage" value="${totalPage}"/>
        </c:if>
        <c:if test="${totalPage > 5}">
            <c:set var="startPage" value="${page - 2}"/>
            <c:set var="endPage" value="${page + 2}"/>
            <c:if test="${startPage < 1}">
                <c:set var="startPage" value="1"/>
                <c:set var="endPage" value="5"/>
            </c:if>
            <c:if test="${endPage > totalPage}">
                <c:set var="endPage" value="${totalPage}"/>
                <c:set var="startPage" value="${totalPage - 4 < 1 ? 1 : totalPage - 4}"/>
            </c:if>
        </c:if>

        <!-- 페이지네이션 UI -->
        <nav aria-label="Page navigation" class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item ${page == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="?page=1&size=${size}&searchWord=${searchWord}">처음</a>
                </li>
                <li class="page-item ${page == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${page - 1}&size=${size}&searchWord=${searchWord}">이전</a>
                </li>
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <li class="page-item ${i == page ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&size=${size}&searchWord=${searchWord}">${i}</a>
                    </li>
                </c:forEach>
                <li class="page-item ${page == totalPage ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${page + 1}&size=${size}&searchWord=${searchWord}">다음</a>
                </li>
                <li class="page-item ${page == totalPage ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${totalPage}&size=${size}&searchWord=${searchWord}">끝</a>
                </li>
            </ul>
        </nav>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
