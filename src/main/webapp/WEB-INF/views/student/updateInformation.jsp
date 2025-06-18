<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 비밀번호 수정 페이지</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        background-color: #f5f6fa;
        color: #333;
    }

    .container {
        max-width: 600px;
        margin: 50px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    h1 {
        text-align: center;
        color: #007acc;
        margin-bottom: 30px;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        font-weight: bold;
        margin-top: 15px;
        margin-bottom: 5px;
    }

    input[type="password"] {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    button {
        margin-top: 30px;
        padding: 12px;
        background-color: #007acc;
        color: #fff;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    button:hover {
        background-color: #005f99;
    }
</style>
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
        <h1>비밀번호 수정</h1>
        <form id="updateForm" method="post" action="/student/updateInformation">
            <input type="hidden" value="${user.userId}" id="userId" name="userId">

            <label for="currentPw">현재 비밀번호</label>
            <input type="password" id="currentPw" name="currentPw">

            <label for="updatePw">새 비밀번호</label>
            <input type="password" id="updatePw" name="updatePw">

            <label for="updatePw2">새 비밀번호 확인</label>
            <input type="password" id="updatePw2">

            <button type="button" id="updateBtn">비밀번호 수정</button>
        </form>
    </div>
</body>
</html>