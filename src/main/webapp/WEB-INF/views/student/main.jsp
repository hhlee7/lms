<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 메인 페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Jua&display=swap" rel="stylesheet">

<style>
  body {
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
    background: #f9f9fb;
  }

  /* 🎞 영상 + 소개 */
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
    padding-top: 10px;
  }
  .main h2 {
    font-size: 2rem;
    font-weight: 700;
    color: #007bff;
    margin-bottom: 16px;
  }
  .main p {
    font-size: 1.05rem;
    color: #333;
    line-height: 1.7;
    margin-bottom: 10px;
  }
  .main .cta {
    font-weight: 600;
    color: #007bff;
  }

  /* 📦 추천 프로그램 */
  .cards {
    max-width: 1200px;
    margin: 0 auto 60px;
    padding: 20px;
  }
  .cards h3 {
    font-size: 1.5rem;
    font-weight: 700;
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
    transition: all 0.3s;
    overflow: hidden;
    text-align: center;
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
  .card p strong {
  font-family: 'Jua', sans-serif; /* 제목용 – 귀엽고 또렷 */
  font-size: 1.2rem;
  color: #333;
  }
  .card p {
  font-family: 'Gowun Dodum', sans-serif; /* 설명용 – 부드럽고 가독성 좋음 */
  font-size: 0.95rem;
  color: #555;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<!-- ✅ HERO 배너 -->
<div class="hero" style="
  background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),
              url('/images/studentmain.png')
              no-repeat center center / contain;
  background-color: #000;
  height: 650px;
  color: white;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  text-align: center;
  padding-top: 100px;
">
  <div style="position: relative; z-index: 1;">
<h1 style="
  font-family: 'Jua', sans-serif;
  font-size: 2.8rem;
  font-weight: bold;
  color: white;
  text-shadow: 2px 2px 6px rgba(0,0,0,0.5);">
   와~ 방과후 수업 진짜 재밌다!<br>너도 같이 해볼래?
</h1>

<p style="
  font-family: 'Gowun Dodum', sans-serif;
  margin-top: 16px;
  font-size: 1.2rem;
  color: white;
  text-shadow: 1px 1px 4px rgba(0,0,0,0.4);">
   코딩도 하고, 피아노도 치고, 축구도 하고!<br>친구들이랑 같이 배우는 시간, 지금 바로 시작해요!
</p>
  </div>
</div>

<!-- 🎬 영상 + 소개 -->
<div class="main">
  <iframe src="https://www.youtube.com/embed/Vt1ypYFmtSU?autoplay=1&playlist=Vt1ypYFmtSU&loop=1&mute=1"
    frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

<div class="info text-start" style="padding-left: 20px;">
<h2 style="
  font-family: 'Jua', sans-serif;
  font-size: 2.2rem;
  color: #007bff;
  font-weight: bold;
  margin-bottom: 16px;">
  방과후 수업? 이젠 재미로 하는 거예요
</h2>

<p style="
  font-family: 'Gowun Dodum', sans-serif;
  font-size: 1.05rem;
  color: #333;
  line-height: 1.7;
  margin-bottom: 8px;">
  축구도 하고, 그림도 그리고, 코딩도 하고!<br>
  혼자 하는 공부는 이제 그만.<br>
  친구들이랑 신나게 배우는 시간이 시작됩니다!
</p>

<p style="
  font-family: 'Gowun Dodum', sans-serif;
  font-weight: bold;
  color: #007bff;
  font-size: 1rem;">
  신청만 하면 다음 주부터 바로 참여 가능!
</p>
 </div>
</div>

<!-- 🔹 추천 프로그램 -->
<div class="cards">

<!-- 💬 말풍선 텍스트 -->
<div style="display: flex; justify-content: center; margin: 40px 0;">
  <div style="
    background: #fff9e6;
    color: #ff6b00;
    padding: 16px 24px;
    border-radius: 24px;
    font-size: 1.3rem;
    font-weight: 700;
    text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    box-shadow: 0 4px 10px rgba(0,0,0,0.08);
    position: relative;
    font-family: 'Noto Sans KR', sans-serif;
    max-width: 90%;
    text-align: center;
  ">
    😊 너는 어떤 수업이 제일 재미있을 것 같아?
    <div style="
      content: '';
      position: absolute;
      bottom: -12px;
      left: 50%;
      transform: translateX(-50%);
      width: 0;
      height: 0;
      border-left: 12px solid transparent;
      border-right: 12px solid transparent;
      border-top: 12px solid #fff9e6;
    "></div>
  </div>
</div>
  <h3 style="color: #ff6b00;">방과후엔 뭐하고 놀까?!</h3>
  <div class="card-grid">

    <a href="/student/subject" class="card" style="text-decoration: none; color: inherit;">
      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20250423_261%2F1745394958873am6aQ_JPEG%2F21013009329566293_1669727011.jpg&type=sc960_832" alt="피아노">
      <p><strong>피아노</strong></p>
      <p>즐겁게 연주하며 나만의 멜로디를 만들어요</p>
    </a>

    <a href="/student/subject" class="card" style="text-decoration: none; color: inherit;">
      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDEwMTRfMjY5%2FMDAxNzI4ODg5ODc2Njgy.BAH5YBH2s0Xr3FtmA6VfWVlbYWQoRd-IIK-m-qjmEZQg.2zz_zAkERznjhX9h3kD7tHT0ag7jiB4hQQopxg_AYd8g.JPEG%2Foutput_1602405098.jpg&type=sc960_832" alt="코딩">
      <p><strong>코딩</strong></p>
      <p>게임도 만들고 로봇도 움직여봐요!</p>
    </a>

    <a href="/student/subject" class="card" style="text-decoration: none; color: inherit;">
      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTA1MDhfNTIg%2FMDAxNzQ2NjczMzM1MDY1.xW5rPdTyyPQLbAZ5C_H9DcfayWic4Jr3WQMpfWOa_REg.SRLrxHvGhFiPNkW-4t-Qk3IAbs493-cTssOr8qbZl1gg.PNG%2F20250507151630.png&type=sc960_832" alt="추구">
      <p><strong>축구</strong></p>
      <p>함께 뛰고 땀 흘리며 몸도 마음도 튼튼하게!</p>
    </a>

  </div>
</div>


</body>
</html>