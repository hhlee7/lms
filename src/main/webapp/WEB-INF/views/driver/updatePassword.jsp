<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기사 비밀번호 수정 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f3f6fb;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 500px;
        margin: 60px auto;
        background-color: #fff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 8px;
        color: #333;
    }

    .form-group input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
        font-size: 14px;
    }

    .form-actions {
        text-align: center;
        margin-top: 30px;
    }

    #updateBtn {
        background-color: #4CAF50;
        color: white;
        padding: 12px 24px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    #updateBtn:hover {
        background-color: #45a049;
    }

</style>
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
							$('#updatePw2').val('');
							return;
						}
						
						const confirmChange = confirm("비밀번호를 변경하시겠습니까?");
                    	if (confirmChange) {
                        	$('#updateForm').submit();  // 예 -> 전송
                    	} else {
                        	alert("비밀번호 변경이 취소되었습니다.");  // 아니오 -> 메시지 출력만 하고 멈춤
                        	$('#currentPw').val('');
                        	$('#updatePw').val('');
							$('#updatePw2').val('');
                        	return;
                    	}
                    	
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

	<div class="container">
		<h2>🔐 비밀번호 수정</h2>
		<form id="updateForm" method="post" action="/driver/updatePassword">
			<input type="hidden" value="${user.userId}" id="userId" name="userId"> 

			<div class="form-group">
				<label for="currentPw">현재 비밀번호</label>
				<input type="password" id="currentPw" name="currentPw">
			</div>

			<div class="form-group">
				<label for="updatePw">새 비밀번호</label>
				<input type="password" id="updatePw" name="updatePw">
			</div>

			<div class="form-group">
				<label for="updatePw2">새 비밀번호 확인</label>
				<input type="password" id="updatePw2">
			</div>

			<div class="form-actions">
				<button type="button" id="updateBtn">비밀번호 수정</button>
			</div>
		</form>
	</div>
</body>
</html>