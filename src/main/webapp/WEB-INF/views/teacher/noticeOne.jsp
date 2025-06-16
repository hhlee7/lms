<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${notice.title}</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f9f9f9;
      padding: 40px;
      color: #333;
    }

    .notice-container {
      max-width: 800px;
      margin: 0 auto;
      background-color: #fff;
      padding: 30px 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    h2 {
      margin-bottom: 20px;
      color: #222;
    }

    .notice-meta {
      font-size: 14px;
      color: #777;
      margin-bottom: 15px;
    }

    .notice-meta strong {
      color: #444;
    }

    .notice-content {
      font-size: 16px;
      line-height: 1.6;
      white-space: pre-line;
      margin-top: 20px;
    }

    .back-link {
      display: inline-block;
      margin-top: 30px;
      text-decoration: none;
      color: #007bff;
      font-weight: bold;
    }

    .back-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="notice-container">
    <h2>${notice.title}</h2>
    <div class="notice-meta">
      <p><strong>작성자:</strong> ${notice.admin_id}</p>
      <p><strong>작성일:</strong> ${notice.created_at}</p>
    </div>
    <hr>
    <div class="notice-content">
      ${notice.content}
    </div>
    <a class="back-link" href="/teacher/notice/list">← 목록으로</a>
  </div>

</body>
</html>
