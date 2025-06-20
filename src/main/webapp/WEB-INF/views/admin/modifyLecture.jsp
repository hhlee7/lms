<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>수업 수정</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#recruited, #amount, #startTime, #endTime, #startDate, #endDate').on('input change', function() {
        const id = $(this).attr('id');
        $('#' + id + 'Check').text('');
      });

      $('#lectureForm').submit(function(e) {
        const recruited = $('#recruited').val();
        const amount = $('#amount').val();
        const startTime = $('#startTime').val();
        const endTime = $('#endTime').val();
        const startDate = $('#startDate').val();
        const endDate = $('#endDate').val();

        if (recruited == '' || isNaN(recruited) || recruited <= 4) {
          $('#recruitedCheck').text('정원은 5명 이상이어야 합니다.');
          e.preventDefault(); return;
        }
        if (amount == '' || isNaN(amount) || amount < 0) {
          $('#amountCheck').text('금액은 0원 이상이어야 합니다.');
          e.preventDefault(); return;
        }
        if (startTime == '') {
          $('#startTimeCheck').text('시작 시간을 입력하세요.');
          e.preventDefault(); return;
        }
        if (endTime == '') {
          $('#endTimeCheck').text('종료 시간을 입력하세요.');
          e.preventDefault(); return;
        }
        if (startTime > endTime) {
          $('#startTimeCheck').text('시작 시간은 종료 시간보다 빨라야 합니다.');
          e.preventDefault(); return;
        }
        if (startDate == '') {
          $('#startDateCheck').text('개강일을 입력하세요.');
          e.preventDefault(); return;
        }
        if (endDate == '') {
          $('#endDateCheck').text('종강일을 입력하세요.');
          e.preventDefault(); return;
        }
        if (startDate > endDate) {
          $('#startDateCheck').text('개강일은 종강일보다 빠르거나 같아야 합니다.');
          e.preventDefault(); return;
        }
      });
    });
  </script>
</head>
<body>
<main class="main-content">
  <section class="mb-4 text-center">
    <h2 class="fw-bold">수업 수정</h2>
  </section>

  <section class="card shadow-sm mx-auto" style="max-width: 720px;">
    <div class="card-body">
      <form method="post" id="lectureForm" action="/admin/modifyLecture">
        <input type="hidden" name="lectureId" value="${lecture.lectureId}">

        <div class="mb-3">
          <label for="subjectId" class="form-label fw-semibold">과목</label>
          <select name="subjectId" id="subjectId" class="form-select">
            <c:forEach var="subject" items="${subjectList}">
              <option value="${subject.subjectId}" <c:if test="${subject.subjectId == lecture.subjectId}">selected</c:if>>${subject.subjectName}</option>
            </c:forEach>
          </select>
        </div>

        <div class="mb-3">
          <label for="teacherId" class="form-label fw-semibold">강사</label>
          <select name="teacherId" id="teacherId" class="form-select">
            <c:forEach var="teacher" items="${teacherList}">
              <option value="${teacher.userId}" <c:if test="${teacher.userId == teacherId.teacherId}">selected</c:if>>${teacher.userName}(${teacher.subjectName})</option>
            </c:forEach>
          </select>
        </div>

        <div class="mb-3">
          <label for="classroomId" class="form-label fw-semibold">강의실</label>
          <select name="classroomId" id="classroomId" class="form-select">
            <c:forEach var="classroom" items="${classroomList}">
              <option value="${classroom.classroomId}" <c:if test="${classroom.classroomId == lecture.classroomId}">selected</c:if>>${classroom.classroomName}</option>
            </c:forEach>
          </select>
        </div>

        <div class="mb-3">
          <label for="recruited" class="form-label fw-semibold">정원</label>
          <input type="number" name="recruited" id="recruited" value="${lecture.recruited}" class="form-control">
          <div id="recruitedCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-3">
          <label for="amount" class="form-label fw-semibold">금액</label>
          <input type="number" name="amount" id="amount" value="${lecture.amount}" class="form-control">
          <div id="amountCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-3">
          <label for="startTime" class="form-label fw-semibold">시작 시간</label>
          <input type="time" name="startTime" id="startTime" value="${lecture.startTime}" class="form-control">
          <div id="startTimeCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-3">
          <label for="endTime" class="form-label fw-semibold">종료 시간</label>
          <input type="time" name="endTime" id="endTime" value="${lecture.endTime}" class="form-control">
          <div id="endTimeCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-3">
          <label for="dayOfWeek" class="form-label fw-semibold">요일</label>
          <select name="dayOfWeek" id="dayOfWeek" class="form-select">
            <option value="월" <c:if test="${lecture.dayOfWeek == '월'}">selected</c:if>>월요일</option>
            <option value="화" <c:if test="${lecture.dayOfWeek == '화'}">selected</c:if>>화요일</option>
            <option value="수" <c:if test="${lecture.dayOfWeek == '수'}">selected</c:if>>수요일</option>
            <option value="목" <c:if test="${lecture.dayOfWeek == '목'}">selected</c:if>>목요일</option>
            <option value="금" <c:if test="${lecture.dayOfWeek == '금'}">selected</c:if>>금요일</option>
          </select>
        </div>

        <div class="mb-3">
          <label for="startDate" class="form-label fw-semibold">개강일</label>
          <input type="date" name="startDate" id="startDate" value="${lecture.startDate}" class="form-control">
          <div id="startDateCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-3">
          <label for="endDate" class="form-label fw-semibold">종강일</label>
          <input type="date" name="endDate" id="endDate" value="${lecture.endDate}" class="form-control">
          <div id="endDateCheck" class="text-danger small mt-1"></div>
        </div>

        <div class="mb-4">
          <label for="assignmentId" class="form-label fw-semibold">배차</label>
          <select name="assignmentId" id="assignmentId" class="form-select">
            <option value="">없음</option>
            <c:forEach var="va" items="${vehicleAssignmentList}">
              <option value="${va.assignmentId}" <c:if test="${va.assignmentId == vehicleAssignment.assignmentId}">selected</c:if>>${va.assignmentId} (${va.vehicleNo}/${va.driverName}/${va.location})</option>
            </c:forEach>
          </select>
        </div>

        <div class="d-flex justify-content-end gap-2">
          <a href="/admin/lectureManagement" class="btn btn-secondary">
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