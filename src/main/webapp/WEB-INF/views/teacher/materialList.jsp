<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>교보제 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      padding: 40px;
      background-color: #f4f6f9;
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
      text-align: center;
      vertical-align: middle;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>교보제 목록</h2>

  <table class="table table-bordered align-middle">
    <thead>
      <tr>
        <th>교보제명</th>
        <th>과목</th>
        <th>요일</th>
        <th>시작시간</th>
        <th>총 수량</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="m" items="${materialList}">
        <tr>
          <td>${m.materialTitle}</td>
          <td>${m.subjectName}</td>
          <td>${m.dayOfWeek}</td>
          <td>${m.startTime}</td>
          <td>${m.totalCount}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <div class="mt-4 text-end">
    <button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
  </div>
</div>

</body>
</html>
