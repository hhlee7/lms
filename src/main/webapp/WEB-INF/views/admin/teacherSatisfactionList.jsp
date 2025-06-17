<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족도 평가 및 리뷰 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
	<h1>만족도 평가 및 리뷰 조회</h1>
	
	<h2>강사 만족도 평가 목록</h2>
	
	<div><a href="/admin/main">[메인 페이지]</a></div>
	
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
	
	<!-- 출결 목록 조회 -->
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
	
	<!-- 이름 검색 -->
	<div>
		이름 : <input type="text" name="searchWord" id="searchWord" value="${page.searchWord != null ? page.searchWord : ''}">
		<button type="button" name="searchBtn" id="searchBtn">검색</button>
	</div>
	
	<!-- 페이지 그룹 이동 및 번호 출력 -->
	<div>
		<!-- 이전 그룹 이동 -->
		<c:if test="${page.prevGroup}">
			<a href="/admin/teacherSatisfactionList?page=${page.prevGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">«</a>
		</c:if>
	
		<!-- 페이지 번호 리스트 -->
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			<c:choose>
				<c:when test="${i == page.currentPage}">
					<strong>[${i}]</strong>
				</c:when>
				<c:otherwise>
					<a href="/admin/teacherSatisfactionList?page=${i}&searchWord=${page.searchWord}&searchType=${page.searchType}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 다음 그룹 이동 -->
		<c:if test="${page.nextGroup}">
			<a href="/admin/teacherSatisfactionList?page=${page.nextGroupPage}&searchWord=${page.searchWord}&searchType=${page.searchType}">»</a>
		</c:if>
	</div>
	
	<h2>강사별 평균 만족도 통계</h2>
	<canvas id="teacherSatisfactionChart" style="width:100%; max-width:600px; height:300px;"></canvas>
	<script>
		// 강사별 평균 만족도 통계 차트
		$.ajax({
			url : '/admin/teacherSatisfactionStats',
			type : 'post',
			success : function(data) {
				const xValues = []; // 강사(과목)
				const yValues = []; // 평균 점수
				const barColors = [];

				// HSLA 기반 색상 자동 생성
				data.forEach(function(e, i) {
					xValues.push(e.teacherName + "(" + e.subjectName + ")");
					yValues.push(e.ratingTeacher);
					
					// hue 값을 360도 안에서 분산 (채도 90%, 밝기 40%, 투명도 0.7)
					const hue = (i * 360 / data.length) % 360;
					barColors.push("hsla(" + hue + ", 90%, 40%, 0.7)");
				});

				new Chart("teacherSatisfactionChart", {
					type : "bar",
					data : {
						labels : xValues,
						datasets : [ {
							label: '평균 만족도',
							backgroundColor : barColors,
							data : yValues
						} ]
					},
					options : {
						legend : {
							display : false
						},
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true,
									max: 5
								}
							} ]
						},
						title : {
							display : false
						}
					}
				});
			}
		});
	</script>
</body>
</html>