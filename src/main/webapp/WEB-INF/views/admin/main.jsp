<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.afterSchoolLms.dto.User" %>
<%
    User loginUser = (User) session.getAttribute("loginUser");
    String adminName = loginUser != null ? loginUser.getUserName() : "관리자";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>관리자 메인 페이지</title>

    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .welcome-text {
            text-shadow: 1px 1px 3px rgba(0,0,0,0.15);
        }
        .card-icon {
            font-size: 1.8rem;
            color: #0dcaf0;
        }
        .card:hover {
            box-shadow: 0 0 15px rgba(13, 202, 240, 0.5);
            transform: translateY(-5px);
            transition: 0.3s;
        }
    </style>
</head>
<body>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="/admin/main">
      <img src="https://upload.wikimedia.org/wikipedia/commons/9/98/Microsoft_Edge_logo_%282019%29.svg" alt="로고" width="30" height="30" class="rounded-circle me-2" />
      <span class="fw-bold">방과후 교육 관리자</span>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarMenu">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-danger fw-semibold" href="/logout"><i class="fas fa-right-from-bracket"></i> 로그아웃</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- 메인 컨텐츠 -->
<div class="container py-5">
    <div class="text-center mb-5">
        <h1 class="welcome-text fw-bold"><%= adminName %> 관리자님, 환영합니다!</h1>
        <p class="text-secondary fs-5">교육을 위한 최적의 환경을 함께 만들어갑니다.</p>
    </div>

    <div class="row g-4">
        <!-- 각 메뉴 아이템들 카드로 배치 -->
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/userManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-users-cog card-icon mb-3"></i>
                    <h5 class="card-title text-dark">회원 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/vehicleManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-bus card-icon mb-3"></i>
                    <h5 class="card-title text-dark">차량 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/noticeManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-bullhorn card-icon mb-3"></i>
                    <h5 class="card-title text-dark">공지사항 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/studentDispatchManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-route card-icon mb-3"></i>
                    <h5 class="card-title text-dark">학생 배차 조회</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/vehicleCancel" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-ban card-icon mb-3"></i>
                    <h5 class="card-title text-dark">배차 취소 조회</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/albumManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-image card-icon mb-3"></i>
                    <h5 class="card-title text-dark">수업 사진첩</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/qnaManagement" class="text-decoration-none position-relative">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-question-circle card-icon mb-3"></i>
                    <h5 class="card-title text-dark d-flex justify-content-center align-items-center gap-2">
                        학부모 Q&amp;A
                        <span class="badge bg-warning text-dark rounded-pill" style="font-size: 1rem;">
                            ${qnaCount}
                        </span>
                    </h5>
                </div>
            </a>
        </div>

        <!-- 아래도 같은 패턴으로 추가 -->

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/subjectManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-book card-icon mb-3"></i>
                    <h5 class="card-title text-dark">과목 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/studentEnrollmentList" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-user-check card-icon mb-3"></i>
                    <h5 class="card-title text-dark">수강 신청 현황</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/paymentList" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-receipt card-icon mb-3"></i>
                    <h5 class="card-title text-dark">수강료 납부 내역</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/enrollmentCancelList" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-times-circle card-icon mb-3"></i>
                    <h5 class="card-title text-dark">수강 취소 내역</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/refundList" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-hand-holding-usd card-icon mb-3"></i>
                    <h5 class="card-title text-dark">환불 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/lectureManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-chalkboard card-icon mb-3"></i>
                    <h5 class="card-title text-dark">수업 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/classroomManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-school card-icon mb-3"></i>
                    <h5 class="card-title text-dark">강의실 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/materialManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-boxes card-icon mb-3"></i>
                    <h5 class="card-title text-dark">교보재 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/materialRequestManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-dolly card-icon mb-3"></i>
                    <h5 class="card-title text-dark">교보재 요청 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/attendanceManagement" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-clipboard-list card-icon mb-3"></i>
                    <h5 class="card-title text-dark">출결 관리</h5>
                </div>
            </a>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/lectureSatisfactionList" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-star card-icon mb-3"></i>
                    <h5 class="card-title text-dark">수업 만족도 평가</h5>
                </div>
            </a>
        </div>
        
        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <a href="/admin/teacherSatisfactionList" class="text-decoration-none">
                <div class="card shadow-sm h-100 text-center p-4">
                    <i class="fas fa-star card-icon mb-3"></i>
                    <h5 class="card-title text-dark">강사 만족도 평가</h5>
                </div>
            </a>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS (필요시) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
