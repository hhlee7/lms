<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>강의실 등록</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
    $(document).ready(function () {
      $('#classroomName, #location, #capacity').on('input', function () {
        const id = $(this).attr('id');
        $('#' + id + 'Check').text('');
      });

      $('#classroomForm').submit(function (e) {
        const classroomName = $('#classroomName').val().trim();
        const location = $('#location').val().trim();
        const capacity = $('#capacity').val();

        if (classroomName === '') {
          $('#classroomNameCheck').css('color', 'red').text('강의실 이름을 입력하세요.');
          e.preventDefault();
          return;
        }

        if (location === '') {
          $('#locationCheck').css('color', 'red').text('강의실 위치를 입력하세요.');
          e.preventDefault();
          return;
        }

        if (capacity === '' || isNaN(capacity) || capacity <= 4) {
          $('#capacityCheck').css('color', 'red').text('수용 인원은 5명 이상이어야 합니다.');
          e.preventDefault();
          return;
        }
      });
    });
  </script>
</head>
<body>

<main class="main-content">
  <section class="mb-4 text-center">
    <h2 class="fw-bold">강의실 등록</h2>
  </section>

  <section class="card shadow-sm mx-auto" style="max-width: 600px;">
    <div class="card-body">
      <form method="post" name="classroomForm" id="classroomForm" action="/admin/createClassroom">
        <div class="mb-3">
          <label for="classroomName" class="form-label fw-semibold">강의실 이름</label>
          <input type="text" class="form-control" name="classroomName" id="classroomName" />
          <div id="classroomNameCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-3">
          <label for="location" class="form-label fw-semibold">위치</label>
          <input type="text" class="form-control" name="location" id="location" />
          <div id="locationCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-4">
          <label for="capacity" class="form-label fw-semibold">수용 인원</label>
          <input type="number" class="form-control" name="capacity" id="capacity" />
          <div id="capacityCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="d-flex justify-content-end gap-2">
          <a href="/admin/classroomManagement" class="btn btn-secondary">
            <i class="bi bi-arrow-left"></i> 목록으로
          </a>
          <button type="submit" class="btn btn-success">
            <i class="bi bi-check-circle"></i> 등록
          </button>
        </div>
      </form>
    </div>
  </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>