<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<!-- ✅ Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    background-color: #f9f9fb;
    font-family: 'Noto Sans KR', sans-serif;
  }

  .notice-section {
    max-width: 1000px;
    margin: 80px auto;
    padding: 40px 30px;
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.05);
  }

  .notice-header h2 {
    font-family: 'Jua', 'Noto Sans KR', sans-serif;
    font-size: 2.2rem;
    font-weight: 700;
    margin-bottom: 5px;
    color: #222;
  }

  .notice-header p {
    font-family: 'Gowun Dodum', 'Noto Sans KR', sans-serif;
    font-size: 1rem;
    color: #666;
    margin-bottom: 30px;
  }

  .notice-table th {
    background-color: #f2f4f8;
    font-weight: 600;
    text-align: center;
    font-family: 'Gowun Dodum', 'Noto Sans KR', sans-serif;
  }

  .notice-table td {
    font-family: 'Gowun Dodum', 'Noto Sans KR', sans-serif;
  }

  .notice-table tbody tr:hover {
    background-color: #f8f9ff;
    transition: background-color 0.3s ease;
  }

  .notice-table td a {
    text-decoration: none;
    color: #222;
  }

  .notice-table td a:hover {
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
    font-family: 'Gowun Dodum', 'Noto Sans KR', sans-serif;
  }

  .pagination a:hover {
    background-color: #f0f0f0;
  }

  .pagination strong {
    background-color: #007acc;
    color: white;
    border-color: #007acc;
  }

  .total-count {
    text-align: right;
    margin-bottom: 10px;
    color: #555;
    font-size: 0.95rem;
    font-family: 'Gowun Dodum', 'Noto Sans KR', sans-serif;
  }
</style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="notice-section">
  <div class="notice-header text-center">
    <h2>공지사항</h2>
    <p>학교에서 전하는 최신 소식을 확인하세요.</p>
  </div>

  <div class="total-count">
    총 <strong>${totalCount}</strong>건
  </div>

  <table class="table table-hover notice-table align-middle">
    <thead>
      <tr>
        <th style="width: 10%;">번호</th>
        <th class="text-center">제목</th>
        <th style="width: 15%;">작성자</th>
        <th style="width: 20%;">작성일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="notice" items="${noticeList}">
        <tr>
          <td class="text-center">${notice.noticeId}</td>
          <td class="text-center">
            <a href="/student/noticeOne?noticeId=${notice.noticeId}" class="fw-semibold text-dark text-decoration-none">
              ${notice.title}
            </a>
          </td>
          <td class="text-center">관리자</td>
          <td class="text-center">${notice.createdAt}</td>
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
        <a class="page-link" href="?page=1&size=${size}">처음</a>
      </li>
      <li class="page-item ${page == 1 ? 'disabled' : ''}">
        <a class="page-link" href="?page=${page - 1}&size=${size}">이전</a>
      </li>
      <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <li class="page-item ${i == page ? 'active' : ''}">
          <a class="page-link" href="?page=${i}&size=${size}">${i}</a>
        </li>
      </c:forEach>
      <li class="page-item ${page == totalPage ? 'disabled' : ''}">
        <a class="page-link" href="?page=${page + 1}&size=${size}">다음</a>
      </li>
      <li class="page-item ${page == totalPage ? 'disabled' : ''}">
        <a class="page-link" href="?page=${totalPage}&size=${size}">끝</a>
      </li>
    </ul>
  </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
