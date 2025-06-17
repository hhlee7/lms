<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Q&A 관리</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>

  <script>
    $(document).ready(function () {
      function targetSearch() {
        const url = new URL(window.location.href);
        url.searchParams.set('page', 1);
        const searchWord = $('#searchWord').val();
        url.searchParams.set('searchWord', searchWord);
        location.href = url.toString();
      }

      $('#searchBtn').click(targetSearch);
      $('#searchWord').on('keypress', function(e) {
        if (e.which === 13) targetSearch();
      });
    });
  </script>
</head>
<body>

  <%@ include file="/WEB-INF/views/common/topbar.jsp" %>
  <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">📨 Q&A 관리</h2>
      <p class="text-danger">미응답 Q&A : <strong>${qnaCount}</strong> 개</p>
    </section>

    <!-- 검색 바 -->
    <section class="search-section mb-4">
      <form class="row gx-3 gy-2 align-items-center justify-content-center" onsubmit="return false;">
        <div class="col-md-5">
          <div class="input-group">
            <span class="input-group-text"><i class="bi bi-search"></i></span>
            <input type="text" id="searchWord" name="searchWord" value="${page.searchWord}" placeholder="질문 제목 검색" class="form-control" />
          </div>
        </div>
        <div class="col-md-auto">
          <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        </div>
      </form>
    </section>

    <!-- Q&A 리스트 -->
    <section class="table-responsive mb-4">
      <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-light text-center">
          <tr>
            <th>#</th>
            <th>질문자</th>
            <th>답변자</th>
            <th>질문</th>
            <th>작성일</th>
            <th>응답일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${qnaList}" var="qna">
            <tr>
              <td>${qna.qnaId}</td>
              <td><a href="userOne?userId=${qna.parentId}" class="text-decoration-none">${qna.parentId}</a></td>
              <td><a href="userOne?userId=${qna.adminId}" class="text-decoration-none">${qna.adminId}</a></td>
              <td><a href="qnaOne?qnaId=${qna.qnaId}" class="text-decoration-none fw-semibold">${qna.question}</a></td>
              <td>${qna.createdAt}</td>
              <td>
                <c:choose>
                  <c:when test="${not empty qna.answeredAt}">
                    ${qna.answeredAt}
                  </c:when>
                  <c:otherwise>
                    <span class="badge bg-warning text-dark">미응답</span>
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </section>

    <!-- 페이징 -->
    <section class="d-flex justify-content-center">
      <ul class="pagination pagination-sm">
        <c:if test="${page.prevGroup}">
          <li class="page-item">
            <a class="page-link" href="/admin/qnaManagement?page=${page.prevGroupPage}&searchWord=${page.searchWord}">«</a>
          </li>
        </c:if>

        <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
          <li class="page-item <c:if test='${i == page.currentPage}'>active</c:if>'">
            <a class="page-link" href="/admin/qnaManagement?page=${i}&searchWord=${page.searchWord}">${i}</a>
          </li>
        </c:forEach>

        <c:if test="${page.nextGroup}">
          <li class="page-item">
            <a class="page-link" href="/admin/qnaManagement?page=${page.nextGroupPage}&searchWord=${page.searchWord}">»</a>
          </li>
        </c:if>
      </ul>
    </section>
  </main>

</body>
</html>
