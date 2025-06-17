<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	/* 💎 헤더 */
	  header {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    padding: 20px 60px;
	    background: linear-gradient(to right, #ffffff, #f0f4f9);
	    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	    position: sticky;
	    top: 0;
	    z-index: 100;
	    overflow-x: auto; /* ✅ 넘칠 경우 스크롤 허용 */
	  }
	
	  nav {
	    display: flex;
	    justify-content: center;
	    gap: 24px;
	    white-space: nowrap;         /* ✅ 줄바꿈 방지 */
	    overflow-x: auto;
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
</style>
</head>
<body>
	<header>
		<nav>
	    	<a href="/student/main" class="topnav">메인페이지</a>
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
	</header>
</body>
</html>