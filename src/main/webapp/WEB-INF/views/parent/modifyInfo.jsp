<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file ="/WEB-INF/views/layout/header.jsp" %>
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
	<h1>개인정보 수정</h1>
	<form id="updateForm" method="post" action="/parent/modifyInfo">
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
	
	<h2>자녀 정보</h2>
	<c:if test="${not empty studentInfo}">
		이름 : <input type="text" value="${studentInfo.studentName}" readonly="readonly"><br>
		생년월일 : <input type="text" value="${studentInfo.studentBirth}" readonly="readonly"><br>
		이메일 : <input type="text" value="${studentInfo.studentEmail}" readonly="readonly"><br>
		주소 : <input type="text" value="${studentInfo.studentAddress}" readonly="readonly"><br>
		전화번호 : <input type="text" value="${studentInfo.studentPhone}" readonly="readonly"><br>
	</c:if>
</body>
</html>