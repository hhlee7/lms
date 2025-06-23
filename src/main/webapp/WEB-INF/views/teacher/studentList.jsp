<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <title>학생 목록</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fc;
      padding: 20px;
      text-align: center;
    }

    h2 {
      margin-bottom: 20px;
    }

    form {
      margin-bottom: 20px;
    }

    input[type="text"] {
      padding: 8px 12px;
      width: 250px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    button {
      padding: 8px 14px;
      background-color: #00b4d8;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0077b6;
    }

    table {
      width: 90%;
      margin: 0 auto;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
    }

    th, td {
      padding: 12px 15px;
      border: 1px solid #e0e0e0;
      text-align: center;
    }

    th {
      background-color: #e9eef5;
      color: #333;
    }

    tr:nth-child(even) {
      background-color: #f4f6fa;
    }

    .pagination {
      margin-top: 15px;
    }

    .pagination a, .pagination strong {
      margin: 0 5px;
      text-decoration: none;
      color: #0077b6;
    }

    .pagination strong {
      color: black;
    }

    .main-btn {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #6c757d;
      color: white;
      border: none;
      border-radius: 4px;
    }

    .main-btn:hover {
      background-color: #495057;
    }
  </style>
</head>
<body>

<h2>내 학생들</h2>

<!-- 검색 폼 -->
<form method="get" action="/teacher/student/list">
  <input type="text" name="keyword" value="${keyword}" placeholder="학생 이름 또는 과목 검색" />
  <button type="submit">검색</button>
</form>

<table>
  <tr>
    <th>학생 이름</th>
    <th>과목</th>
    <th>요일</th>
    <th>시작</th>
    <th>종료</th>
  </tr>
  <c:forEach var="s" items="${studentList}">
    <tr>
      <td>${s.studentName}</td>
      <td>${s.subjectName}</td>
      <td>${s.dayOfWeek}</td>
      <td><fmt:formatDate value="${s.startTime}" pattern="HH:mm" /></td>
	  <td><fmt:formatDate value="${s.endTime}" pattern="HH:mm" /></td>
    </tr>
  </c:forEach>
</table>

<!-- 페이징 -->
<div class="pagination">
  <c:forEach begin="1" end="${lastPage}" var="i">
    <c:choose>
      <c:when test="${i == page}">
        <strong>[${i}]</strong>
      </c:when>
      <c:otherwise>
        <a href="/teacher/student/list?page=${i}&keyword=${keyword}">[${i}]</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>
</div>

<a href="/teacher/main"><button class="main-btn">메인으로</button></a>

</body>
</html>
