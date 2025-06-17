<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 조회</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>공지사항</h1>
	<table border="1">
		<tr>
			<th>번호</th>
        		<td>${notice.noticeId}</td>
     		</tr>
     		<tr>
        		<th>제목</th>
        		<td>${notice.title}</td>
     		</tr>
     		<tr>
        		<th>내용</th>
        		<td>${notice.content}</td>
     		</tr>
     		<tr>
       		<th>작성자</th>
        		<td>관리자</td>
     		</tr>
     		<tr>
        		<th>작성일</th>
        		<td>${notice.createdAt}</td>
     		</tr>
   	</table>
</body>
</html>