<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>앨범 관리</title>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <%@ include file="/WEB-INF/views/common/topbar.jsp" %>
  <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

  <main class="main-content container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h2 class="fw-bold">앨범 관리</h2>
      <div>
        <a href="/admin/main" class="btn btn-outline-dark me-2">메인 페이지</a>
        <a href="/admin/albumInsert" class="btn btn-primary">앨범 등록</a>
      </div>
    </div>

    <div class="table-responsive">
      <table class="table table-hover table-bordered align-middle">
        <thead class="table-light">
          <tr class="text-center">
            <th style="width: 5%;">#</th>
            <th style="width: 20%;">과목</th>
            <th>제목</th>
            <th style="width: 20%;">작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${albumList}" var="ab">
            <tr>
              <td class="text-center">${ab.albumId}</td>
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
  </main>

</body>
</html>
