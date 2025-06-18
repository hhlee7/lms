<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항 상세</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <main class="main-content">
    <section class="mb-4">
      <h2 class="fw-bold text-center">📌 공지사항 상세</h2>
    </section>

    <section class="card shadow-sm mb-4">
      <div class="card-body">
        <div class="mb-3">
          <label class="fw-semibold">제목</label>
          <div class="form-control bg-light">${notice.title}</div>
        </div>

        <div class="mb-3 row">
          <div class="col-md-6">
            <label class="fw-semibold">작성자</label>
            <div class="form-control bg-light">${notice.adminName}</div>
          </div>
          <div class="col-md-6">
            <label class="fw-semibold">공지 대상</label>
            <div class="form-control bg-light">${notice.roleName}</div>
          </div>
        </div>

        <div class="mb-3">
          <label class="fw-semibold">내용</label>
          <textarea class="form-control" rows="6" readonly>${notice.content}</textarea>
        </div>

        <div class="mb-3">
          <label class="fw-semibold">작성일</label>
          <div class="form-control bg-light">${notice.createdAt}</div>
        </div>
      </div>
    </section>

    <div class="d-flex justify-content-end gap-2">
      <a href="/admin/noticeModify?noticeId=${notice.noticeId}" class="btn btn-outline-primary">
        <i class="bi bi-pencil-square"></i> 수정
      </a>
      <a href="/admin/noticeManagement" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> 목록으로
      </a>
    </div>
  </main>

</body>
</html>
