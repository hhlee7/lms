<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>출석 체크</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      padding: 40px;
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }
    h2 {
      margin-bottom: 30px;
      color: #333;
    }
    .status-complete {
      color: green;
      font-weight: bold;
    }
    .status-absent select {
      width: 120px;
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
    .btn-submit {
      margin-left: 10px;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>출석 체크</h2>

  <c:if test="${not empty success}">
    <div class="alert alert-success">${success}</div>
  </c:if>

  <table class="table table-bordered align-middle">
    <thead>
      <tr>
        <th>학생 이름</th>
        <th>과목</th>
        <th>출결 날짜</th>
        <th>출결 상태</th>
        <th>변경</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="a" items="${checkList}">
        <tr>
          <td>${a.studentName}</td>
          <td>${a.subjectName}</td>
          <td><fmt:formatDate value="${a.attendDate}" pattern="yyyy-MM-dd" /></td>
          <td>${a.status}</td>
          <td>
            <c:if test="${a.status == '결석'}">
              <form method="post" action="/teacher/attendance/check" class="d-flex justify-content-center status-absent">
                <c:if test="${not empty a.attendanceId}">
                  <input type="hidden" name="attendanceId" value="${a.attendanceId}" />
                </c:if>
                <input type="hidden" name="paymentId" value="${a.payment_id}" />
                <select name="status" class="form-select form-select-sm w-auto">
                  <option value="출석">출석</option>
                  <option value="지각">지각</option>
                  <option value="결석" selected>결석</option>
                </select>
                <button type="submit" class="btn btn-primary btn-sm btn-submit">변경</button>
              </form>
            </c:if>
            <c:if test="${a.status != '결석'}">
              <span class="status-complete">✔ 완료</span>
            </c:if>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <div class="text-end mt-4">
    <a href="/teacher/main" class="btn btn-secondary">메인으로</a>
  </div>
</div>

</body>
</html>
