<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>앨범 상세</title>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <main class="main-content container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="fw-bold">앨범 상세</h2>
      <a href="/admin/albumManagement" class="btn btn-secondary">뒤로가기</a>
    </div>

    <c:if test="${album != null}">
      <table class="table table-bordered">
        <tr>
          <th style="width: 15%;">제목</th>
          <td>${album.title}</td>
        </tr>
        <tr>
          <th>과목</th>
          <td>${album.subjectName}</td>
        </tr>
        <tr>
          <th>설명</th>
          <td>${album.description}</td>
        </tr>
        <tr>
          <th>작성일</th>
          <td>${album.createdAt}</td>
        </tr>
      </table>
    </c:if>

    <c:if test="${photoList != null && not empty photoList}">
      <div class="row g-3 mt-4">
        <c:forEach items="${photoList}" var="photo">
          <div class="col-6 col-md-4 col-lg-3">
            <div class="card h-100 shadow-sm">
              <img src="${photo.filePath}" class="card-img-top" alt="앨범 이미지">
            </div>
          </div>
        </c:forEach>
      </div>
    </c:if>
  </main>

</body>
</html>
