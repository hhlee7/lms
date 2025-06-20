<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>수업 만족도 평가</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body>
<main class="main-content">
	
  <!-- 차트 영역 -->
  <section class="text-center mb-4">
    <h2 class="fw-bold mb-3">수업별 평균 만족도 통계</h2>
    <canvas id="lectureSatisfactionChart" style="width:100%; max-width:600px; height:300px; margin: auto;"></canvas>
  </section>
	
  <section class="text-center mb-4 mt-4">
    <h2 class="fw-bold">수업 만족도 평가 및 리뷰</h2>
  </section>

  <section class="search-section mb-4">
    <form class="row gy-2 gx-3 align-items-center justify-content-center" onsubmit="return false;">
      <div class="col-md-auto">
        <label for="targetLecture" class="form-label fw-semibold">수업 선택</label>
        <select id="targetLecture" name="targetLecture" class="form-select">
          <option value="all">전체</option>
          <c:if test="${lectureList != null}">
            <c:forEach var="lecture" items="${lectureList}">
              <option value="${lecture.lectureId}" <c:if test="${param.searchType == lecture.lectureId.toString()}">selected</c:if>>
                ${lecture.lectureId}(${lecture.subjectName})
              </option>
            </c:forEach>
          </c:if>
        </select>
      </div>

      <div class="col-md-4">
        <label for="searchWord" class="form-label fw-semibold">학생 이름</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-search"></i></span>
          <input type="text" name="searchWord" id="searchWord" class="form-control"
                 value="${page.searchWord != null ? page.searchWord : ''}" placeholder="학생 이름을 입력하세요" />
          <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
        </div>
      </div>
    </form>
  </section>

  <!-- 테이블 영역 -->
  <section class="mb-5">
    <div id="tableContainer">
      <jsp:include page="fragment/lectureSatisfactionTable.jsp" />
    </div>
  </section>

</main>

<script>
function loadTable(page = 1) {
  const selectedLecture = $('#targetLecture').val();
  const searchWord = $('#searchWord').val();

  $.ajax({
    url: '/admin/lectureSatisfactionTable',
    type: 'get',
    data: {
      page: page,
      searchType: selectedLecture,
      searchWord: searchWord
    },
    success: function(data) {
      $('#tableContainer').html(data);
    }
  });
}

function drawChart() {
  $.ajax({
    url : '/admin/lectureSatisfactionStats',
    type : 'post',
    success : function(data) {
      const xValues = [];
      const yValues = [];
      const barColors = [];

      data.forEach(function(e, i) {
        xValues.push(e.subjectName + " " + e.lectureId + "기");
        yValues.push(e.avgRating);
        const hue = (i * 360 / data.length) % 360;
        barColors.push("hsla(" + hue + ", 60%, 40%, 0.7)");
      });

      new Chart("lectureSatisfactionChart", {
        type : "bar",
        data : {
          labels : xValues,
          datasets : [{
            label: '평균 만족도',
            backgroundColor : barColors,
            data : yValues
          }]
        },
        options : {
          legend : { display : false },
          scales : {
            xAxes : [{ categoryPercentage: 0.5 }],
            yAxes : [{
              ticks : {
                beginAtZero : true,
                max: 5
              }
            }]
          },
          title : { display : false }
        }
      });
    }
  });
}

$(document).ready(function() {
  loadTable(1);
  drawChart();

  $('#targetLecture').change(function() {
    loadTable(1);
  });

  $('#searchBtn').click(function() {
    loadTable(1);
  });

  $(document).on('click', '.paging', function(e) {
    e.preventDefault();
    const page = $(this).data('page');
    loadTable(page);
  });
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>