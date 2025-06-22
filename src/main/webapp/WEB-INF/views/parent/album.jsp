<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>사진첩</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafc;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 32px;
        }

        form#searchForm {
            text-align: center;
            margin-bottom: 20px;
        }

        form#searchForm input[type="text"] {
            padding: 8px 14px;
            width: 280px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            outline: none;
            transition: border-color 0.3s ease;
        }

        form#searchForm input[type="text"]:focus {
            border-color: #0077cc;
        }

        form#searchForm button {
            padding: 8px 18px;
            margin-left: 8px;
            background-color: #0077cc;
            color: white;
            font-weight: 600;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form#searchForm button:hover {
            background-color: #005fa3;
        }

        table {
            width: 90%;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #eaeaea;
            font-size: 16px;
            color: #444;
        }

        th {
            background-color: #f0f4ff;
            color: #2c3e50;
            font-weight: 700;
        }

        tr:hover td {
            background-color: #f9fbff;
        }

        a {
            color: #0077cc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* 페이징 스타일 */
        .paging {
            text-align: center;
            margin-bottom: 40px;
        }

        .paging a, .paging strong {
            display: inline-block;
            margin: 0 4px;
            padding: 6px 12px;
            border-radius: 6px;
            transition: all 0.2s ease;
        }

        .paging a {
            border: 1px solid #ccc;
            background-color: #fff;
            color: #0077cc;
            text-decoration: none;
        }

        .paging a:hover {
            background-color: #e6f0ff;
            border-color: #0077cc;
        }

        .paging strong {
            background-color: #0077cc;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>사진첩</h1>

    <form id="searchForm" method="get" action="/parent/album">
        <input type="text" name="searchWord" placeholder="앨범 제목 검색" value="${searchWord}" />
        <button type="submit">검색</button>
    </form>

    <table border="1">
        <thead>
            <tr>
                <th>#</th>
                <th>과목</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="album" items="${albumList}">
                <tr>
                    <td>${album.albumId}</td>
                    <td>${album.subjectName}</td>
                    <td><a href="albumOne?albumId=${album.albumId}">${album.title}</a></td>
                    <td>${album.createdAt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <c:set var="startPage" value="${page - 2 < 1 ? 1 : page - 2}" />
    <c:set var="endPage" value="${page + 2 > totalPage ? totalPage : page + 2}" />

    <div class="paging">
        <c:if test="${page > 1}">
            <a href="?page=1&size=${size}&searchWord=${searchWord}">처음</a>
            <a href="?page=${page - 1}&size=${size}&searchWord=${searchWord}">이전</a>
        </c:if>

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

        <c:if test="${page < totalPage}">
            <a href="?page=${page + 1}&size=${size}&searchWord=${searchWord}">다음</a>
            <a href="?page=${totalPage}&size=${size}&searchWord=${searchWord}">끝</a>
        </c:if>
    </div>
</body>
</html>
