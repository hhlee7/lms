<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원 추가</title>
	<%@ include file="/WEB-INF/views/common/common-style.jsp" %>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f3f4f6;
    }
    .container {
      max-width: 720px;
      margin: auto;
      background: white;
      padding: 30px;
      border-radius: 16px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
    }
    h1 {
      font-size: 1.875rem;
      font-weight: 700;
      text-align: center;
      margin-bottom: 30px;
      color: #111827; /* 검정색으로 변경 */
    }
    .form-label {
      font-weight: 600;
      margin-bottom: 6px;
      color: #374151;
    }
    .form-control {
      border-radius: 10px;
      padding: 10px 14px;
      border: 1px solid #cbd5e1;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .btn-primary {
      background-color: #3b82f6;
      border: none;
      border-radius: 10px;
      padding: 12px 20px;
      font-weight: 600;
    }
    .btn-primary:hover {
      background-color: #2563eb;
    }
    #checkEmailBtn {
      background-color: #3b82f6; /* 파란색 */
      border: none;
      border-radius: 8px;
      padding: 8px 14px;
      color: white;
      margin-left: 0; /* 왼쪽으로 붙임 */
      margin-top: 6px;
    }
    .email-input-group {
      display: flex;
      flex-wrap: wrap;
      align-items: flex-start;
      gap: 6px;
    }
    .error {
      color: #ef4444;
      font-size: 0.875rem;
      margin-top: 4px;
      display: block;
    }
    #roleFieldsArea .form-group {
      margin-top: 16px;
    }
    #roleFieldsArea .form-label {
      display: block;
      margin-bottom: 6px;
    }
    #studentId {
      width: 100%;
      border-radius: 10px;
      padding: 10px 14px;
      border: 1px solid #cbd5e1;
    }
    #postcode,
    #roadAddress,
    #jibunAddress,
    #detailAddress,
    #extraAddress {
      width: 100%;
      border-radius: 10px;
      padding: 10px 14px;
      border: 1px solid #cbd5e1;
      margin-bottom: 8px;
    }
    #fullAddress {
      display: none;
    }
    #guide {
      font-size: 0.875rem;
      margin-bottom: 8px;
    }
    input[type="button"] {
      background-color: #10b981;
      color: white;
      border: none;
      padding: 10px 16px;
      border-radius: 8px;
      margin-bottom: 10px;
    }
    select.role-select {
      border-radius: 10px;
      padding: 10px 14px;
      border: 1px solid #cbd5e1;
      width: 100%;
    }
  </style>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {

		// 역할 선택을 변경함
		$('#roleId').change(function () {
			let selectedRole = $(this).val();
			let roleFieldsHtml = '';
			if (selectedRole === '4') {
				roleFieldsHtml = `
				  <div class="form-group">
				    <label class="form-label">자녀 ID</label>
				    <input type="text" name="studentId" id="studentId" />
				  </div>`;
			}
			$('#roleFieldsArea').html(roleFieldsHtml);
		});
		
		// 추가 버튼 눌렀음
		$('#insertBtn').click(function(){
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

		// 이메일 형식 실시간 검사
		$('#email').on('input', function () {
		    const email = $(this).val().trim();

		    if (!emailRegex.test(email)) {
		        $('#checkResult').css('color', 'red').text('올바른 이메일 형식이 아닙니다.');
		    } else {
		        $('#checkResult').text('');
		    }
		});
		
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
	                    const userId = $('#email').val().split('@')[0];
	                    $('#userId').val(userId);
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
<body>

<main class="main-content">
  <div class="container">
    <h1>회원 추가</h1>
        <form:form action="userInsert" method="post" modelAttribute="user">
      <div class="form-group">
        <label class="form-label">역할</label>
        <form:select path="roleId" id="roleId" cssClass="role-select">
					    <form:options items="${roleList}" itemValue="roleId" itemLabel="roleName" />
					</form:select>
					<form:errors path="roleId" cssClass="error" />
      </div>

      <div class="form-group">
        <label class="form-label">이메일</label>
        <div class="email-input-group">
          <form:input path="email" cssClass="form-control" id="email" />
          <button type="button" id="checkEmailBtn">중복 검사</button>
        </div>
        <span id="checkResult"></span>
        <form:errors path="email" cssClass="error" />
      </div>

      <div class="form-group">
        <label class="form-label">아이디</label>
        <form:input path="userId" cssClass="form-control" />
        <form:errors path="userId" cssClass="error" />
      </div>

      <div class="form-group">
        <label class="form-label">비밀번호</label>
        <form:password path="password" cssClass="form-control" value="${uuid}" />
        <form:errors path="password" cssClass="error" />
      </div>

      <div class="form-group">
        <label class="form-label">이름</label>
        <form:input path="userName" cssClass="form-control" />
        <form:errors path="userName" cssClass="error" />
      </div>

      <div class="form-group">
        <label class="form-label">전화번호</label>
        <form:input path="phone" id="phone" cssClass="form-control" />
        <form:errors path="phone" cssClass="error" />
        <span id="phoneError" class="error"></span>
      </div>

      <div class="form-group">
        <label class="form-label">주소</label>
		<input type="text" name="postcode" id="postcode" placeholder="우편번호">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
		<input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
		<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
		<input type="hidden" name="address" id="fullAddress">
		<form:errors path="address" cssClass="error" />
      </div>

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

      <div class="form-group">
        <label class="form-label">생년월일</label>
        <form:input path="birth" type="date" cssClass="form-control" />
        <form:errors path="birth" cssClass="error" />
      </div>

      <div id="roleFieldsArea"></div>

      <div class="text-center">
        <button type="submit" id="insertBtn" class="btn btn-primary">추가</button>
      </div>
    </form:form>
    <a class="back-link" href="userManagement">뒤로가기</a>
  </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
