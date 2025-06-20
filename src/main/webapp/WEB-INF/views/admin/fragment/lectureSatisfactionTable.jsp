<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 수업 만족도 평가 및 리뷰 목록 조회 -->
<c:choose>
  <c:when test="${empty LectureSatisfactionList}">
    <div class="text-center text-muted py-4">조회된 평가 목록이 없습니다.</div>
  </c:when>
  <c:otherwise>
    <div class="table-responsive">
      <table class="table table-hover table-bordered align-middle text-center">
        <thead class="table-light">
          <tr>
            <th>번호</th>
            <th>수업</th>
            <th>학생</th>
            <th>수업 평가 점수</th>
            <th>평가 일시</th>
            <th>리뷰</th>
            <th>리뷰 작성 일시</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="list" items="${LectureSatisfactionList}">
            <tr>
              <td>${list.satisfactionId}</td>
              <td>${list.subjectName} ${list.lectureId}기</td>
              <td>${list.studentName}</td>
              <td>${list.ratingLecture}</td>
              <td>${list.createAt}</td>
              <td class="text-start">${list.content}</td>
              <td>${list.reivewCreateAt}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </c:otherwise>
</c:choose>

<!-- 페이지 그룹 이동 및 번호 출력 -->
<div class="d-flex justify-content-center my-3">
  <nav>
    <ul class="pagination pagination-sm mb-0">
      <c:if test="${page.prevGroup}">
        <li class="page-item">
          <a href="#" class="page-link paging" data-page="${page.prevGroupPage}">«</a>
        </li>
      </c:if>

      <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
        <c:choose>
          <c:when test="${i == page.currentPage}">
            <li class="page-item active">
              <span class="page-link">${i}</span>
            </li>
          </c:when>
          <c:otherwise>
            <li class="page-item">
              <a href="#" class="page-link paging" data-page="${i}">${i}</a>
            </li>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <c:if test="${page.nextGroup}">
        <li class="page-item">
          <a href="#" class="page-link paging" data-page="${page.nextGroupPage}">»</a>
        </li>
      </c:if>
    </ul>
  </nav>
</div>