<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>차량 관리</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">🚌 차량 관리</h2>
    </section>

    <!-- 차량 등록 버튼 -->
    <section class="d-flex justify-content-end mb-3">
      <a href="vehicleInsert" class="btn btn-success">
        <i class="bi bi-plus-circle"></i> 차량 등록
      </a>
    </section>

    <!-- 차량 없음 처리 -->
    <c:if test="${vehicleList == null || vehicleList.isEmpty()}">
      <div class="text-center text-muted fst-italic">등록된 차량이 없습니다.</div>
    </c:if>

    <!-- 차량 목록 테이블 -->
    <c:if test="${vehicleList != null && !vehicleList.isEmpty()}">
      <section class="table-responsive">
        <table class="table table-bordered table-hover bg-white shadow-sm">
          <thead class="table-light text-center">
            <tr>
              <th>#</th>
              <th>차량 번호</th>
              <th>정원</th>
              <th>기사님</th>
              <th>전화번호</th>
              <th>주차 위치</th>
              <th>차량 정보</th>
              <th>배정</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="vehicle" items="${vehicleList}">
              <tr>
                <td>${vehicle.vehicleId}</td>
                <td>${vehicle.vehicleNo}</td>
                <td>${vehicle.capacity}</td>
                <td>
                  <a href="userOne?userId=${vehicle.driverId}" class="text-decoration-none">${vehicle.driverName}</a>
                </td>
                <td>${vehicle.phone}</td>
                <td>${vehicle.location}</td>
                <td class="text-center">
                  <a href="vehicleModify?vehicleId=${vehicle.vehicleId}" class="btn btn-outline-primary btn-sm">
                    <i class="bi bi-pencil-square"></i> 수정
                  </a>
                </td>
                <td class="text-center">
                  <a href="vehicleAssignmentInsert?vehicleId=${vehicle.vehicleId}" class="btn btn-outline-success btn-sm">
                    <i class="bi bi-geo-alt"></i> 배정
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </section>
    </c:if>
  </main>

</body>
</html>
