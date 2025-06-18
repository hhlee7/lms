<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>강사 만족도 평가</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body>
<main class="main-content">
  <section class="text-center mb-4">
    <h2 class="fw-bold">강사 만족도 평가</h2>
  </section>

  <section class="search-section mb-4">
    <form class="row gy-2 gx-3 align-items-center justify-content-center" onsubmit="return false;">
      <div class="col-md-auto">
        <label for="targetSubject" class="form-label fw-semibold">과목 선택</label>
        <select id="targetSubject" name="targetSubject" class="form-select">
          <option value="all">전체</option>
          <c:if test="${subjectList != null}">
            <c:forEach var="subject" items="${subjectList}">
              <option value="${subject.subjectName}" <c:if test="${param.searchType == subject.subjectName}">selected</c:if>>
                ${subject.subjectName}
              </option>
            </c:forEach>
          </c:if>
        </select>
      </div>

      <div class="col-md-4">
        <label for="searchWord" class="form-label fw-semibold">강사 이름</label>
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-search"></i></span>
          <input type="text" name="searchWord" id="searchWord" class="form-control"
                 value="${page.searchWord != null ? page.searchWord : ''}" placeholder="이름 입력" />
          <button type="button" class="btn btn-primary" id="searchBtn">검색</button>
        </div>
      </div>
    </form>
  </section>

  <!-- 테이블 영역 -->
  <section class="mb-5">
    <div id="tableContainer">
      <jsp:include page="fragment/teacherSatisfactionTable.jsp" />
    </div>
  </section>

  <!-- 차트 영역 -->
  <section class="text-center">
    <h4 class="fw-bold mb-3">강사별 평균 만족도 통계</h4>
    <canvas id="teacherSatisfactionChart" style="width:100%; max-width:600px; height:300px; margin: auto;"></canvas>
  </section>
</main>

<script>
function loadTable(page = 1) {
  const selectedSubject = $('#targetSubject').val();
  const searchWord = $('#searchWord').val();

  $.ajax({
    url: '/admin/teacherSatisfactionTable',
    type: 'get',
    data: {
      page: page,
      searchType: selectedSubject,
      searchWord: searchWord
    },
    success: function(data) {
      $('#tableContainer').html(data);
    }
  });
}

function drawChart() {
  $.ajax({
    url : '/admin/teacherSatisfactionStats',
    type : 'post',
    success : function(data) {
      const xValues = [];
      const yValues = [];
      const barColors = [];

      data.forEach(function(e, i) {
        xValues.push(e.teacherName + "(" + e.subjectName + ")");
        yValues.push(e.ratingTeacher);
        const hue = (i * 360 / data.length) % 360;
        barColors.push("hsla(" + hue + ", 90%, 40%, 0.7)");
      });

      new Chart("teacherSatisfactionChart", {
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
            xAxes : [{ categoryPercentage: 0.4 }],
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

  $('#targetSubject').change(function() {
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