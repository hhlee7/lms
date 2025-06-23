<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>관리자 대시보드</title>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body {
      background-color: #f9f9fb;
      font-family: 'Segoe UI', sans-serif;
    }
    .content-wrapper {
      margin-left: 240px;
      padding: 20px;
    }
    .card {
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

  <!-- 사이드바 -->
  <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

  <!-- 탑바 -->
  <jsp:include page="/WEB-INF/views/common/topbar.jsp" />

  <main class="main-content container mt-4">
  <!-- 메인 콘텐츠 -->
  <div class="content-wrapper">
    <h1 class="mb-4"><i class="bi bi-speedometer2"></i> 관리자 대시보드</h1>

    <div class="row">
      <div class="col-md-3">
        <div class="card text-white bg-primary">
          <div class="card-body">
            <h5 class="card-title">총 회원 수</h5>
            <p class="fs-4">${totalUserCount}</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card text-white bg-success">
          <div class="card-body">
            <h5 class="card-title">총 수업 수</h5>
            <p class="fs-4">${totalLectureCount}</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card text-white bg-warning">
          <div class="card-body">
            <h5 class="card-title">총 수강신청</h5>
            <p class="fs-4">${totalEnrollmentCount}</p>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card text-white bg-danger">
          <div class="card-body">
            <h5 class="card-title">오늘 앨범 등록</h5>
            <p class="fs-4">${todayAlbumCount}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- 최근 앨범 -->
    <div class="mt-4">
      <h4>최근 등록된 앨범</h4>
      <table class="table table-bordered mt-2">
        <thead class="table-light">
          <tr>
            <th>#</th>
            <th>제목</th>
            <th>과목</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="album" items="${recentAlbumList}">
            <tr>
              <td>${album.albumId}</td>
              <td><a href="/admin/albumOne?albumId=${album.albumId}">${album.title}</a></td>
              <td>${album.subjectName}</td>
              <td>${album.createdAt}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</main>
</body>
</html>
