<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 수업 만족도 평가 및 리뷰 목록 조회 -->
<c:choose>
	<c:when test="${empty LectureSatisfactionList}">
		<p>조회된 평가 목록이 없습니다.</p>
	</c:when>
	<c:otherwise>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>수업(과목)</th>
				<th>이름</th>
				<th>수업 평가 점수</th>
				<th>평가 일시</th>
				<th>리뷰</th>
				<th>리뷰 작성 일시</th>
			</tr>
		<c:forEach var="list" items="${LectureSatisfactionList}">
			<tr>
				<td>${list.satisfactionId}</td>
				<td>${list.lectureId}(${list.subjectName})</td>
				<td>${list.studentName}</td>
				<td>${list.ratingLecture}</td>
				<td>${list.createAt}</td>
				<td>${list.content}</td>
				<td>${list.reivewCreateAt}</td>
			</tr>
		</c:forEach>
		</table>
	</c:otherwise>
</c:choose>

<!-- 페이지 그룹 이동 및 번호 출력 -->
<div>
	<!-- 이전 그룹 이동 -->
	<c:if test="${page.prevGroup}">
		<a href="#" class="paging" data-page="${page.prevGroupPage}">«</a>
	</c:if>

	<!-- 페이지 번호 리스트 -->
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<c:choose>
			<c:when test="${i == page.currentPage}">
				<strong>[${i}]</strong>
			</c:when>
			<c:otherwise>
				<a href="#" class="paging" data-page="${i}">[${i}]</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<!-- 다음 그룹 이동 -->
	<c:if test="${page.nextGroup}">
		<a href="#" class="paging" data-page="${page.nextGroupPage}">«</a>
	</c:if>
</div>