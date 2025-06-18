<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>과목 수정</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
    $(document).ready(function () {
      $('#subjectName').on('input', function () {
        if ($(this).val().trim() !== '') {
          $('#checkSubject').text('');
        }
      });

      $('#description').on('input', function () {
        if ($(this).val().trim() !== '') {
          $('#checkDescription').text('');
        }
      });

      $('#subjectForm').submit(function (e) {
        const subjectName = $('#subjectName').val().trim();
        const description = $('#description').val().trim();

        if (subjectName === '') {
          $('#checkSubject').css('color', 'red').text('과목 이름을 입력하세요.');
          e.preventDefault();
        }

        if (description === '') {
          $('#checkDescription').css('color', 'red').text('과목 소개를 입력하세요.');
          e.preventDefault();
        }
      });
    });
  </script>
</head>
<body>

<main class="main-content">
  <section class="mb-4 text-center">
    <h2 class="fw-bold">과목 수정</h2>
  </section>

  <section class="card shadow-sm mx-auto" style="max-width: 600px;">
    <div class="card-body">
      <form method="post" id="subjectForm" action="/admin/modifySubject">
        <input type="hidden" name="subjectId" value="${subject.subjectId}" />

        <div class="mb-3">
          <label for="subjectName" class="form-label fw-semibold">과목 이름</label>
          <input type="text" class="form-control" id="subjectName" name="subjectName" value="${subject.subjectName}" />
          <div id="checkSubject" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-4">
          <label for="description" class="form-label fw-semibold">과목 소개</label>
          <textarea class="form-control" rows="5" id="description" name="description">${subject.description}</textarea>
          <div id="checkDescription" class="text-danger small mt-1"></div>
        </div>

        <div class="d-flex justify-content-end gap-2">
          <a href="/admin/subjectManagement" class="btn btn-secondary">
            <i class="bi bi-arrow-left"></i> 목록으로
          </a>
          <button type="submit" class="btn btn-primary">
            <i class="bi bi-check-circle"></i> 수정 완료
          </button>
        </div>
      </form>
    </div>
  </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>