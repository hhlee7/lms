<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>차량 등록</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
  
	  <script>
	  $(document).ready(function () {
	    $('#vehicle').on('submit', function (e) {
	      const vehicleNo = $('#vehicleNo').val().trim();
	      const capacity = parseInt($('#capacity').val(), 10);
	
	      const vehicleNoRegex = /^[0-9]{2,3}[가-힣][0-9]{4}$/;  // 예: 12가3456
	
	      if (!vehicleNoRegex.test(vehicleNo)) {
	        alert('차량 번호 형식이 올바르지 않습니다. 예: 12가3456');
	        $('#vehicleNo').focus();
	        e.preventDefault();
	        return;
	      }
	
	      if (isNaN(capacity) || capacity < 1 || capacity > 1000) {
	        alert('최대 수용 인원은 1명 이상 1000명 이하로 입력해주세요.');
	        $('#capacity').focus();
	        e.preventDefault();
	        return;
	      }
	    });
	  });
	</script>
</head>
<body>

  <main class="main-content">
    <section class="mb-4 text-center">
      <h2 class="fw-bold">차량 등록</h2>
    </section>

    <section class="card shadow-sm mx-auto" style="max-width: 600px;">
      <div class="card-body">
        <form action="vehicleInsert" method="post" id="vehicle">
          <div class="mb-3">
            <label for="vehicleNo" class="form-label fw-semibold">차량 번호</label>
            <input type="text" class="form-control" id="vehicleNo" name="vehicleNo" required />
          </div>

          <div class="mb-4">
            <label for="capacity" class="form-label fw-semibold">최대 수용 인원</label>
            <input type="number" class="form-control" id="capacity" name="capacity" required min="1" />
          </div>

          <div class="d-flex justify-content-end gap-2">
            <a href="vehicleManagement" class="btn btn-secondary">
              <i class="bi bi-arrow-left"></i> 목록으로
            </a>
            <button type="submit" class="btn btn-success">
              <i class="bi bi-check-circle"></i> 등록
            </button>
          </div>
        </form>
      </div>
    </section>
  </main>

</body>
</html>
