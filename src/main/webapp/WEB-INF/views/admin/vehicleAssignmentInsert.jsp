<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>차량 배정</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">🧭 차량 배정</h2>
    </section>

    <section class="card shadow-sm mx-auto" style="max-width: 700px;">
      <div class="card-body">
        <form action="vehicleAssignmentInsert" method="post" id="vehicleAssignment">

          <c:if test="${vehicleAssignment != null}">
            <input type="hidden" name="assignmentId" value="${vehicleAssignment.assignmentId}" />
          </c:if>

          <div class="row mb-3">
            <div class="col-md-6">
              <label class="form-label fw-semibold">차량 ID</label>
              <input type="text" class="form-control" name="vehicleId" value="${vehicle.vehicleId}" readonly />
            </div>
            <div class="col-md-6">
              <label class="form-label fw-semibold">차량 번호</label>
              <input type="text" class="form-control" name="vehicleNo" value="${vehicle.vehicleNo}" readonly />
            </div>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">최대 인원</label>
            <div class="form-control bg-light">${vehicle.capacity}</div>
          </div>

          <div class="mb-3">
            <label for="driverId" class="form-label fw-semibold">운전기사 선택</label>
            <select class="form-select" name="driverId" id="driverId">
              <option value="">기사 없음</option>
              <c:forEach var="dr" items="${driverList}">
                <option value="${dr.userId}" 
                  <c:if test="${vehicleAssignment != null && vehicleAssignment.driverId == dr.userId}">selected</c:if>>
                  [${dr.userId}] ${dr.userName}
                </option>
              </c:forEach>
            </select>
          </div>

          <div class="mb-4">
            <label for="location" class="form-label fw-semibold">주차 위치</label>
            <input type="text" class="form-control" id="location" name="location"
              value="<c:out value='${vehicleAssignment != null ? vehicleAssignment.location : ""}'/>" />
          </div>

          <div class="d-flex justify-content-end gap-2">
            <a href="/admin/vehicleManagement" class="btn btn-secondary">
              <i class="bi bi-arrow-left"></i> 목록으로
            </a>
            <button type="submit" class="btn btn-primary">
              <i class="bi bi-check-circle"></i> 배정 완료
            </button>
          </div>

        </form>
      </div>
    </section>
  </main>

</body>
</html>
