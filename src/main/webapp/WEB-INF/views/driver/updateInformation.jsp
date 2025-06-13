<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 개인정보 수정 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
$(function() {
	$("#updateBtn").click(function() {
		
		// 이메일 유효성 검사
		const email = $('#email').val();
		const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		if (!emailPattern.test(email)) {
			alert('잘못된 이메일 형식입니다. @와 .을 포함해 주세요.');
			return;
		}

		// 전화번호 유효성 검사 (000-0000-0000 or 000-1111-1111 등)
		const phone = $('#phone').val();
		const phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
		if (!phonePattern.test(phone)) {
			alert('잘못된 전화번호 형식입니다. 예: 010-1234-5678');
			return;
		}
		
		if ($('#password').val() == '') {
			alert('비밀번호를 입력해주세요');
			return;
		}
		
		$.ajax({
			url:"/checkPw/" + $('#userId').val() + "/" + $('#password').val()
			, type: 'get'
			, success: function(data) {
				if (data == true) {
					$('#updateForm').submit();
				} else {
					alert('현재 비밀번호가 틀렸습니다.');
					$('#password').val('');
				}
			}
		});
	});
});
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	
	<form id="updateForm" method="post" action="/driver/updateInformation">
		<input type="hidden" value="${user.userId}" id="userId" name="userId"> 
		이름 : <input type="text" value="${user.userName}" readonly="readonly"><br>
		생년월일 : <input type="text" value="${user.birth}" readonly="readonly"><br>
		이메일 : <input type="text" id="email" name="email" value="${user.email}"><br>
		주소 : <input type="text" id="address" name="address" value="${user.address}"><br>
		전화번호 : <input type="text" id="phone" name="phone" value="${user.phone}"><br>
		비밀번호: <input type="password" id="password" name="password"><br>
		
		<button type="button" id="updateBtn">개인정보 수정</button>
	</form>
</body>
</html>