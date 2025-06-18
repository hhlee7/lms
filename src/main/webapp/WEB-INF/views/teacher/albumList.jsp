<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>사진첩</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background-color: #f5f6fa;
      color: #333;
    }

    .container {
      max-width: 1080px;
      margin: 0 auto;
      padding: 40px 20px;
    }

    h2 {
      text-align: center;
      margin-bottom: 40px;
      color: #222;
    }

    .search-form {
      text-align: center;
      margin-bottom: 30px;
    }

    .search-form input[type="text"] {
      padding: 10px 14px;
      width: 250px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 14px;
      margin-right: 8px;
    }

    .search-form button {
      padding: 10px 20px;
      background-color: #007acc;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 14px;
      cursor: pointer;
    }

    .search-form button:hover {
      background-color: #005fa3;
    }

    .album-gallery {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 20px;
    }

    .album-card {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0,0,0,0.06);
      transition: transform 0.2s ease;
      cursor: pointer;
    }

    .album-card:hover {
      transform: translateY(-6px);
    }

    .album-card img {
      width: 100%;
      height: auto;
      max-height: 220px;
      object-fit: contain;
      background-color: #f8f8f8;
      cursor: zoom-in;
    }

    .album-info {
      padding: 16px;
    }

    .album-info h4 {
      margin: 0 0 8px;
      font-size: 1.05rem;
    }

    .album-info p {
      margin: 0 0 12px;
      font-size: 0.9rem;
      color: #555;
    }

    .album-info small {
      font-size: 0.8rem;
      color: #999;
    }

    .pagination {
      text-align: center;
      margin-top: 40px;
    }

    .pagination a,
    .pagination strong {
      margin: 0 6px;
      padding: 6px 14px;
      border: 1px solid #ccc;
      border-radius: 6px;
      text-decoration: none;
      color: #333;
    }

    .pagination strong {
      background-color: #007acc;
      color: white;
      font-weight: bold;
      border: none;
    }

    .no-data {
      text-align: center;
      margin-top: 50px;
      color: #999;
      font-size: 1rem;
    }

    .btn-main {
      display: block;
      margin: 50px auto 0;
      padding: 10px 22px;
      background-color: #495057;
      color: white;
      font-size: 14px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .btn-main:hover {
      background-color: #343a40;
    }

    /* 모달 스타일 */
    #imageModal {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0,0,0,0.8);
      justify-content: center;
      align-items: center;
      z-index: 9999;
    }

    #imageModal img {
      max-width: 90%;
      max-height: 90%;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0,0,0,0.5);
    }
  </style>
</head>
<body>

<div class="container">
  <h2>사진첩</h2>

  <form method="get" action="/teacher/album/list" class="search-form">
    <input type="text" name="keyword" placeholder="앨범 제목 검색" value="${keyword}" />
    <button type="submit">검색</button>
  </form>

  <div class="album-gallery">
    <c:forEach var="album" items="${albumList}">
      <div class="album-card">
      	<img src="/images/${album.filePath}" alt="썸네일" onclick="openModal(this.src)"
                     class="thumb-img" />
        <div class="album-info">
          <h4>${album.title}</h4>
          <p>${album.description}</p>
          <small>${fn:substring(album.created_at, 0, 10)}</small>
        </div>
      </div>
    </c:forEach>
  </div>

  <c:if test="${empty albumList}">
    <div class="no-data">검색된 사진첩이 없습니다.</div>
  </c:if>

  <div class="pagination">
    <c:forEach begin="1" end="${lastPage}" var="i">
      <c:choose>
        <c:when test="${i == page}">
          <strong>${i}</strong>
        </c:when>
        <c:otherwise>
          <a href="/teacher/album/list?page=${i}&keyword=${keyword}">${i}</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </div>

  <a href="/teacher/main"><button class="btn-main" type="button">메인으로</button></a>
</div>

<!-- 🖼️ 이미지 확대용 모달 -->
<div id="imageModal">
  <img id="modalImage" />
</div>

<script>
  const modal = document.getElementById('imageModal');
  const modalImg = document.getElementById('modalImage');

  function openModal(src) {
    modal.style.display = 'flex';
    modalImg.src = src;
  }
  
  // ESC 키 누르면 닫기
  window.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      modal.style.display = 'none';
    }
  });

  // 마우스로 모달 클릭해도 닫기
  modal.onclick = function () {
    modal.style.display = 'none';
  }
</script>

</body>
</html>
