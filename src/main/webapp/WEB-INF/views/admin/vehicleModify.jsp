<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>차량 수정</title>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">차량 정보 수정</h2>
    </section>

    <section class="card shadow-sm mx-auto" style="max-width: 600px;">
      <div class="card-body">
        <form action="vehicleModify" method="post" id="vehicle">
          <input type="hidden" name="vehicleId" value="${vehicle.vehicleId}" />

          <div class="mb-3">
            <label for="vehicleNo" class="form-label fw-semibold">차량 번호</label>
            <input type="text" class="form-control" id="vehicleNo" name="vehicleNo" value="${vehicle.vehicleNo}" required />
          </div>

          <div class="mb-4">
            <label for="capacity" class="form-label fw-semibold">최대 수용 인원</label>
            <input type="number" class="form-control" id="capacity" name="capacity" value="${vehicle.capacity}" required min="1" />
          </div>

          <div class="d-flex justify-content-end gap-2">
            <a href="vehicleManagement" class="btn btn-secondary">
              <i class="bi bi-arrow-left"></i> 목록으로
            </a>
            <button type="submit" class="btn btn-primary">
              <i class="bi bi-check-circle"></i> 수정 완료
            </button>
          </div>
        </form>
      </div>
    </section>
  </main>

</body>
</html>
