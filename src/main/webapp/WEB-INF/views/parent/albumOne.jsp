<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 상세</title>
<style>
  body {
    margin: 0;
    padding-top: 120px;
    font-family: 'Segoe UI', 'Arial', sans-serif;
    background-color: #f9fafc;
    color: #333;
  }

  h1 {
    text-align: center;
    font-size: 28px;
    color: #2c3e50;
    margin-bottom: 30px;
  }

  table {
    width: 60%;
    margin: 0 auto 40px auto;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    border-radius: 10px;
    overflow: hidden;
  }

  th, td {
    padding: 14px 20px;
    border-bottom: 1px solid #eaeaea;
    font-size: 16px;
    text-align: left;
  }

  th {
    background-color: #f0f4ff;
    color: #2c3e50;
    font-weight: 600;
    width: 150px;
  }

  tr:last-child td {
    border-bottom: none;
  }

  .photo-gallery {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 16px;
    margin-bottom: 60px;
  }

  .photo-card {
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 10px;
    background-color: #fff;
    box-shadow: 0 2px 6px rgba(0,0,0,0.05);
    transition: transform 0.2s ease;
  }

  .photo-card:hover {
    transform: scale(1.03);
  }

  .photo-card img {
    width: 220px;
    height: auto;
    display: block;
    border-radius: 6px;
  }
</style>
</head>
<body>
	<h1>앨범 상세 페이지</h1>
	
	<c:if test="${album != null}">
		<table border="1">
			<tr>
				<th>제목</th>
				<td>${album.title}</td>
			</tr>
			<tr>
				<th>과목</th>
				<td>${album.subjectName}</td>
			</tr>
			<tr>
				<th>설명</th>
				<td>${album.description}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${album.createdAt}</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test="${photoList != null && not empty photoList}">
	    <div  class="photo-gallery" style="display: flex; flex-wrap: wrap; gap: 10px;">
	        <c:forEach items="${photoList}" var="photo">
			    <div style="border: 1px solid #ccc; padding: 5px; margin: 10px;">
			        <img src="${photo.filePath}" 
			             alt="사진" 
			             style="width: 200px; height: auto;">
			    </div>
			</c:forEach>
	    </div>
	</c:if>
</body>
</html>