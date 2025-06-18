<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    background-color: #f9f9fb;
    font-family: 'Segoe UI', sans-serif;
  }

  .notice-detail-container {
    max-width: 800px;
    margin: 80px auto;
    padding: 40px 50px;
    background-color: white;
    border-radius: 16px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.06);
  }

  .notice-title {
    font-size: 2rem;
    font-weight: bold;
    color: #222;
    text-align: center;
    margin-bottom: 40px;
    border-bottom: 3px solid #007bff;
    padding-bottom: 12px;
  }

  .notice-meta {
    font-size: 0.95rem;
    color: #666;
    margin-bottom: 20px;
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #eee;
    padding-bottom: 12px;
  }

  .notice-content {
    white-space: pre-wrap;
    font-size: 1rem;
    line-height: 1.7;
    color: #333;
    margin-top: 30px;
    padding: 15px 20px;
    background: #f8f9fa;
    border-radius: 10px;
  }

  .btn-back {
    margin-top: 40px;
  }

</style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="notice-detail-container">
  <div class="notice-title">공지사항</div>

  <div class="notice-meta">
    <div><strong>번호:</strong> ${notice.noticeId}</div>
    <div><strong>작성자:</strong> 관리자</div>
    <div><strong>작성일:</strong> ${notice.createdAt}</div>
  </div>

  <h4 class="fw-semibold mb-3">${notice.title}</h4>

  <div class="notice-content">
    ${notice.content}
  </div>

  <div class="text-end btn-back">
    <a href="/driver/notice" class="btn btn-outline-primary">← 목록으로</a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
