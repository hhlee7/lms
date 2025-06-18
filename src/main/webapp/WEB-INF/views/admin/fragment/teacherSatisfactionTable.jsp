<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 강사 만족도 평가 목록 조회 -->
<c:choose>
	<c:when test="${empty TeacherSatisfactionList}">
		<p>조회된 평가 목록이 없습니다.</p>
	</c:when>
	<c:otherwise>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>과목</th>
				<th>학생</th>
				<th>강사</th>
				<th>강사 평가 점수</th>
				<th>평가 일시</th>
			</tr>
		<c:forEach var="list" items="${TeacherSatisfactionList}">
			<tr>
				<td>${list.satisfactionId}</td>
				<td>${list.subjectName}</td>
				<td>${list.studentName}</td>
				<td>${list.teacherName}</td>
				<td>${list.ratingTeacher}</td>
				<td>${list.createAt}</td>
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