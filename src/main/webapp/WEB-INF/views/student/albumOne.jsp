<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 상세</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        background-color: #f5f6fa;
        color: #333;
    }

    .container {
        max-width: 900px;
        margin: 40px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    h1 {
        text-align: center;
        color: #007acc;
        margin-bottom: 30px;
    }

    .album-info {
        margin-bottom: 30px;
    }

    .album-info div {
        margin-bottom: 12px;
        font-size: 16px;
    }

    .album-info span.label {
        font-weight: bold;
        display: inline-block;
        width: 100px;
        color: #555;
    }

    .photo-gallery {
        display: flex;
        flex-wrap: wrap;
        gap: 16px;
        justify-content: flex-start;
    }

    .photo-card {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 8px;
        background-color: #fafafa;
        box-shadow: 0 1px 5px rgba(0,0,0,0.05);
        transition: transform 0.2s;
        cursor: pointer;
    }

    .photo-card:hover {
        transform: scale(1.03);
    }

    .photo-card img {
        width: 200px;
        height: auto;
        display: block;
        border-radius: 4px;
    }

    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.7);
    }

    .modal-content {
        position: relative;
        margin: 5% auto;
        max-width: 80%;
        max-height: 80%;
        background-color: #fff;
        padding: 10px;
        border-radius: 8px;
    }

    .modal-content img {
	    width: 100%;
	    max-height: 80vh;  /* 화면 높이의 80%로 제한 */
	    height: auto;
	    display: block;
	    border-radius: 6px;
	    object-fit: contain;  /* 비율 유지하며 전체 이미지 보이게 */
    }

    .close-btn {
        position: absolute;
        top: 8px;
        right: 12px;
        font-size: 24px;
        color: #333;
        cursor: pointer;
    }

    .close-btn:hover {
        color: #e74c3c;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
	    <h1>앨범 상세 페이지</h1>
	
	    <c:if test="${album != null}">
	        <div class="album-info">
	            <div><span class="label">제목</span> ${album.title}</div>
	            <div><span class="label">과목</span> ${album.subjectName}</div>
	            <div><span class="label">설명</span> ${album.description}</div>
	            <div><span class="label">작성일</span> ${album.createdAt}</div>
	        </div>
	    </c:if>
	
	    <c:if test="${photoList != null && not empty photoList}">
	        <div class="photo-gallery">
	            <c:forEach items="${photoList}" var="photo">
	                <div class="photo-card">
	                    <img src="${photo.filePath}" alt="사진" onclick="openModal('${photo.filePath}')" />
	                </div>
	            </c:forEach>
	        </div>
	    </c:if>
	</div>
	
	<!-- 모달 영역 -->
	<div id="photoModal" class="modal" onclick="closeModal()">
	    <div class="modal-content" onclick="event.stopPropagation()">
	        <span class="close-btn" onclick="closeModal()">✖</span>
	        <img id="modalImage" src="" alt="확대 이미지">
	    </div>
	</div>
	
	<script>
	    function openModal(imageSrc) {
	        document.getElementById("modalImage").src = imageSrc;
	        document.getElementById("photoModal").style.display = "block";
	    }
	
	    function closeModal() {
	        document.getElementById("photoModal").style.display = "none";
	    }
	</script>
</body>
</html>
