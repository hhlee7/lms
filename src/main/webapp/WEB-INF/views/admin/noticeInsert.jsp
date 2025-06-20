<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 등록</title>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f3f4f6;
    }

    .container {
      max-width: 720px;
      margin: 40px auto;
      background: white;
      padding: 30px;
      border-radius: 16px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
    }

    h1 {
      font-size: 1.875rem;
      font-weight: 700;
      text-align: center;
      margin-bottom: 30px;
      color: #111827;
    }

    .form-label {
      font-weight: 600;
      margin-bottom: 6px;
      color: #374151;
    }

    .form-control, .form-select, textarea {
      border-radius: 10px;
      padding: 10px 14px;
      border: 1px solid #cbd5e1;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .btn-primary {
      background-color: #3b82f6;
      border: none;
      border-radius: 10px;
      padding: 12px 20px;
      font-weight: 600;
    }

    .btn-primary:hover {
      background-color: #2563eb;
    }

    a.back-link {
      display: block;
      margin-top: 20px;
      text-align: center;
      color: #6b7280;
    }

    a.back-link:hover {
      text-decoration: underline;
      color: #374151;
    }
  </style>
</head>
<body>
  <main class="main-content">
    <div class="container">
      <h1>공지사항 등록</h1>
      <form action="noticeInsert" method="post">
        <input type="hidden" name="adminId" id="adminId" value="${loginUser.userId}" />

        <div class="form-group">
          <label class="form-label">작성자</label>
          <input type="text" class="form-control" value="${loginUser.userName}" readonly />
        </div>

        <div class="form-group">
          <label for="targetRoleId" class="form-label">대상</label>
          <select id="targetRoleId" name="targetRoleId" class="form-select">
            <c:forEach items="${roleList}" var="role">
              <option value="${role.roleId}">${role.roleName}</option>
            </c:forEach>
          </select>
        </div>

        <div class="form-group">
          <label for="title" class="form-label">제목</label>
          <input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요.">
        </div>

        <div class="form-group">
          <label for="content" class="form-label">내용</label>
          <textarea id="content" name="content" rows="5" class="form-control" placeholder="내용을 입력해주세요."></textarea>
        </div>

        <div class="text-center">
          <button type="submit" class="btn btn-primary">작성</button>
        </div>
      </form>
      <a href="/admin/noticeManagement" class="back-link">뒤로가기</a>
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
