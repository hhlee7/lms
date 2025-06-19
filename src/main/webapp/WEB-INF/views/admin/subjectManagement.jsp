<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>과목 관리</title>
</head>
<body>
<main class="main-content">

  <section class="text-center mb-4">
    <h2 class="fw-bold">과목 관리</h2>
  </section>

  <section class="mb-4">
    <a href="/admin/createSubject" class="btn btn-success">
      <i class="bi bi-plus-circle me-1"></i> 과목 등록
    </a>
  </section>

  <section class="table-responsive mb-4">
    <table class="table table-bordered text-center mb-0">
      <thead class="table-light">
        <tr>
          <th>번호</th>
          <th>과목</th>
          <th>수정</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:if test="${not empty subjectList}">
          <c:forEach var="subject" items="${subjectList}">
            <tr>
              <td>${subject.subjectId}</td>
              <td>${subject.subjectName}</td>
              <td>
                <a href="/admin/modifySubject?subjectId=${subject.subjectId}" class="btn btn-outline-primary btn-sm">
                  <i class="bi bi-pencil-square"></i> 수정
                </a>
              </td>
              <td>
                <form method="post" action="/admin/removeSubject" onsubmit="return confirm('정말 삭제하시겠습니까?')">
                  <input type="hidden" name="subjectId" value="${subject.subjectId}">
                  <button type="submit" class="btn btn-outline-danger btn-sm">
                    <i class="bi bi-trash3"></i> 삭제
                  </button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </c:if>
        <c:if test="${empty subjectList}">
          <tr>
            <td colspan="4" class="text-center text-muted fst-italic">조회된 과목이 없습니다.</td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </section>

</main>
</body>
</html>