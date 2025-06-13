<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항</title>
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

  <h2>공지사항</h2>

  <!-- 메인으로 이동 버튼 우측 -->
  <div class="top-right">
    <a href="/teacher/main">
      <button type="button">메인으로</button>
    </a>
  </div>

  <!-- 공지사항 테이블 -->
  <table>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
    </tr>
    <c:forEach var="n" items="${noticeList}">
      <tr>
        <td>${n.notice_id}</td>
        <td>${n.title}</td>
        <td>${n.admin_id}</td>
        <td>
          <fmt:formatDate value="${n.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
        </td>
      </tr>
    </c:forEach>
  </table>
  
  <!-- 검색창 중앙 정렬 -->
	<div class="search-bar">
	  <form method="get" action="/teacher/notice/list" style="display: flex;">
	    <input type="text" name="keyword" value="${keyword}" placeholder="제목 또는 내용 검색" />
	    <button type="submit">검색</button>
	  </form>
	</div>

  <!-- 페이지 네비게이션 -->
  <div class="pagination">
    <c:forEach begin="1" end="${lastPage}" var="i">
      <c:choose>
        <c:when test="${i == page}">
          <strong>[${i}]</strong>
        </c:when>
        <c:otherwise>
          <a href="/teacher/notice/list?page=${i}&keyword=${keyword}">[${i}]</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </div>

</body>
</html>
