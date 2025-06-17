<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>materialManagement</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#materialTitle').on('input', function() {
			// 입력값이 비어 있지 않으면 에러 메시지 제거
			if($(this).val().trim() != '') {
				$('#materialTitleCheck').text('');
			}
		});
		
		$('#totalCount').on('input', function() {
			// 입력값이 비어 있지 않으면 에러 메시지 제거
			if($(this).val().trim() != '') {
				$('#totalCountCheck').text('');
			}
		});
		
		// 폼 제출되기 전 유효성 검사 수행
		$('#materialForm').submit(function(e) {
			const materialTitle = $('#materialTitle').val().trim();
			const totalCount = $('#totalCount').val();
			const usedCount = $('#usedCount').val();
			
			// 교보재 이름 유효성 검사
			if(materialTitle == '') {
				$('#materialTitleCheck').css('color', 'red').text('폼목을 입력하세요.');
				e.preventDefault();
				return;
			}
			
			// 교보재 개수 유효성 검사
			if(totalCount == '' || isNaN(totalCount) || totalCount <= 0) {
				$('#totalCountCheck').css('color', 'red').text('개수는 1개 이상이어야 합니다.');
				e.preventDefault();
				return;
			}
		});
	});
</script>
</head>
<body>
	<h1>교보재 관리</h1>
	
	<h2>교보재 등록</h2>
	<form method="post" name="materialForm" id="materialForm" action="/admin/createMaterial">
		<table border="1">
		<tr>
			<th>수업</th>
			<td>
				<select name="lectureId" id="lectureId">
					<c:forEach var="list" items="${list}">
						<option value="${list.lectureId}">${list.lectureId}(${list.subjectName})</option>
					</c:forEach>
				</select>
			</td>
		<tr>
			<th>품목</th>
			<td>
				<input type="text" name="materialTitle" id="materialTitle">
				<span id="materialTitleCheck" style="color:red; margin-left:10px;"></span>
			</td>
		</tr>
		<tr>
			<th>개수</th>
			<td>
				<input type="number" name="totalCount" id="totalCount">
				<span id="totalCountCheck" style="color:red; margin-left:10px;"></span>
			</td>
		</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>