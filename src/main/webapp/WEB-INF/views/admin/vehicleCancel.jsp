<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>배차 취소 조회</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>

  <script>
    $(document).ready(function () {
      function targetSearch() {
        const searchDate = $('#searchDate').val();
        const searchName = $('#searchWord').val();
        const url = new URL(window.location.href);

        if (searchDate !== '') {
          url.searchParams.set('searchDate', searchDate);
        }
        url.searchParams.set('searchName', searchName);

        location.href = url.toString();
      }

      $('#searchBtn').click(targetSearch);
      $('#searchDate').change(targetSearch);
    });
  </script>
</head>
<body>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">배차 취소 관리</h2>
    </section>

    <!-- 검색 필터 -->
    <section class="search-section mb-4">
      <form class="row gy-2 gx-3 align-items-center justify-content-center" onsubmit="return false;">
        <div class="col-md-auto">
          <label for="searchDate" class="form-label fw-semibold">날짜 선택</label>
          <input type="date" id="searchDate" name="searchDate" class="form-control" value="${param.searchDate}" />
        </div>

        <div class="col-md-auto">
          <label for="searchWord" class="form-label fw-semibold">학생 이름</label>
          <div class="input-group">
            <span class="input-group-text"><i class="bi bi-search"></i></span>
            <input type="text" name="searchWord" id="searchWord" class="form-control" value="${param.searchName}" />
          </div>
        </div>

        <div class="col-md-auto mt-3 mt-md-4">
          <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        </div>
      </form>
    </section>

    <!-- 취소 목록 테이블 -->
    <section class="table-responsive mb-4">
      <c:if test="${cancelList != null && !cancelList.isEmpty()}">
        <table class="table table-bordered table-hover bg-white shadow-sm">
          <thead class="table-light text-center">
            <tr>
              <th>학생</th>
              <th>과목</th>
              <th>사유</th>
              <th>요일</th>
              <th>취소 시간</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="can" items="${cancelList}">
              <tr>
                <td>${can.studentName}</td>
                <td>${can.subjectName}</td>
                <td>${can.cancelReason}</td>
                <td>${can.dayOfWeek}</td>
                <td>${can.decidedAt}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
      <c:if test="${cancelList == null || cancelList.isEmpty()}">
        <div class="text-center text-muted fst-italic">취소된 배차 내역이 없습니다.</div>
      </c:if>
    </section>

    <!-- 페이징 -->
    <section class="d-flex justify-content-center">
      <ul class="pagination pagination-sm">
        <c:if test="${page.prevGroup}">
          <li class="page-item">
            <a class="page-link" href="?page=${page.prevGroupPage}&searchName=${param.searchName}&searchDate=${param.searchDate}">«</a>
          </li>
        </c:if>

        <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
          <li class="page-item <c:if test='${i == page.currentPage}'>active</c:if>">
            <a class="page-link" href="?page=${i}&searchName=${param.searchName}&searchDate=${param.searchDate}">${i}</a>
          </li>
        </c:forEach>

        <c:if test="${page.nextGroup}">
          <li class="page-item">
            <a class="page-link" href="?page=${page.nextGroupPage}&searchName=${param.searchName}&searchDate=${param.searchDate}">»</a>
          </li>
        </c:if>
      </ul>
    </section>
  </main>

</body>
</html>
