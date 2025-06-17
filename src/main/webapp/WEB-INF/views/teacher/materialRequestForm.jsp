<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>📦 교보재 요청</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      padding: 40px;
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }
    h2 {
      margin-bottom: 30px;
      color: #343a40;
    }
    .form-container {
      max-width: 600px;
      margin: auto;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.06);
    }
  </style>
</head>
<body>

<div class="container">
  <div class="form-container">
    <h2>교보재 요청</h2>

    <form method="post" action="/teacher/material/request">
      <!-- 수업 선택 -->
      <div class="mb-3">
        <label for="lectureId" class="form-label">수업 선택</label>
        <select name="lectureId" id="lectureId" class="form-select" required>
          <option disabled selected>수업을 선택하세요</option>
          <c:forEach var="lec" items="${lectureList}">
            <option value="${lec.lectureId}">
              ${lec.subjectName} - ${lec.dayOfWeek} ${lec.startTime}
            </option>
          </c:forEach>
        </select>
      </div>

      <!-- 요청 내용 -->
      <div class="mb-3">
        <label for="content" class="form-label">요청 내용</label>
        <textarea name="content" id="content" rows="4" class="form-control" required></textarea>
      </div>

      <!-- 버튼들 -->
      <div class="d-flex justify-content-between">
        <button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
        <button type="submit" class="btn btn-primary">요청하기</button>
      </div>
    </form>
  </div>
</div>

</body>
</html>
