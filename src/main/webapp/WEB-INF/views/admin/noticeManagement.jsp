<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		
		function targetSearch(){
			const selectedRole = $('#targetRole').val();
			const url = new URL(window.location.href);
			
			url.searchParams.set('searchType', selectedRole);
			url.searchParams.set('page', 1); // 페이지 리셋

			// 검색 조건도 유지하고 싶다면 다음도 함께 포함
			const searchWord = $('#searchWord').val();
			const searchType = url.searchParams.get("searchType") || "title";
			url.searchParams.set("searchWord", searchWord);
			url.searchParams.set("searchType", searchType);

			location.href = url.toString();
		}
		
		$('#searchBtn').click(targetSearch);
		
		$('#targetRole').change(targetSearch);
	});
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
	
	<main class="main-content">
  <section class="mb-4 text-center">
    <h2 class="fw-bold">공지사항 관리</h2>
  </section>

  <!-- 검색 바 + 역할 선택 -->
  <section class="search-section mb-4">
    <form class="row gy-2 gx-3 align-items-center justify-content-center" onsubmit="return false;">
      <div class="col-md-auto">
        <select name="targetRole" id="targetRole" class="form-select">
          <option value="all" <c:if test="${param.searchType == 'all' || param.searchType == null}">selected</c:if>>전체</option>
          <c:forEach var="role" items="${roleList}">
            <option value="${role.roleName}" <c:if test="${param.searchType == role.roleName}">selected</c:if>>${role.roleName}</option>
          </c:forEach>
        </select>
      </div>
      <div class="col-md">
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-search"></i></span>
          <input type="text" name="searchWord" id="searchWord" class="form-control" value="${page.searchWord}" placeholder="제목 검색..." />
        </div>
      </div>
      <div class="col-md-auto">
        <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
      </div>
    </form>
  </section>

  <!-- 공지사항 리스트 -->
  <section class="table-responsive mb-4">
    <c:if test="${noticeList == null || noticeList.isEmpty()}">
      <div class="text-center text-muted fst-italic">공지사항이 없습니다.</div>
    </c:if>

    <c:if test="${noticeList != null && !noticeList.isEmpty()}">
      <table class="table table-bordered bg-white shadow-sm">
        <thead class="table-light text-center">
          <tr>
            <th style="width: 10%;">#</th>
            <th>제목</th>
            <th style="width: 20%;">대상</th>
            <th style="width: 20%;">작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="nt" items="${noticeList}">
            <tr>
              <td>${nt.noticeId}</td>
              <td class="text-start">
                <a href="noticeOne?noticeId=${nt.noticeId}" class="text-decoration-none text-dark fw-semibold">
                  ${nt.title}
                </a>
              </td>
              <td>${nt.roleName}</td>
              <td>${nt.createdAt}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:if>
  </section>

  <!-- 페이징 -->
  <section class="d-flex justify-content-center">
    <ul class="pagination pagination-sm">
      <c:if test="${page.prevGroup}">
        <li class="page-item">
          <a class="page-link" href="/noticeManagement?page=${page.prevGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">«</a>
        </li>
      </c:if>

      <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
        <li class="page-item <c:if test='${i == page.currentPage}'>active</c:if>">
          <a class="page-link" href="/noticeManagement?page=${i}&searchWord=${page.searchWord}&searchType=${page.searchType}">${i}</a>
        </li>
      </c:forEach>

      <c:if test="${page.nextGroup}">
        <li class="page-item">
          <a class="page-link" href="/noticeManagement?page=${page.nextGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">»</a>
        </li>
      </c:if>
    </ul>
  </section>
</main>

</body>
</html>