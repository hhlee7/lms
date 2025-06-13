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
				alert('바꿀 비밀번호를 입력해주세요');
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
		<input type="hidden" value="${loginUser.userId}" id="userId" name="userId"> 
		이름 : <input type="text" value="${loginUser.userName}" readonly="readonly"><br>
		생년월일 : <input type="text" value="${loginUser.birth}" readonly="readonly"><br>
		이메일 : <input type="text" value="${loginUser.email}" readonly="readonly"><br>
		주소 : <input type="text" value="${loginUser.address}" readonly="readonly"><br>
		전화번호 : <input type="text" value="${loginUser.phone}" readonly="readonly"><br>
		비밀번호: <input type="password" id="currentPw" name="currentPw"><br>
		비밀번호 수정: <input type="password" id="updatePw" name="updatePw"><br>
		
		<button type="button" id="updateBtn">비밀번호 수정</button>
	</form>
</body>
</html>