<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to bottom, #f0f4ff 0%, #ffffff 30%);
      color: #111;
    }

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
      flex-wrap: wrap;
    }
    header .logo {
      display: flex;
      align-items: center;
      gap: 10px;
    }
    header .logo img {
      width: 32px;
      height: 32px;
      border-radius: 50%;
    }
    header .logo span {
      font-size: 20px;
      font-weight: 600;
      color: #0b3c5d;
    }
   nav {
	  display: flex;
	  justify-content: center;
	  gap: 24px;
	  flex-wrap: wrap;
	  margin: 0 auto;
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

    .main {
      display: flex;
      justify-content: center;
      gap: 60px;
      flex-wrap: wrap;
      padding: 60px 20px;
    }
    .main iframe {
      width: 800px;
      max-width: 100%;
      aspect-ratio: 16 / 9;
      border-radius: 12px;
      box-shadow: 0 6px 16px rgba(0,0,0,0.1);
    }
    .main .info {
      max-width: 400px;
    }
    .main h2 {
      font-size: 28px;
    }
    .main button {
      padding: 12px 24px;
      background-color: #007acc;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 15px;
      margin-top: 20px;
      cursor: pointer;
    }
    .main button:hover {
      background-color: #005f9e;
    }

    .cards {
      max-width: 1200px;
      margin: 0 auto 60px;
      padding: 20px;
    }
    .cards h3 {
      font-size: 22px;
      margin-bottom: 24px;
    }
    .card-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 20px;
    }
    .card {
	  background: white;
	  border-radius: 12px;
	  box-shadow: 0 6px 18px rgba(0,0,0,0.08);
	  text-align: center;
	  transition: all 0.3s;
	}
	.card:hover {
	  transform: translateY(-6px);
	  box-shadow: 0 8px 20px rgba(0,0,0,0.15);
	}
    .card img {
      width: 100%;
      height: 250px;
      object-fit: cover;
    }
    .card p {
      margin: 8px 0;
      font-size: 14px;
      color: #444;
    }
    
    .card strong {
	color: #000;
	font-weight: 900; /* 더 두껍게 */
	font-size: 1.1em;  /* 크기 약간 키우기 (선택 사항) */
	}
  </style>
</head>
<header>
  <nav>
    <a href="/" class="topnav ${menu eq 'home' ? 'active' : ''}">Home</a>
   	<a href="/parent/index" class="topnav">방과후교육</a>
	<a href="/parent/notice" class="topnav">공지사항</a>
	<a href="/parent/subject" class="topnav">과목소개</a>
	<a href="/parent/teacher" class="topnav">강사소개</a>
	<a href="/parent/lectureList" class="topnav">수강신청</a>
	<a href="/parent/lecturePayOrCancel" class="topnav">결제</a>
	<a href="/parent/lectureLegistrationList" class="topnav">수강 신청내역</a>
	<a href="/parent/studentSubject" class="topnav">자녀 수업조회</a>
	<a href="/parent/attendance" class="topnav">자녀 출결조회</a>
	<a href="/parent/vehicleInfo" class="topnav">자녀 배차조회</a>
	<a href="/parent/album" class="topnav">사진첩</a>
	<a href="/parent/qnaList" class="topnav">QnA</a>
	<a href="/parent/modifyInfo" class="topnav">개인정보 수정</a>
    <a href="/logout" class="topnav">로그아웃</a>
  </nav>
</header>
</body>
</html>
