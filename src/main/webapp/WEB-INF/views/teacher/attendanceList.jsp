<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>출결 조회</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      padding: 40px;
      background-color: #f9f9f9;
      font-family: 'Segoe UI', sans-serif;
    }
    h2 {
      margin-bottom: 30px;
      color: #333;
    }
    table th {
      background-color: #343a40;
      color: white;
      text-align: center;
    }
    table td {
      vertical-align: middle;
      text-align: center;
    }
    .search-form {
      margin-bottom: 30px;
    }
    .paging a, .paging strong {
      margin: 0 4px;
      text-decoration: none;
    }
    .paging strong {
      color: #0d6efd;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>수강생 출결 현황</h2>

  <!-- 검색 폼 -->
  <form method="get" action="/teacher/attendance/list" class="row g-2 align-items-center search-form">
    <div class="col-auto">
      <input type="text" name="keyword" class="form-control" value="${keyword}" placeholder="학생명 또는 과목 검색" />
    </div>
    <div class="col-auto">
      <input type="date" name="searchDate" class="form-control" value="${searchDate}" />
    </div>
    <div class="col-auto">
      <button type="submit" class="btn btn-primary">검색</button>
    </div>
  </form>

  <!-- 테이블 -->
  <table class="table table-bordered align-middle">
    <thead>
      <tr>
        <th>학생명</th>
        <th>과목</th>
        <th>요일</th>
        <th>시간</th>
        <th>출결일</th>
        <th>상태</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="a" items="${attendanceList}">
        <tr>
          <td>${a.studentName}</td>
          <td>${a.subjectName}</td>
          <td>${a.dayOfWeek}</td>
          <td>${a.startTime} ~ ${a.endTime}</td>
          <td><fmt:formatDate value="${a.attendDate}" pattern="yyyy-MM-dd" /></td>
          <td>${a.status}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <!-- 페이징 -->
  <div class="paging mt-4">
    <c:forEach begin="1" end="${lastPage}" var="i">
      <c:choose>
        <c:when test="${i == page}">
          <strong>[${i}]</strong>
        </c:when>
        <c:otherwise>
          <a href="/teacher/attendance/list?page=${i}&keyword=${keyword}&searchDate=${searchDate}">[${i}]</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </div>

  <!-- 🔙 뒤로가기 -->
  <div class="mt-4">
    <button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
  </div>
</div>

</body>
</html>
