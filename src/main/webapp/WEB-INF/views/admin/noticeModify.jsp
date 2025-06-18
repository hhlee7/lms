<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항 수정</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">✏️ 공지사항 수정</h2>
    </section>

    <section class="card shadow-sm">
      <div class="card-body">
        <form action="noticeModify" method="post">
          <input type="hidden" name="noticeId" value="${notice.noticeId}" />

          <div class="mb-3">
            <label class="form-label fw-semibold">작성자</label>
            <div class="form-control bg-light">${notice.adminName}</div>
          </div>

          <div class="mb-3">
            <label for="targetRoleId" class="form-label fw-semibold">공지 대상</label>
            <select class="form-select" id="targetRoleId" name="targetRoleId" required>
              <c:forEach items="${roleList}" var="role">
                <option value="${role.roleId}" <c:if test="${notice.targetRoleId == role.roleId}">selected</c:if>>
                  ${role.roleName}
                </option>
              </c:forEach>
            </select>
          </div>

          <div class="mb-3">
            <label for="title" class="form-label fw-semibold">제목</label>
            <input type="text" class="form-control" name="title" id="title" value="${notice.title}" required />
          </div>

          <div class="mb-4">
            <label for="content" class="form-label fw-semibold">내용</label>
            <textarea class="form-control" name="content" id="content" rows="6" required>${notice.content}</textarea>
          </div>

          <div class="d-flex justify-content-end gap-2">
            <a href="noticeOne?noticeId=${notice.noticeId}" class="btn btn-secondary">
              <i class="bi bi-x-circle"></i> 취소
            </a>
            <button type="submit" class="btn btn-primary">
              <i class="bi bi-check-circle"></i> 수정 완료
            </button>
          </div>
        </form>
      </div>
    </section>
  </main>

</body>
</html>
