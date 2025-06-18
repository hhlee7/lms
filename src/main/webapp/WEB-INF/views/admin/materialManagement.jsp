<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>교보재 관리</title>
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
    <h2 class="fw-bold">교보재 관리</h2>
  </section>

  <section class="mb-4">
    <a href="/admin/createMaterial" class="btn btn-success">
      <i class="bi bi-plus-circle"></i> 교보재 등록
    </a>
  </section>

  <section class="search-section mb-3">
    <form class="row gy-2 gx-3 align-items-center" onsubmit="return false;">
      <div class="col-md-auto">
        <label for="targetSubject" class="form-label fw-semibold">과목 선택</label>
        <select id="targetSubject" name="targetSubject" class="form-select">
          <option value="all" ${param.searchType == 'all' ? 'selected' : ''}>전체</option>
          <c:forEach var="subject" items="${subjectList}">
            <option value="${subject.subjectName}" <c:if test="${param.searchType == subject.subjectName}">selected</c:if>>
              ${subject.subjectName}
            </option>
          </c:forEach>
        </select>
      </div>

      <div class="col-md">
        <label for="searchWord" class="form-label fw-semibold">품목</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-search"></i></span>
          <input type="text" name="searchWord" id="searchWord" class="form-control"
                 value="${page.searchWord != null ? page.searchWord : ''}" placeholder="품목명 입력" />
          <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
        </div>
      </div>
    </form>
  </section>

  <section class="table-responsive">
    <c:choose>
      <c:when test="${empty materialList}">
        <p class="text-center text-muted fst-italic">조회된 교보재 목록이 없습니다.</p>
      </c:when>
      <c:otherwise>
        <table class="table table-bordered text-center align-middle bg-white">
          <thead class="table-light">
            <tr>
              <th>번호</th>
              <th>과목</th>
              <th>품목</th>
              <th>개수</th>
              <th>요일</th>
              <th>시작 시간</th>
              <th>수정</th>
              <th>삭제</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="list" items="${materialList}">
              <tr>
                <td>${list.materialId}</td>
                <td>${list.subjectName}</td>
                <td>${list.materialTitle}</td>
                <td>${list.totalCount}</td>
                <td>${list.dayOfWeek}</td>
                <td>${list.startTime}</td>
                <td>
                  <a href="/admin/modifyMaterial?materialId=${list.materialId}" class="btn btn-outline-primary btn-sm">
                    <i class="bi bi-pencil-square"></i> 수정
                  </a>
                </td>
                <td>
                  <form method="post" action="/admin/removeMaterial" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="materialId" value="${list.materialId}">
                    <button type="submit" class="btn btn-outline-danger btn-sm">
                      <i class="bi bi-trash"></i> 삭제
                    </button>
                  </form>
                </td>
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