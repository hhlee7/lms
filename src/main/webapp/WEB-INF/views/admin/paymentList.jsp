<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>수강료 납부 내역</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
    $(document).ready(function () {
      function targetSearch() {
        const selectedSubject = $('#targetSubject').val();
        const searchWord = $('#searchWord').val();
        const url = new URL(window.location.href);

        url.searchParams.set('searchType', selectedSubject);
        url.searchParams.set('searchWord', searchWord);
        url.searchParams.set('page', 1);

        location.href = url.toString();
      }

      $('#targetSubject').change(targetSearch);
      $('#searchBtn').click(targetSearch);
    });
  </script>
</head>
<body>

<main class="main-content">
  <section class="text-center mb-4">
    <h2 class="fw-bold">수강료 납부 내역</h2>
  </section>

  <section class="search-section">
    <form class="row gy-2 gx-3 align-items-center" onsubmit="return false;">
      <div class="col-md-auto">
        <label for="targetSubject" class="form-label fw-semibold">과목 선택</label>
        <select name="targetSubject" id="targetSubject" class="form-select">
          <option value="all" ${param.searchType == 'all' ? 'selected' : ''}>전체</option>
          <c:forEach var="subject" items="${subjectList}">
            <option value="${subject.subjectName}" <c:if test="${param.searchType == subject.subjectName}">selected</c:if>>
              ${subject.subjectName}
            </option>
          </c:forEach>
        </select>
      </div>
      <div class="col-md">
        <label for="searchWord" class="form-label fw-semibold">이름</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-search"></i></span>
          <input type="text" id="searchWord" name="searchWord" class="form-control"
            value="${page.searchWord != null ? page.searchWord : ''}" placeholder="이름을 입력하세요" />
          <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
        </div>
      </div>
    </form>
  </section>

  <section class="table-responsive mb-4">
    <c:choose>
      <c:when test="${empty paymentList}">
        <p class="text-center text-muted fst-italic">조회된 수강료 납부 내역이 없습니다.</p>
      </c:when>
      <c:otherwise>
        <table class="table table-bordered bg-white text-center">
          <thead>
            <tr>
              <th>번호</th>
              <th>과목</th>
              <th>이름</th>
              <th>금액</th>
              <th>납부 일시</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="list" items="${paymentList}">
              <tr>
                <td>${list.paymentId}</td>
                <td>${list.subjectName}</td>
                <td>${list.studentName}</td>
                <td><fmt:formatNumber value="${list.amount}" type="number" />원</td>
                <td>${list.paidAt}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:otherwise>
    </c:choose>
  </section>

  <section class="d-flex justify-content-center mt-4">
    <nav>
      <ul class="pagination pagination-sm">
        <c:if test="${page.prevGroup}">
          <li class="page-item">
            <a class="page-link" href="?page=${page.prevGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">&laquo;</a>
          </li>
        </c:if>
        <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
          <li class="page-item <c:if test='${i == page.currentPage}'>active</c:if>">
            <a class="page-link" href="?page=${i}&searchWord=${page.searchWord}&searchType=${page.searchType}">${i}</a>
          </li>
        </c:forEach>
        <c:if test="${page.nextGroup}">
          <li class="page-item">
            <a class="page-link" href="?page=${page.nextGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">&raquo;</a>
          </li>
        </c:if>
      </ul>
    </nav>
  </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>