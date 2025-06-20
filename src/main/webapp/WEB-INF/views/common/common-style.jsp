<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

    <!-- 공통 스타일 & 라이브러리 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
  /* 전체 페이지 기본 */
  body {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', 'Segoe UI', sans-serif;
    background-color: #ffffff;
    color: #212529;
  }

  /* 상단 네비 */
  .navbar {
    background-color: #fff;
    border-bottom: 1px solid #e5e7eb;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    z-index: 1050;
  }

  /* 사이드바 */
  .sidebar {
    background-color: #111827;
    color: #f9fafb;
    width: 240px;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    padding: 32px 16px 16px;
    overflow-y: auto;
  }

  .sidebar .nav-link {
    color: #d1d5db;
    border-radius: 0.375rem;
  }

  .sidebar .nav-link.active,
  .sidebar .nav-link:hover {
    background-color: #1f2937;
    color: #fff !important;
  }

  /* 메인 콘텐츠 영역 */
  .main-content {
    margin-left: 260px;
    padding: 40px 40px;
  }

  /* 테이블 */
  .table thead th {
    background-color: #e5e7eb;
    color: #374151;
    text-align: center;
  }

  .table tbody tr:hover td {
    color: #000;
    font-weight: 500;
  }

  /* 검색 영역 */
  .search-section {
    border: 1px solid #e2e8f0;
    background-color: #fff;
    border-radius: 0.5rem;
    padding: 1rem;
    box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    margin-bottom: 2rem;
  }

  .input-group-text {
    background-color: #007bff;
    color: white;
    border: none;
  }

  .form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
  }

  #searchBtn {
    background-color: #007bff;
    border: none;
    color: white;
  }

  #searchBtn:hover {
    background-color: #0069d9;
  }

  /* 페이징 */
  .pagination .page-item.active .page-link {
    background-color: #007bff;
    border-color: #007bff;
    color: #fff;
  }

  .pagination .page-link {
    color: #007bff;
    border: 1px solid #dee2e6;
    background-color: #fff;
    transition: background-color 0.2s;
  }

  .pagination .page-link:hover {
    background-color: #e9f2ff;
    color: #0056b3;
  }

  /* 반응형 */
  @media (max-width: 768px) {
    .search-section {
      padding: 0.75rem;
    }

    .form-control, .form-select {
      font-size: 0.9rem;
    }

    .main-content {
      margin-left: 0;
      padding: 80px 20px;
    }

    .sidebar {
      display: none; /* 모바일에선 숨김 처리 (필요 시 토글 구현 가능) */
    }
  }
</style>
    