<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 메인 페이지</title>
<style>
    /* 🎥 영상 + 소개 */
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

    /* 📦 추천 프로그램 */
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
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- ✅ HERO 배너 -->
	<div class="hero" style="
		background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),
		            url('https://postfiles.pstatic.net/MjAyNTA2MTZfMjU4/MDAxNzUwMDM5NDU1Mzk4.jMKDgxoq4lLb_mbIDoTPJwl-eAeqbvZNvKH_AW1pwBwg.JPX1Be5bgNfpz5Zny8nGoEUg7v0dCR6QLJvu8T2Ukvkg.PNG/ChatGPT_Image_2025%EB%85%84_6%EC%9B%94_16%EC%9D%BC_%EC%98%A4%EC%A0%84_11_04_04.png?type=w773') 
		            no-repeat center center;
		background-size: contain;
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
			<h1 style="font-size: 2.8rem; font-weight: bold; text-shadow: 2px 2px 6px rgba(0,0,0,0.5);">
				아이들의 꿈을 응원하는<br>송린초 방과후학교
	    	</h1>
	    	<p style="margin-top: 16px; font-size: 1.2rem; text-shadow: 1px 1px 4px rgba(0,0,0,0.4);">
	      		다양한 프로그램으로 창의력과 꿈을 키워요
	    	</p>
		</div>
	</div>
	
	<!-- 🎬 영상 + 소개 -->
	<div class="main">
	  	<iframe src="https://www.youtube.com/embed/biEWXCO1G4U?autoplay=1&mute=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	  	<div class="info">
	    	<h2>방과후 교육 소개</h2>
	    	<p>아이들의 꿈을 키우는 다양한 프로그램이 준비되어 있습니다.<br>지금 바로 참여해보세요!</p>
	  	</div>
	</div>
	
	<!-- 🧩 추천 프로그램 -->
	<div class="cards">
		<h3>추천 프로그램</h3>
	  	<div class="card-grid">
	    	<div class="card">
	      		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDEyMTFfMjAw%2FMDAxNzMzODY4NDI4MzMy.h6FJXqvvoiAB6UmKzB3bj_udg6VzJfbCE7Sx6vsdHygg.5jtNe_ugT8pUng4ZZ6htObgG-C6vJ6J5GrtLYb2czb4g.JPEG%2F900%25A3%25DFScreenshot%25A3%25DF20241209%25A3%25AD203850.jpg&type=a340" alt="피아노">
	      		<p><strong>피아노</strong></p>
	      		<p>음악성과 표현력을 키워요</p>
	    		</div>
	    	<div class="card">
	      		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTA0MDhfMTE1%2FMDAxNzQ0MDgwMjIwNjk2.QTNRxjtKpNexOG8WROhWXlP0XqhhAlhgjJjyWIw0HqUg.5Z-_AUcbz4-wyuVLH8ft7Idsy0TFVuEgCnUXAUj0j9Eg.PNG%2Fimage.png&type=sc960_832" alt="코딩">
	      		<p><strong>코딩</strong></p>
	      		<p>창의력을 자극하는 메이커 교육</p>
	    	</div>
	    	<div class="card">
	    		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTA1MDhfNTIg%2FMDAxNzQ2NjczMzM1MDY1.xW5rPdTyyPQLbAZ5C_H9DcfayWic4Jr3WQMpfWOa_REg.SRLrxHvGhFiPNkW-4t-Qk3IAbs493-cTssOr8qbZl1gg.PNG%2F20250507151630.png&type=sc960_832" alt="축구">
	        	<div class="text">
	          		<p><strong>축구</strong></p>
	          		<p>체력과 협동심을 기르는 스포츠</p>
	        	</div>
	    	</div>
	  	</div>
	</div>

</body>
</html>