<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 강사 만족도 평가 목록 조회 -->
<c:choose>
  <c:when test="${empty TeacherSatisfactionList}">
    <div class="text-center text-muted py-4">조회된 평가 목록이 없습니다.</div>
  </c:when>
  <c:otherwise>
    <div class="table-responsive">
      <table class="table table-hover table-bordered align-middle text-center">
        <thead class="table-light">
          <tr>
            <th>번호</th>
            <th>과목</th>
            <th>학생</th>
            <th>강사</th>
            <th>강사 평가 점수</th>
            <th>평가 일시</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="list" items="${TeacherSatisfactionList}">
            <tr>
              <td>${list.satisfactionId}</td>
              <td>${list.subjectName}</td>
              <td>${list.studentName}</td>
              <td>${list.teacherName}</td>
              <td>${list.ratingTeacher}</td>
              <td>${list.createAt}</td>
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
      <!-- 이전 그룹 이동 -->
      <c:if test="${page.prevGroup}">
        <li class="page-item">
          <a href="#" class="page-link paging" data-page="${page.prevGroupPage}">«</a>
        </li>
      </c:if>

      <!-- 페이지 번호 리스트 -->
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

      <!-- 다음 그룹 이동 -->
      <c:if test="${page.nextGroup}">
        <li class="page-item">
          <a href="#" class="page-link paging" data-page="${page.nextGroupPage}">»</a>
        </li>
      </c:if>
    </ul>
  </nav>
</div>