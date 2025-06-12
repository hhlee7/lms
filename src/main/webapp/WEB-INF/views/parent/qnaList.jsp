<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>QnA 목록</title>
	<style>
		.qna-box {
			border: 1px solid #ccc;
			padding: 15px;
			margin-bottom: 10px;
			border-radius: 8px;
			background-color: #f9f9f9;
		}
		.qna-box .question {
			font-weight: bold;
		}
		.qna-box .answer {
			margin-top: 5px;
		}
		.qna-box .date {
			margin-top: 5px;
			font-size: 0.9em;
			color: gray;
		}
		.qna-box .actions {
			 margin-top: 10px;
		}
		.qna-box .actions button {
			 margin-right: 5px;
		}
	</style>
</head>
<body>
  <h2>QnA 목록</h2>

	<c:forEach var="qna" items="${qnaList}">
		<div class="qna-box">
				<div class="question">Q: ${qna.question}</div>
			<c:if test="${not empty qna.answer}">
				<div class="answer">A: ${qna.answer}</div>
			</c:if>
			<div class="date">
				작성일: 
				<fmt:parseDate value="${qna.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
				<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
			</div>
			<div class="actions">
				<form action="/parent/qnaEdit" method="get" style="display:inline;">
					<input type="hidden" name="qnaId" value="${qna.qnaId}"/>
					<button type="submit">수정</button>
				</form>
				<form action="/parent/qnaDelete" method="post" style="display:inline;">
					<input type="hidden" name="qnaId" value="${qna.qnaId}"/>
					<button type="submit">삭제</button>
				</form>
			</div>
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
</body>
</html>