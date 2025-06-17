<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
<!-- jQuery CDN (페이지에 없으면 추가) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {		
		// 수정 버튼 눌렀음
		$('#modifyBtn').click(function(){
			const postcode = $('#postcode').val();
			const roadAddress = $('#roadAddress').val();
			const jibunAddress = $('#jibunAddress').val();
			const detailAddress = $('#detailAddress').val();
			const extraAddress = $('#extraAddress').val();

			const address = postcode + " " + roadAddress + " " + jibunAddress + " " + detailAddress + " " + extraAddress;

			// hidden input에 넣기
			$('#fullAddress').val(address);
		});
		
		// 전화번호 유효성 검사
		const phoneRegex = /^01[016789]-\d{3,4}-\d{4}$/;

		$('#phone').on('input', function () {
		    const phone = $(this).val().trim();
		    if (!phoneRegex.test(phone)) {
		        $(this).css('border', '1px solid red');
		        $('#phoneError').text("전화번호는 010-XXXX-XXXX 형식이어야 합니다.");
		    } else {
		        $(this).css('border', '');
		        $('#phoneError').text("");
		    }
		});
		
		// 이메일 정규표현식
		const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,20}$/;
		
		// 이메일 중복 검사 로직
		function emailCheck(){
			const email = $('#email').val().trim();

			if (!emailRegex.test(email)) {
		        $('#checkResult').css('color', 'red').text('이메일 형식을 다시 확인해주세요.');
		        $('#userId').val('');
		        return;
		    }

	        $.ajax({
	            url: '/user/checkUserEmail',
	            type: 'GET',
	            data: { email: email },
	            success: function(data) {
	                if (data.exists) {
	                    $('#checkResult').css('color', 'red').text('이미 사용 중인 이메일입니다.');
	                    $('#userId').val('');
	                } else {
	                    $('#checkResult').css('color', 'green').text('사용 가능한 이메일입니다.');
	                }
	            },
	            error: function() {
	                $('#checkResult').css('color', 'red').text('서버 오류가 발생했습니다.');
	            }
	        });
		}
		
		
		// 이메일 중복 검사 버튼 클릭
		$('#checkEmailBtn').click(emailCheck);
	});
</script>
</head>

  <main class="main-content container mt-4">
    <h2 class="fw-bold mb-4">👤 관리자 회원 수정</h2>

    <form:form action="userModify" method="post" modelAttribute="user">
      <input type="hidden" id="userId" name="userId" value="${selectedUser.userId}"/>

      <div class="mb-3">
        <label class="form-label">역할</label>
        <input type="text" class="form-control" value="${selectedUser.roleName}" readonly />
      </div>

      <div class="mb-3">
        <label class="form-label">이메일</label>
        <div class="input-group">
          <form:input path="email" cssClass="form-control" id="email" value="${selectedUser.email}" />
          <button class="btn btn-outline-secondary" type="button" id="checkEmailBtn">중복 검사</button>
        </div>
        <div id="checkResult" class="form-text text-danger"></div>
        <form:errors path="email" cssClass="text-danger small" />
      </div>

      <div class="mb-3">
        <label class="form-label">이름</label>
        <input type="text" class="form-control" value="${selectedUser.userName}" readonly />
      </div>

      <div class="mb-3">
        <label class="form-label">전화번호</label>
        <form:input path="phone" cssClass="form-control" id="phone" value="${selectedUser.phone}" />
        <div id="phoneError" class="form-text text-danger"></div>
        <form:errors path="phone" cssClass="text-danger small" />
      </div>

      <div class="mb-3">
        <label class="form-label">주소</label>
        <div class="mb-2">
          <span>${selectedUser.address}</span>
        </div>
        <div class="row g-2 mb-2">
          <div class="col-4">
            <input type="text" id="postcode" class="form-control" placeholder="우편번호" />
          </div>
          <div class="col-auto">
            <button type="button" class="btn btn-secondary" onclick="execDaumPostcode()">우편번호 찾기</button>
          </div>
        </div>
        <input type="text" id="roadAddress" class="form-control mb-2" placeholder="도로명 주소" />
        <input type="text" id="jibunAddress" class="form-control mb-2" placeholder="지번 주소" />
        <input type="text" id="detailAddress" class="form-control mb-2" placeholder="상세 주소" />
        <input type="text" id="extraAddress" class="form-control mb-2" placeholder="참고 항목" />
        <input type="hidden" name="address" id="fullAddress" />
        <div id="guide" class="form-text text-muted" style="display: none;"></div>
        <form:errors path="address" cssClass="text-danger small" />
      </div>

      <div class="mb-3">
        <label class="form-label">생년월일</label>
        <input type="text" class="form-control" value="${selectedUser.birth}" readonly />
      </div>

      <button type="submit" id="modifyBtn" class="btn btn-primary">수정</button>
      <a href="userOne?userId=${selectedUser.userId}" class="btn btn-outline-secondary ms-2">뒤로</a>
    </form:form>
  </main>
	
	
	<!-- 카카오 주소API 호출을 위한 CDN주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                document.getElementById("jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
</body>
</html>