<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>차량 등록</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <%@ include file="/WEB-INF/views/common/topbar.jsp" %>
  <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">🚐 차량 등록</h2>
    </section>

    <section class="card shadow-sm mx-auto" style="max-width: 600px;">
      <div class="card-body">
        <form action="vehicleInsert" method="post" id="vehicle">
          <div class="mb-3">
            <label for="vehicleNo" class="form-label fw-semibold">차량 번호</label>
            <input type="text" class="form-control" id="vehicleNo" name="vehicleNo" required />
          </div>

          <div class="mb-4">
            <label for="capacity" class="form-label fw-semibold">최대 수용 인원</label>
            <input type="number" class="form-control" id="capacity" name="capacity" required min="1" />
          </div>

          <div class="d-flex justify-content-end gap-2">
            <a href="vehicleManagement" class="btn btn-secondary">
              <i class="bi bi-arrow-left"></i> 목록으로
            </a>
            <button type="submit" class="btn btn-success">
              <i class="bi bi-check-circle"></i> 등록
            </button>
          </div>
        </form>
      </div>
    </section>
  </main>

</body>
</html>
