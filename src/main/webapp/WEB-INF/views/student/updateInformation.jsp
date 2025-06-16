<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 비밀번호 수정 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#updateBtn").click(function() {
			if ($('#currentPw').val() == '') {
				alert('비밀번호를 입력해주세요');
				return;
			}
			
			if ($('#updatePw').val() == '') {
				alert('새 비밀번호를 입력해주세요');
				return;
			}
			
			if ($('#updatePw2').val() == '') {
				alert('새 비밀번호 확인을 입력해주세요');
				return;
			}
			
			if ($('#updatePw').val() !== $('#updatePw2').val()) {
				alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
				$('#updatePw').val('');
				$('#updatePw2').val('');
				return;
			}
			
			$.ajax({
				url:"/checkPw/" + $('#userId').val() + "/" + $('#currentPw').val()
				, type: 'get'
				, success: function(data) {
					if (data == true) {
						if ($('#currentPw').val() === $('#updatePw').val()) {
							alert('현재 비밀번호와 새 비밀번호가 동일합니다. 다른 비밀번호를 입력해주세요');
							$('#updatePw').val('');
							return;
						}
						$('#updateForm').submit();
					} else {
						alert('현재 비밀번호가 틀렸습니다.');
						$('#currentPw').val('');
						$('#updatePw').val('');
						$('#updatePw2').val('');
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
	
	<form id="updateForm" method="post" action="/student/updateInformation">
		<input type="hidden" value="${user.userId}" id="userId" name="userId"> 
		비밀번호: <input type="password" id="currentPw" name="currentPw"><br>
		새 비밀번호: <input type="password" id="updatePw" name="updatePw"><br>
		새 비밀번호 확인: <input type="password" id="updatePw2"><br>	
		<button type="button" id="updateBtn">비밀번호 수정</button>
	</form>
</body>
</html>