<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.afterSchoolLms.dto.User" %>
<%
    User loginUser = (User) session.getAttribute("loginUser");
    boolean isLoggedIn = (loginUser != null);
    String buttonText = "로그인 하러 가기";
    String buttonLink = "/login";

    if (isLoggedIn) {
        buttonText = loginUser.getUserName() + "님 반갑습니다.";
        switch (loginUser.getRoleId()) {
            case 1: buttonLink = "/adminMain"; break;
            case 2: buttonLink = "/student/main"; break;
            case 3: buttonLink = "/teacher/main"; break;
            case 4: buttonLink = "/parent/index"; break;
            case 5: buttonLink = "/driver/main"; break;
        }
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>학교 홈페이지</title>
  <style>
    body {
      margin: 0; font-family: 'Poppins', sans-serif;
      background: #fff; color: #333;
    }
    header {
      display: flex; justify-content: space-between; align-items: center;
      padding: 20px 50px;
      background: #fff;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
      position: sticky; top: 0; z-index: 100;
    }
    header .logo {
      font-weight: 700; font-size: 24px; color: #333;
    }
    nav a {
      margin-left: 30px; text-decoration: none; color: #333;
      font-weight: 500;
      transition: color 0.3s;
    }
    nav a:hover {
      color: #3bc9db;
    }
    .banner {
      position: relative;
      height: 80vh;
      background: url('https://source.unsplash.com/1600x900/?education,desk') no-repeat center/cover;
      display: flex; flex-direction: column; justify-content: center; align-items: center;
      color: white; text-align: center;
      padding: 0 20px;
    }
    .banner h1 {
      font-size: 3.5rem; margin-bottom: 10px;
      text-shadow: 2px 2px 10px rgba(0,0,0,0.5);
    }
    .banner p {
      font-size: 1.4rem; margin-bottom: 30px;
      text-shadow: 1px 1px 6px rgba(0,0,0,0.5);
    }
    .banner button {
      padding: 15px 40px;
      background-color: #3bc9db;
      border: none;
      border-radius: 25px;
      font-size: 1.2rem;
      color: white;
      cursor: pointer;
      box-shadow: 0 4px 12px rgba(59,201,219,0.4);
      transition: background-color 0.3s;
    }
    .banner button:hover {
      background-color: #34b7c8;
    }
    section.about {
      max-width: 900px; margin: 60px auto; padding: 0 20px;
      text-align: center;
    }
    section.about h2 {
      font-size: 2.5rem; margin-bottom: 20px;
      color: #222;
    }
    section.about p {
      font-size: 1.2rem; line-height: 1.6;
      color: #555;
    }
    .gallery {
      max-width: 900px;
      margin: 40px auto;
      padding: 0 20px;
      text-align: center;
    }
    .gallery-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      grid-template-rows: repeat(2, 300px);
      gap: 15px;
    }
    .gallery-grid a {
      display: block;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      transition: transform 0.3s, box-shadow 0.3s;
    }
    .gallery-grid a:hover {
      transform: scale(1.05);
      box-shadow: 0 6px 18px rgba(0,0,0,0.2);
    }
    .gallery-grid img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
      border-radius: 10px;
    }
    .modal {
      display: none;
      position: fixed;
      z-index: 999;
      left: 0; top: 0;
      width: 100%; height: 100%;
      background-color: rgba(0,0,0,0.8);
      justify-content: center;
      align-items: center;
    }
    .modal-content {
      max-width: 90%;
      max-height: 80%;
      border-radius: 10px;
      box-shadow: 0 0 20px #000;
    }
    .close {
      position: absolute;
      top: 30px;
      right: 50px;
      color: #fff;
      font-size: 40px;
      font-weight: bold;
      cursor: pointer;
    }
    @media(max-width: 768px) {
      .banner h1 { font-size: 2.2rem; }
      .banner p { font-size: 1rem; }
      .gallery-grid {
        grid-template-columns: 1fr;
        grid-template-rows: auto;
      }
      .gallery-grid img {
        height: auto;
      }
    }
  </style>
</head>
<body>

<header>
  <div class="logo">
    <img src="https://upload.wikimedia.org/wikipedia/commons/9/98/Microsoft_Edge_logo_%282019%29.svg" 
         alt="학교 로고" 
         style="width: 40px; height: 40px; vertical-align: middle; margin-right: 8px; border-radius: 50%;" />
    여의도초등학교
  </div>
  <nav>
    <a href="/">Home</a>
    <a href="/afterSchool">방과후 교육</a>
    <a href="#" onclick="goNotice()">공지사항</a>
      <% if (isLoggedIn) { %>
    <a href="/logout">로그아웃</a>
  <% } %>
  </nav>
</header>

<div class="banner">
  <h1>미래를 여는 최고의 학교</h1>
  <p>함께 성장하는 꿈과 희망의 공간</p>
  <button onclick="location.href='<%= buttonLink %>'">
  <%= buttonText %>
</button>
</div>

<section class="about">
  <h2>학교 소개</h2>
  <p>저희 학교는 학생 개개인의 잠재력을 최대한 발휘할 수 있도록 체계적인 교육과 다양한 프로그램을 제공합니다.</p>
</section>

<section class="gallery">
  <div class="gallery-grid">
    <a href="#" onclick="openModal(this)">
      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTAyMTBfMTkw%2FMDAxNzM5MTcxMjg2NDAz.ciHXeschx4J9Ile5zWggtmTQJyfHs4JgrnrC9qq_M-Ig.X6_zAeOoznliF0AYIlOFqHqu284T8OYObA0aZ4z_iNIg.JPEG%2FKakaoTalk_20250210_141154684_17.jpg&type=sc960_832" alt="학교 사진 1" />
    </a>
    <a href="#" onclick="openModal(this)">
      <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.lovepik.com%2Fphoto%2F20211130%2Fmedium%2Flovepik-pupils-play-football-picture_501223296.jpg&type=sc960_832" alt="학교 사진 2" />
    </a>
    <a href="#" onclick="openModal(this)">
      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F003%2F2016%2F12%2F21%2FNISI20161221_0012516863_web_20161221134239417.jpg&type=sc960_832" alt="학교 사진 3" />
    </a>
    <a href="#" onclick="openModal(this)">
      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAzMTZfOTgg%2FMDAxNjQ3NDA1MDYzMjk5.V-j5ChPf7Nig1y-x4C7L1ux2Q4lFZ-O7734ljPBJoigg.j4XFOxDAgEPogalzMPJgh07PIJOyf2V7GvfH7JipoFYg.JPEG.mathlove1210%2F%25BC%25F6%25C1%25F6%25BC%25F6%25C7%25D0%25BB%25E7%25B6%25FB%25C7%25D0%25BF%25F8%2528%25BB%25F3%25C7%25F6%25B5%25BF%25293.jpg&type=sc960_832" alt="학교 사진 4" />
    </a>
  </div>
</section>

<!-- 이미지 모달 -->
<div id="imageModal" class="modal" onclick="closeModal()">
  <span class="close">&times;</span>
  <img class="modal-content" id="modalImage" />
</div>

<!-- ✅ 스크립트는 body 맨 마지막에 -->
<script>
  const isLoggedIn = <%= isLoggedIn %>;

  function goNotice() {
    if (!isLoggedIn) {
      alert("로그인 후 이용 가능합니다.");
    } else {
      location.href = "/teacher/notice/list";
    }
  }

  function openModal(el) {
    const modal = document.getElementById("imageModal");
    const modalImg = document.getElementById("modalImage");
    modal.style.display = "flex";
    modalImg.src = el.querySelector("img").src;
  }

  function closeModal() {
    document.getElementById("imageModal").style.display = "none";
  }
</script>

</body>
</html>
