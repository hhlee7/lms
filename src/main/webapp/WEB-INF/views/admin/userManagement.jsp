<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>회원 관리</title>
	<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <script>
    $(document).ready(function () {
      function targetSearch() {
        const selectedRole = $('#targetRole').val();
        const url = new URL(window.location.href);
        url.searchParams.set('searchType', selectedRole);
        url.searchParams.set('page', 1);
        const searchWord = $('#searchName').val();
        url.searchParams.set('searchWord', searchWord);
        location.href = url.toString();
      }
      $('#searchBtn').click(targetSearch);
      $('#targetRole').change(targetSearch);
    });
  </script>
</head>
<body>



<!-- 📋 메인 콘텐츠 -->
<main class="main-content">
  <section class="text-center mb-4">
    <h2 class="fw-bold">회원 관리</h2>
  </section>

  <section class="mb-4">
    <a href="userInsert" class="btn btn-success">
      <i class="bi bi-plus-circle me-1"></i> 회원 추가
    </a>
  </section>

  <section class="search-section">
    <form class="row gy-2 gx-3 align-items-center" role="search" onsubmit="return false;">
      <div class="col-md-auto">
        <label for="targetRole" class="form-label fw-semibold">역할:</label>
        <select name="targetRole" id="targetRole" class="form-select">
          <option value="all" <c:if test="${param.searchType == 'all' || param.searchType == null}">selected</c:if>>전체</option>
          <c:forEach var="role" items="${roleList}">
            <option value="${role.roleName}" <c:if test="${param.searchType == role.roleName}">selected</c:if>>${role.roleName}</option>
          </c:forEach>
        </select>
      </div>
      <div class="col-md">
        <label for="searchName" class="form-label fw-semibold">이름:</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-search"></i></span>
          <input type="text" id="searchName" name="searchName" class="form-control" value="${page.searchWord}" placeholder="이름을 입력하세요" />
        </div>
      </div>
      <div class="col-md-auto mt-3 mt-md-4">
        <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
      </div>
    </form>
  </section>

  <section class="table-responsive mb-4">
    <table class="table table-bordered bg-white">
      <thead>
        <tr>
          <th>아이디</th>
          <th>역할</th>
          <th>이름</th>
          <th>전화번호</th>
          <th>가입일</th>
          <th>자세히</th>
        </tr>
      </thead>
      <tbody>
        <c:if test="${userList != null && !userList.isEmpty()}">
          <c:forEach var="us" items="${userList}">
            <tr>
              <td>${us.userId}</td>
              <td>${us.roleName}</td>
              <td>${us.userName}</td>
              <td>${us.phone}</td>
              <td>${us.createdAt}</td>
              <td>
                <a href="userOne?userId=${us.userId}" class="btn btn-outline-info btn-sm">
                  <i class="bi bi-eye-fill"></i>
                </a>
              </td>
            </tr>
          </c:forEach>
        </c:if>
        <c:if test="${userList == null || userList.isEmpty()}">
          <tr>
            <td colspan="9" class="text-center text-muted fst-italic">조회된 회원이 없습니다.</td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </section>

  <section class="d-flex justify-content-center">
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
  </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
