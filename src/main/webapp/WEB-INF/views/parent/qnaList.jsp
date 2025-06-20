<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 목록</title>
<style>
	body {
		margin: 120px 0 40px 0;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f9f9f9;
		color: #333;
	}

	.content-wrapper {
		max-width: 800px;
		margin: 0 auto;
		padding: 0 20px;
	}

	h2 {
		text-align: center;
		margin-bottom: 30px;
		color: #2c3e50;
	}

	.ask-button {
		display: inline-block;
		background-color: #0077cc;
		color: white;
		padding: 8px 16px;
		border-radius: 6px;
		text-decoration: none;
		font-weight: 600;
		margin-bottom: 20px;
	}

	.ask-button:hover {
		background-color: #005fa3;
	}

	.qna-box {
		border: 1px solid #ccc;
		padding: 15px;
		margin-bottom: 15px;
		border-radius: 8px;
		background-color: #fff;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
	}

	.qna-box .question {
		font-weight: bold;
		font-size: 16px;
		color: #333;
	}

	.qna-box .answer {
		margin-top: 8px;
		color: #555;
	}

	.qna-box .date {
		margin-top: 8px;
		font-size: 0.9em;
		color: gray;
	}

	.qna-box .actions {
		margin-top: 10px;
	}

	.qna-box .actions button {
		margin-right: 8px;
		padding: 6px 12px;
		background-color: #eee;
		border: 1px solid #ccc;
		border-radius: 6px;
		cursor: pointer;
	}

	.qna-box .actions button:hover {
		background-color: #ddd;
	}

	.page {
		text-align: center;
		margin-top: 30px;
	}

	.page a, .page strong {
		display: inline-block;
		margin: 0 4px;
		padding: 6px 12px;
		border-radius: 6px;
		text-decoration: none;
	}

	.page a {
		border: 1px solid #ccc;
		background-color: #fff;
		color: #0077cc;
	}

	.page a:hover {
		background-color: #e6f0ff;
		border-color: #0077cc;
	}

	.page strong {
		background-color: #0077cc;
		color: #fff;
	}
</style>
</head>
<body>
<div class="content-wrapper">
	<h2>QnA 목록</h2>

	<div style="text-align:center;">
		<a href="/parent/insertQna?userId=${userId}" class="ask-button">질문하기</a>
	</div>

	<c:forEach var="qna" items="${qnaList}">
		<div class="qna-box">
			<div class="question">Q. ${qna.question}</div>

			<c:if test="${not empty qna.answer}">
				<div class="answer">A. ${qna.answer}</div>
			</c:if>

			<div class="date">
				작성일: 
				<fmt:parseDate value="${qna.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
				<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
			</div>

			<c:if test="${qna.parentId == userId and (qna.answer == null or empty qna.answer)}">
				<div class="actions">
					<form action="/parent/modifyQna" method="get" style="display:inline;">
						<input type="hidden" name="qnaId" value="${qna.qnaId}">
						<input type="hidden" name="userId" value="${userId}">
						<button type="submit">수정</button>
					</form>
					<form action="/parent/qnaDelete" method="post" style="display:inline;">
						<input type="hidden" name="qnaId" value="${qna.qnaId}">
						<input type="hidden" name="userId" value="${userId}">
						<button type="submit">삭제</button>
					</form>
				</div>
			</c:if>
		</div>
	</c:forEach>

	<div class="page">
		<c:if test="${page > 1}">
			<a href="?page=${page - 1}&size=${size}">이전</a>
		</c:if>

		<c:forEach var="i" begin="1" end="${totalPage}">
			<c:choose>
				<c:when test="${i == page}">
					<strong>${i}</strong>
				</c:when>
				<c:otherwise>
					<a href="?page=${i}&size=${size}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${page < totalPage}">
			<a href="?page=${page + 1}&size=${size}">다음</a>
		</c:if>
	</div>
</div>
</body>
</html>
