<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Q&A 상세</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">💬 Q&A 상세</h2>
    </section>

    <section class="card shadow-sm mb-4">
      <div class="card-body">
        <form action="qnaAnswer" method="post" id="qna">
          <input type="hidden" name="qnaId" value="${qna.qnaId}" />
          <input type="hidden" name="adminId" value="${loginUser.userId}" />

          <div class="mb-3">
            <label class="form-label fw-semibold">질문 제목</label>
            <div class="form-control bg-light">${qna.question}</div>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">작성자</label>
            <div class="form-control bg-light">${qna.parentId}</div>
          </div>

          <div class="mb-4">
            <label for="answer" class="form-label fw-semibold">답변</label>
            <textarea class="form-control" name="answer" id="answer" rows="6" placeholder="답변을 입력하세요...">${qna.answer}</textarea>
          </div>

          <div class="d-flex justify-content-end gap-2">
            <a href="qnaManagement" class="btn btn-secondary">
              <i class="bi bi-arrow-left"></i> 목록으로
            </a>
            <button type="submit" class="btn btn-primary">
              <i class="bi bi-check-circle"></i> 답변 저장
            </button>
          </div>
        </form>
      </div>
    </section>
  </main>

</body>
</html>
