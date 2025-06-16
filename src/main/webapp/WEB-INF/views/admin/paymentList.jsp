<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강료 납부 내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		function targetSearch(){
			const selectedSubject = $('#targetSubject').val();
			const searchWord = $('#searchWord').val();
			const url = new URL(window.location.href);
			
			// 검색 조건 설정
			url.searchParams.set('searchType', selectedSubject);
			url.searchParams.set("searchWord", searchWord);
			url.searchParams.set('page', 1); // 페이지 리셋

			// 새 주소로 이동
			location.href = url.toString();
		}

		// 과목 select 박스 변경 시
		$('#targetSubject').change(targetSearch);
		
		// 검색 버튼 클릭 시
		$('#searchBtn').click(targetSearch);
	});
</script>
</head>
<body>
	<h1>수강료 납부 내역</h1>
	
	<div><a href="/adminMain">[메인 페이지]</a></div>
	
	과목 선택 :
	<select name="targetSubject" id="targetSubject">
		<option value="all">전체</option>
		<c:if test="${subjectList != null}">
			<c:forEach var="subject" items="${subjectList}">
				<c:choose>
					<c:when test="${param.searchType == subject.subjectName}">
						<option value="${subject.subjectName}" selected>
							${subject.subjectName}
						</option>
					</c:when>
					<c:otherwise>
						<option value="${subject.subjectName}">
							${subject.subjectName}
						</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
	</select>
	
	<br>
	
	<!-- 수강료 납부 목록 조회 -->
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과목</th>
			<th>이름</th>
			<th>금액</th>
			<th>납부 시간</th>
		</tr>
	<c:forEach var="list" items="${paymentList}">
		<tr>
			<td>${list.paymentId}</td>
			<td>${list.subjectName}</td>
			<td>${list.studentName}</td>
			<td>${list.amount}</td>
			<td>${list.paidAt}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>