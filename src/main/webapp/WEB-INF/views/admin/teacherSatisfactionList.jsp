<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만족도 평가 및 리뷰 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
	
	<!-- 테이블 영역 -->
	<div id="tableContainer">
		<jsp:include page="fragment/teacherSatisfactionTable.jsp" />
	</div>
	
	<!-- 이름 검색 -->
	<div>
		이름 : <input type="text" name="searchWord" id="searchWord" value="${page.searchWord != null ? page.searchWord : ''}">
		<button type="button" name="searchBtn" id="searchBtn">검색</button>
	</div>
	
	<h2>강사별 평균 만족도 통계</h2>
	<canvas id="teacherSatisfactionChart" style="width:100%; max-width:400px; height:300px;"></canvas>
	
	<script>
	// 테이블 조회
	function loadTable(page = 1) {
		const selectedSubject = $('#targetSubject').val(); // 선택한 과목명
		const searchWord = $('#searchWord').val(); // 입력한 검색어

		$.ajax({
			url: '/admin/teacherSatisfactionTable',
			type: 'get',
			data: {
				page: page,
				searchType: selectedSubject,
				searchWord: searchWord
			},
			success: function(data) {
				// 응답 받은 HTML을 #tableContainer 영역에 삽입
				$('#tableContainer').html(data);
			}
		});
	}
	
	function drawChart() {
		// 강사별 평균 만족도 통계 차트 출력
		$.ajax({
			url : '/admin/teacherSatisfactionStats',
			type : 'post',
			success : function(data) {
				const xValues = []; // x축 : 강사(과목)
				const yValues = []; // y축 : 평균 점수
				const barColors = []; // 막대 색상

				// 데이터 루프 처리
				data.forEach(function(e, i) {
					xValues.push(e.teacherName + "(" + e.subjectName + ")");
					yValues.push(e.ratingTeacher);
					
					// 색상 자동 생성 : hue(색상) 값을 360도 색상 안에서 강사 수만큼 균등하게 분할
					const hue = (i * 360 / data.length) % 360;
					// HSLA 색상 문자열로 변환 : 색상(hue), 채도 90%, 밝기 40%, 투명도 0.7
					barColors.push("hsla(" + hue + ", 90%, 40%, 0.7)");
				});
				
				// Chart.js 그래프 생성
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
						legend : { display : false },
						scales : {
							xAxes : [ {	categoryPercentage: 0.4	} ],
							yAxes : [ {
								ticks : {
									beginAtZero : true,
									max: 5
								}
							} ]
						},
						title : { display : false }
					}
				});
			}
		});
	}
	
	$(document).ready(function() {
		// 초기 페이지 로딩 시 테이블과 차트 모두 호출
		loadTable(1);
		drawChart();
		
		// 과목 선택 드롭다운 변경 시 : 1페이지부터 다시 조회
		$('#targetSubject').change(function() {
			loadTable(1);
		});
		
		// 검색 버튼 클릭 시 : 1페이지부터 다시 조회
		$('#searchBtn').click(function() {
			loadTable(1);
		});
		
		// 페이징 버튼 클릭 시
		$(document).on('click', '.paging', function(e) {
			e.preventDefault(); // 기본 링크 이동 막기
			const page = $(this).data('page'); // data-page에서 페이지 번호 추출
			loadTable(page); // 비동기 호출
		});
	});
	</script>
</body>
</html>