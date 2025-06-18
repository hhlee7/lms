<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>교보재 수정</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function () {
      $('#materialTitle, #totalCount').on('input', function () {
        $('#' + this.id + 'Check').text('');
      });

      $('#materialForm').submit(function (e) {
        const title = $('#materialTitle').val().trim();
        const total = $('#totalCount').val();

        if (title === '') {
          $('#materialTitleCheck').text('품목을 입력하세요.').css('color', 'red');
          e.preventDefault();
        }

        if (total === '' || isNaN(total) || total <= 0) {
          $('#totalCountCheck').text('개수는 1개 이상이어야 합니다.').css('color', 'red');
          e.preventDefault();
        }
      });
    });
  </script>
</head>
<body>
<main class="main-content">
  <section class="mb-4 text-center">
    <h2 class="fw-bold">교보재 수정</h2>
  </section>

  <section class="card shadow-sm mx-auto" style="max-width: 600px;">
    <div class="card-body">
      <form method="post" name="materialForm" id="materialForm" action="/admin/modifyMaterial">
        <input type="hidden" name="materialId" value="${material.materialId}">

        <div class="mb-3">
          <label for="lectureId" class="form-label fw-semibold">수업 선택</label>
          <select class="form-select" name="lectureId" id="lectureId">
            <c:forEach var="list" items="${list}">
              <option value="${list.lectureId}" <c:if test="${list.lectureId == material.lectureId}">selected</c:if>>
                ${list.lectureId}(${list.subjectName})
              </option>
            </c:forEach>
          </select>
        </div>

        <div class="mb-3">
          <label for="materialTitle" class="form-label fw-semibold">품목</label>
          <input type="text" class="form-control" name="materialTitle" id="materialTitle" value="${material.materialTitle}">
          <div id="materialTitleCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-4">
          <label for="totalCount" class="form-label fw-semibold">개수</label>
          <input type="number" class="form-control" name="totalCount" id="totalCount" value="${material.totalCount}">
          <div id="totalCountCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="d-flex justify-content-end gap-2">
          <a href="/admin/materialManagement" class="btn btn-secondary">
            <i class="bi bi-arrow-left"></i> 목록으로
          </a>
          <button type="submit" class="btn btn-primary">
            <i class="bi bi-check-circle"></i> 수정
          </button>
        </div>
      </form>
    </div>
  </section>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>