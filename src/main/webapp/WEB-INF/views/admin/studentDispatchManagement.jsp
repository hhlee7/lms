<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>학생 배차 관리</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>

  <script>
    $(document).ready(function () {
      function targetSearch() {
        const selectedLecture = $('#targetLecture').val();
        const searchName = $('#searchName').val();
        const url = new URL(window.location.href);

        url.searchParams.set('lectureId', selectedLecture);
        url.searchParams.set('searchName', searchName);

        location.href = url.toString();
      }

      $('#searchBtn').click(targetSearch);
      $('#targetLecture').change(targetSearch);
    });
  </script>
</head>
<body>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">학생 배차 관리</h2>
    </section>

    <!-- 필터 -->
    <section class="search-section mb-4">
      <form class="row gy-2 gx-3 align-items-center justify-content-center" onsubmit="return false;">
        <div class="col-md-auto">
          <label for="targetLecture" class="form-label fw-semibold">수업 선택</label>
          <select id="targetLecture" name="targetLecture" class="form-select">
            <option value="">전체</option>
            <c:forEach items="${lectureList}" var="lec">
              <option value="${lec.lectureId}" <c:if test="${lectureId == lec.lectureId}">selected</c:if>>
                [${lec.subjectName}] ${lec.dayOfWeek}요일 ${lec.startTime} ~ ${lec.endTime}
              </option>
            </c:forEach>
          </select>
        </div>

        <div class="col-md-auto">
          <label for="searchName" class="form-label fw-semibold">이름 검색</label>
          <div class="input-group">
            <span class="input-group-text"><i class="bi bi-search"></i></span>
            <input type="text" name="searchName" id="searchName" class="form-control" value="${searchName}" placeholder="학생 이름" />
          </div>
        </div>

        <div class="col-md-auto mt-3 mt-md-4">
          <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        </div>
      </form>
    </section>

    <!-- 테이블 -->
    <section class="table-responsive mb-4">
      <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-light text-center">
          <tr>
            <th>이름</th>
            <th>학년</th>
            <th>차량번호</th>
            <th>기사님</th>
            <th>수업</th>
            <th>요일</th>
            <th>탑승시간</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="dp" items="${dispatchList}">
            <tr>
              <td><a href="userOne?userId=${dp.studentId}" class="text-decoration-none">${dp.studentName}</a></td>
              <td>${dp.grade}</td>
              <td>${dp.vehicleNo}</td>
              <td><a href="userOne?userId=${dp.driverId}" class="text-decoration-none">${dp.driverName}</a></td>
              <td>${dp.subjectName}</td>
              <td>${dp.dayOfWeek}</td>
              <td>${dp.endTime}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </section>
  </main>

</body>
</html>
