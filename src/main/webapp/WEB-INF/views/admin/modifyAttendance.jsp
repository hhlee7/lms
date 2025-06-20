<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>출결 수정</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<main class="main-content">
  <section class="mb-4 text-center">
    <h2 class="fw-bold">출결 수정</h2>
  </section>

  <section class="card shadow-sm mx-auto" style="max-width: 860px;">
    <div class="card-body">
      <form method="post" id="changeAttendanceStatus" action="/admin/changeAttendanceStatus">
        <input type="hidden" name="attendanceId" value="${attendance.attendanceId}">

        <div class="mb-3 row">
          <label class="col-sm-2 col-form-label fw-semibold">출결 번호</label>
          <div class="col-sm-10 pt-2">${attendance.attendanceId}</div>
        </div>

        <div class="mb-3 row">
          <label class="col-sm-2 col-form-label fw-semibold">학생 이름</label>
          <div class="col-sm-10 pt-2">${attendance.studentName}</div>
        </div>

        <div class="mb-3 row">
          <label class="col-sm-2 col-form-label fw-semibold">출결 일자</label>
          <div class="col-sm-10 pt-2">${attendance.attendDate}</div>
        </div>

        <div class="mb-3 row">
          <label for="status" class="col-sm-2 col-form-label fw-semibold">출결 상태</label>
          <div class="col-sm-10">
            <select name="status" id="status" class="form-select">
              <option value="출석" ${attendance.status == '출석' ? 'selected' : ''}>출석</option>
              <option value="지각" ${attendance.status == '지각' ? 'selected' : ''}>지각</option>
              <option value="결석" ${attendance.status == '결석' ? 'selected' : ''}>결석</option>
            </select>
          </div>
        </div>

        <div class="mb-3 row">
          <label class="col-sm-2 col-form-label fw-semibold">과목</label>
          <div class="col-sm-10 pt-2">${attendance.subjectName}</div>
        </div>

        <div class="mb-3 row">
          <label class="col-sm-2 col-form-label fw-semibold">수업 시작 시간</label>
          <div class="col-sm-10 pt-2">${attendance.startTime}</div>
        </div>

        <div class="mb-3 row">
          <label class="col-sm-2 col-form-label fw-semibold">요일</label>
          <div class="col-sm-10 pt-2">${attendance.dayOfWeek}</div>
        </div>

        <div class="mb-3 row">
          <label class="col-sm-2 col-form-label fw-semibold">강의실</label>
          <div class="col-sm-10 pt-2">${attendance.classroomName}</div>
        </div>

        <div class="mb-4 row">
          <label class="col-sm-2 col-form-label fw-semibold">강사</label>
          <div class="col-sm-10 pt-2">${attendance.teacherName}</div>
        </div>

        <div class="d-flex justify-content-end gap-2">
          <a href="/admin/attendanceManagement" class="btn btn-secondary">
            <i class="bi bi-arrow-left"></i> 목록으로
          </a>
          <button type="submit" class="btn btn-primary">
            <i class="bi bi-pencil-square"></i> 수정
          </button>
        </div>
      </form>
    </div>
  </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>