<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
<style>
	body {
		margin: 0;
		background-color: #f9f9f9;
		font-family: 'Noto Sans KR', sans-serif;
	}

	.container {
		max-width: 600px;
		margin: 0 auto;
		background: white;
		padding: 30px;
		border-radius: 10px;
		box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	}

	h1 {
		text-align: center;
		margin-bottom: 30px;
		color: #333;
	}

	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}

	th {
		text-align: left;
		padding-bottom: 8px;
		font-size: 16px;
		color: #444;
	}

	td {
		padding-bottom: 10px;
	}

	input[type="text"] {
		width: 100%;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 5px;
		box-sizing: border-box;
		font-size: 15px;
	}

	button {
		width: 100%;
		padding: 12px;
		background-color: #0077cc;
		color: white;
		border: none;
		border-radius: 5px;
		font-size: 16px;
		cursor: pointer;
	}

	button:hover {
		background-color: #005fa3;
	}
</style>
</head>
<body>

<div class="container">
	<h1>QnA 수정</h1>

	<form method="post" action="/parent/modifyQna">
		<input type="hidden" id="qnaId" name="qnaId" value="${qnaId}">
		
		<table>
			<tr>
				<th>질문</th>
			</tr>
			<tr>
				<td>
					<input type="text" id="question" name="question" value="${question}" required>
				</td>
			</tr>
		</table>

		<button type="submit">수정하기</button>
	</form>
</div>

</body>
</html>
