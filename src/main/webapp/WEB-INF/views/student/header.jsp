<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
   /* 💎 헤더 */
     header {
       display: flex;
       justify-content: space-between;
       align-items: center;
       padding: 20px 60px;
       background: linear-gradient(to right, #ffffff, #f0f4f9);
       box-shadow: 0 2px 8px rgba(0,0,0,0.08);
       position: sticky;
       top: 0;
       z-index: 100;
       overflow-x: hidden; /* ✅ 넘칠 경우 스크롤 허용 */
     }
   
     .left-user {
       flex-shrink: 0;
       font-weight: 600;
       font-size: 22px;
       color: #333;
       white-space: nowrap;
       margin-right: 20px;
     }
   
     .nav-wrapper {
       overflow-x: auto;
       flex-grow: 1;
       display: flex;
        justify-content: flex-end; /* ✅ 메뉴 오른쪽 정렬 */
     }
     
     nav {
       display: flex;
       gap: 24px;
       white-space: nowrap;         /* ✅ 줄바꿈 방지 */
       flex-wrap: nowrap !important; /* ✅ 무조건 한 줄 유지 */
       max-width: 100%;
     }
   
     .topnav {
       text-decoration: none;
       color: #333;
       font-size: 15px;
       font-weight: 500;
       padding: 6px 12px;
       border-radius: 6px;
       transition: all 0.2s ease;
       position: relative;
       white-space: nowrap;
       flex-shrink: 0;
     }
   
     .topnav:hover {
       color: #0077cc;
       background-color: #e6f4ff;
     }
   
     .topnav.active {
       color: #0077cc;
       font-weight: 600;
     }
   
     .topnav::after {
       content: "";
       display: block;
       width: 0%;
       height: 2px;
       background-color: #0077cc;
       transition: width 0.3s;
       margin-top: 2px;
     }
   
     .topnav:hover::after {
       width: 100%;
     }
     
     /* 선택적: 스크롤바 커스터마이징 */
     .nav-wrapper::-webkit-scrollbar {
       height: 6px;
     }
   
     .nav-wrapper::-webkit-scrollbar-thumb {
       background: #bbb;
       border-radius: 4px;
     }
   
     .nav-wrapper::-webkit-scrollbar-track {
       background: #eee;
     }
</style>
</head>
<body>
   <header>
      <c:if test="${not empty loginUser}">
         <div class="left-user">😊${loginUser.userName} 학생 반갑습니다.</div>
      </c:if>
      <div class="nav-wrapper">
         <nav>
             <a href="/student/main" class="topnav">방과후교육</a>
            <a href="/student/subject" class="topnav">과목소개</a>
            <a href="/student/teacher" class="topnav">강사소개</a>
            <a href="/student/notice" class="topnav">공지사항</a>
            <a href="/student/lecture" class="topnav">수업조회</a>
            <a href="/student/attendance" class="topnav">출결확인</a>
            <a href="/student/dispatch" class="topnav">배차조회</a>
            <a href="/student/satisfaction" class="topnav">만족도평가</a>
            <a href="/student/album" class="topnav">사진첩</a>
            <a href="/student/personalInformation" class="topnav">개인정보</a>
            <a href="/student/logout" class="topnav">로그아웃</a>
         </nav>
      </div>
   </header>
</body>
</html>