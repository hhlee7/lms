<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
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
	});
</script>
</head>
<body>
	<h1>관리자 회원 수정 페이지</h1>
	<form:form action="userModify" method="post" modelAttribute="user">
		<input type="hidden" id="userId" name="userId" value="${selectedUser.userId}"/>
		<table border="1">
			<tr>
				<td>역할</td>
				<td>
					${selectedUser.roleName}
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<form:input path="email" value="${selectedUser.email}"/>
					<button type="button" id="checkEmailBtn">중복 검사</button>
			        <span id="checkResult" style="color:red; margin-left:10px;"></span>
					<form:errors path="email" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					${selectedUser.userName}
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
					<form:input path="phone" value="${selectedUser.phone}"/>
					<form:errors path="phone" cssClass="error" />
					<span id="phoneError"></span>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<span>${selectedUser.address}</span>
					<br>
					<input type="text" name="postcode" id="postcode" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소">
					<input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
					<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
					<input type="hidden" name="address" id="fullAddress">
					<form:errors path="address" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${selectedUser.birth}</td>
			</tr>
		</table>
		<button type="submit" id="modifyBtn" name="modifyBtn">수정</button>
	</form:form>
	<a href="userOne?userId=${selectedUser.userId}">뒤로</a>
	
	
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