<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 비밀번호 수정 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
	body {
		margin: 120px 0 40px;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f9f9f9;
		color: #333;
		display: flex;
		justify-content: center;
	}

	.container {
		width: 100%;
		max-width: 600px;
		padding: 0 20px;
	}

	h1, h2 {
		text-align: center;
		color: #2c3e50;
		margin-bottom: 20px;
		cursor: pointer;
	}

	form, #childInfo {
		background: #fff;
		padding: 20px;
		border-radius: 8px;
		box-shadow: 0 4px 12px rgba(0,0,0,0.05);
		margin-bottom: 30px;
	}

	input {
		padding: 8px;
		margin: 8px 0;
		width: 100%;
		border: 1px solid #ccc;
		border-radius: 6px;
		box-sizing: border-box;
	}

	button {
		width: 100%;
		padding: 10px;
		background-color: #0077cc;
		color: white;
		border: none;
		border-radius: 6px;
		cursor: pointer;
		font-weight: bold;
		margin-top: 10px;
	}

	button:hover {
		background-color: #005fa3;
	}

	.toggle-header {
		text-align: center;
		color: #0077cc;
		text-decoration: underline;
	}
</style>

<script>
	$(function() {
		// 비밀번호 수정 처리
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
				url: "/checkPw/" + $('#userId').val() + "/" + $('#currentPw').val(),
				type: 'get',
				success: function(data) {
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

		// 자녀정보 토글
		$("#childToggle").click(function() {
			$("#childInfo").slideToggle();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h1>개인정보 수정</h1>

		<form id="updateForm" method="post" action="/parent/modifyInfo">
			<input type="hidden" value="${loginUser.userId}" id="userId" name="userId">
			이름 : <input type="text" value="${loginUser.userName}" readonly><br>
			생년월일 : <input type="text" value="${loginUser.birth}" readonly><br>
			이메일 : <input type="text" value="${loginUser.email}" readonly><br>
			주소 : <input type="text" value="${loginUser.address}" readonly><br>
			전화번호 : <input type="text" value="${loginUser.phone}" readonly><br>
			비밀번호: <input type="password" id="currentPw" name="currentPw"><br>
			비밀번호 수정: <input type="password" id="updatePw" name="updatePw"><br>

			<button type="button" id="updateBtn">비밀번호 수정</button>
		</form>

		<h2 id="childToggle" class="toggle-header">자녀 정보 보기</h2>

		<div id="childInfo" style="display:none;">
			<c:if test="${not empty studentInfo}">
				이름 : <input type="text" value="${studentInfo.studentName}" readonly><br>
				생년월일 : <input type="text" value="${studentInfo.studentBirth}" readonly><br>
				이메일 : <input type="text" value="${studentInfo.studentEmail}" readonly><br>
				주소 : <input type="text" value="${studentInfo.studentAddress}" readonly><br>
				전화번호 : <input type="text" value="${studentInfo.studentPhone}" readonly><br>
			</c:if>
		</div>
	</div>
</body>
</html>
