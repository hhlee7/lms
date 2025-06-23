<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>앨범 관리</title>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
  <style>
    .thumb-img {
      width: 80px;
      height: 60px;
      object-fit: cover;
      border-radius: 8px;
    }
  </style>

  <script>
    $(document).ready(function () {
      function targetSearch() {
        const selectedLecture = $('#targetLecture').val();
        const searchTitle = $('#searchTitle').val();
        const url = new URL(window.location.href);

        url.searchParams.set('searchType', selectedLecture);
        url.searchParams.set('searchWord', searchTitle);
        url.searchParams.set('currentPage', 1);

        location.href = url.toString();
      }

      $('#searchBtn').click(targetSearch);
      $('#targetLecture').change(targetSearch);
    });
  </script>
</head>
<body>

  <main class="main-content container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h2 class="fw-bold">앨범 관리</h2>
      <div>
        <a href="/admin/main" class="btn btn-outline-dark me-2">메인 페이지</a>
        <a href="/admin/albumInsert" class="btn btn-primary">앨범 등록</a>
      </div>
    </div>

    <!-- 🔍 필터 -->
    <section class="search-section mb-4">
      <form class="row gy-2 gx-3 align-items-center justify-content-center" onsubmit="return false;">
        <div class="col-md-auto">
          <label for="targetLecture" class="form-label fw-semibold">수업 선택</label>
          <select id="targetLecture" name="searchType" class="form-select">
            <option value="all">전체</option>
            <c:forEach items="${lectureList}" var="lec">
              <option value="${lec.lectureId}" <c:if test="${page.searchType eq lec.lectureId.toString()}">selected</c:if>>
				  [${lec.subjectName} ${lec.lectureId}기] ${lec.dayOfWeek}요일 ${lec.startTime} ~ ${lec.endTime}
				</option>
            </c:forEach>
          </select>
        </div>

        <div class="col-md-auto">
          <label for="searchTitle" class="form-label fw-semibold">제목 검색</label>
          <div class="input-group">
            <span class="input-group-text"><i class="bi bi-search"></i></span>
            <input type="text" name="searchWord" id="searchTitle" class="form-control"
                   value="${page.searchWord}" placeholder="제목 검색.." />
          </div>
        </div>

        <div class="col-md-auto mt-3 mt-md-4">
          <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        </div>
      </form>
    </section>

    <!-- 📷 앨범 목록 테이블 -->
    <div class="table-responsive">
      <table class="table table-hover table-bordered align-middle">
        <thead class="table-light">
          <tr class="text-center">
            <th style="width: 5%;">#</th>
            <th style="width: 15%;">썸네일</th>
            <th style="width: 15%;">과목</th>
            <th>제목</th>
            <th style="width: 20%;">작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${albumList}" var="ab">
            <tr>
              <td class="text-center">${ab.albumId}</td>
              <td class="text-center">
                <img src="/upload/${ab.filePath}" alt="썸네일"
                     class="thumb-img" />
              </td>
              <td class="text-center">${ab.subjectName}</td>
              <td>
                <a href="albumOne?albumId=${ab.albumId}" class="text-decoration-none fw-semibold text-primary">
                  ${ab.title}
                </a>
              </td>
              <td class="text-center">${ab.createdAt}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <!-- 📄 페이징 -->
    <nav class="mt-3">
      <ul class="pagination justify-content-center">
        <c:if test="${page.currentPage > 1}">
          <li class="page-item">
            <a class="page-link"
               href="?currentPage=${page.currentPage - 1}&searchType=${page.searchType}&searchWord=${page.searchWord}">이전</a>
          </li>
        </c:if>

        <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
          <li class="page-item ${page.currentPage == i ? 'active' : ''}">
            <a class="page-link"
               href="?currentPage=${i}&searchType=${page.searchType}&searchWord=${page.searchWord}">${i}</a>
          </li>
        </c:forEach>

        <c:if test="${page.currentPage < page.lastPage}">
          <li class="page-item">
            <a class="page-link"
               href="?currentPage=${page.currentPage + 1}&searchType=${page.searchType}&searchWord=${page.searchWord}">다음</a>
          </li>
        </c:if>
      </ul>
    </nav>

  </main>

</body>
</html>
