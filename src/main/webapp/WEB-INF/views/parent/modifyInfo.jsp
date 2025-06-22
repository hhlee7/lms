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
		margin: 0;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		background-color: #f0f2f5;
		color: #333;
	}

	.main-container {
		display: flex;
		justify-content: center;
		align-items: flex-start;
		min-height: calc(100vh - 100px); /* 헤더 제외 전체 높이 */
	}

	.form-wrapper {
		width: 100%;
		max-width: 600px;
		background: #fff;
		padding: 30px 40px;
		border-radius: 10px;
		box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	}

	h1, h2 {
		text-align: center;
		color: #2c3e50;
		margin-bottom: 20px;
		cursor: pointer;
	}

	label {
		display: block;
		margin-top: 12px;
		font-weight: bold;
	}

	input {
		padding: 10px;
		margin-top: 4px;
		width: 100%;
		border: 1px solid #ccc;
		border-radius: 6px;
		box-sizing: border-box;
		background-color: #fff;
	}

	input.readonly-field {
		background-color: #f5f5f5;
		cursor: not-allowed;
	}

	button {
		width: 100%;
		padding: 12px;
		background-color: #007bff;
		color: white;
		border: none;
		border-radius: 6px;
		cursor: pointer;
		font-weight: bold;
		font-size: 16px;
		margin-top: 20px;
	}

	button:hover {
		background-color: #0056b3;
	}

	.toggle-header {
		text-align: center;
		color: #0077cc;
		text-decoration: underline;
		margin-top: 30px;
		cursor: pointer;
	}

	#childInfo {
		margin-top: 20px;
	}
</style>

<script>
	$(function() {
		// 비밀번호 수정 처리
		$("#updateBtn").click(function() {
			const userId = $('#userId').val();
			const currentPw = $('#currentPw').val();
			const updatePw = $('#updatePw').val();

			if (currentPw.trim() === '') {
				alert('현재 비밀번호를 입력해주세요.');
				return;
			}
			if (updatePw.trim() === '') {
				alert('새 비밀번호를 입력해주세요.');
				return;
			}

			$.ajax({
				url: "/checkPw/" + userId + "/" + currentPw,
				type: 'get',
				success: function(data) {
					if (data == true) {
						if (currentPw === updatePw) {
							alert('현재 비밀번호와 새 비밀번호가 동일합니다.\n다른 비밀번호를 입력해주세요.');
							$('#updatePw').val('');
							return;
						}
						$('#updateForm').submit();
					} else {
						alert('현재 비밀번호가 틀렸습니다.');
						$('#currentPw').val('');
						$('#updatePw').val('');
					}
				},
				error: function() {
					alert('서버 오류가 발생했습니다.');
				}
			});
		});

		// 자녀 정보 보기 토글
		$("#childToggle").click(function() {
			$("#childInfo").slideToggle();
		});
	});
</script>
</head>
<body>
	<div class="main-container">
		<div class="form-wrapper">
			<h1>개인정보 수정</h1>

			<form id="updateForm" method="post" action="/parent/modifyInfo">
				<input type="hidden" value="${loginUser.userId}" id="userId" name="userId">

				<label>이름</label>
				<input type="text" value="${loginUser.userName}" readonly class="readonly-field">

				<label>생년월일</label>
				<input type="text" value="${loginUser.birth}" readonly class="readonly-field">

				<label>이메일</label>
				<input type="text" value="${loginUser.email}" readonly class="readonly-field">

				<label>주소</label>
				<input type="text" value="${loginUser.address}" readonly class="readonly-field">

				<label>전화번호</label>
				<input type="text" value="${loginUser.phone}" readonly class="readonly-field">

				<label>현재 비밀번호</label>
				<input type="password" id="currentPw" name="currentPw" placeholder="현재 비밀번호 입력">

				<label>새 비밀번호</label>
				<input type="password" id="updatePw" name="updatePw" placeholder="새 비밀번호 입력">

				<button type="button" id="updateBtn">비밀번호 수정</button>
			</form>

			<h2 id="childToggle" class="toggle-header">자녀 정보 보기</h2>

			<div id="childInfo" style="display:none;">
				<c:if test="${not empty studentInfo}">
					<label>이름</label>
					<input type="text" value="${studentInfo.studentName}" readonly class="readonly-field">

					<label>생년월일</label>
					<input type="text" value="${studentInfo.studentBirth}" readonly class="readonly-field">

					<label>이메일</label>
					<input type="text" value="${studentInfo.studentEmail}" readonly class="readonly-field">

					<label>주소</label>
					<input type="text" value="${studentInfo.studentAddress}" readonly class="readonly-field">

					<label>전화번호</label>
					<input type="text" value="${studentInfo.studentPhone}" readonly class="readonly-field">
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
