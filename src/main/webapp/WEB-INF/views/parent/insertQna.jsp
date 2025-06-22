<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 작성</title>
<style>
	body {
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f9f9f9;
		color: #333;
	}

	.container {
		max-width: 600px;
		margin: 0 auto;
		background-color: #fff;
		padding: 30px 40px;
		border-radius: 12px;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	}

	h1 {
		text-align: center;
		color: #2c3e50;
		margin-bottom: 30px;
	}

	form table {
		width: 100%;
		border-collapse: collapse;
	}

	form th {
		text-align: left;
		padding-bottom: 8px;
		font-size: 16px;
		color: #555;
	}

	form td {
		padding: 10px 0;
	}

	input[type="text"] {
		width: 100%;
		padding: 10px;
		font-size: 16px;
		border: 1px solid #ccc;
		border-radius: 6px;
	}

	button[type="submit"] {
		display: block;
		width: 100%;
		padding: 12px;
		margin-top: 20px;
		background-color: #0077cc;
		color: white;
		font-weight: bold;
		border: none;
		border-radius: 6px;
		cursor: pointer;
		font-size: 16px;
		transition: background-color 0.3s;
	}

	button[type="submit"]:hover {
		background-color: #005fa3;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>QnA 작성</h1>
		<form method="post" action="/parent/insertQna">
			<table>
				<tr>
					<th>Q: 질문</th>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="userId" name="userId" value="${userId}">
						<input type="text" id="question" name="question" placeholder="질문을 입력하세요">
					</td>
				</tr>
			</table>
			<button type="submit">작성하기</button>
		</form>
	</div>
</body>
</html>
