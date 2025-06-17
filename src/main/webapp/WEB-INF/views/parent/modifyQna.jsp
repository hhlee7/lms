<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>QnA 수정</h1>

	<form method="post" action="/parent/modifyQna">
		<table>
			<tr>
				<th>질문</th>
			</tr>
			<tr>
				<td>
					<input type="hidden" id="qnaId" name="qnaId" value="${qnaId}">
					Q: <input type="text" id="question" name="question">
				</td>
			</tr>
		</table>
		<button type="submit">수정하기</button>
	</form>
		
</body>
</html>