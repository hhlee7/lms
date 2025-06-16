<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>앨범 등록 페이지</h1>
	<a href="/admin/albumManagement">뒤로</a>

	<form action="albumInsert" method="post" name="album" id="album" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" id="title" name="title"></td>
			</tr>
			<tr>
				<th>수업</th>
				<td>
					<select id="lectureId" name="lectureId">
						<c:forEach items="${lectureList}" var="lec">
							<option value="${lec.lectureId}">[${lec.subjectName}] ${lec.dayOfWeek}요일 ${lec.startTime} ~ ${lec.endTime}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>설명</th>
				<td><textarea name="description" id="description" rows="5" cols="50"></textarea></td>
			</tr>
			<tr>
				<th>파일</th>
				<td>
					<div>
						<button type="button" id="appendFile">파일 추가</button>
					</div>
					<div id="fileDiv">
						<input type="file" name="photoFiles" class="photoFile">
					</div>
				</td>
			</tr>
		</table>
		<button type="button" id="addBtn">입력</button>
	</form>

	<script>
		document.querySelector('#appendFile').addEventListener('click', () => {
			let flag = false;

			// 비어 있는 파일 input이 있는지 확인
			document.querySelectorAll('.photoFile').forEach(e => {
				if (e.value === '') {
					alert('첨부하지 않은 파일이 있습니다.');
					flag = true;
					return;
				}
			});
			if (flag) return;

			// 새 input 추가
			let inputFile = document.createElement('input');
			inputFile.setAttribute('type', 'file');
			inputFile.setAttribute('name', 'photoFiles'); // 배열 형태로 전달
			inputFile.setAttribute('class', 'photoFile');
			document.querySelector('#fileDiv').appendChild(inputFile);
		});

		document.querySelector('#addBtn').addEventListener('click', () => {
			if (document.querySelector('#title').value.trim() === '') {
				alert('제목을 입력하세요.');
				return;
			}

			// 비어 있는 파일 input 제거
			document.querySelectorAll('.photoFile').forEach(e => {
				if (e.value === '') {
					e.remove();
				}
			});

			document.querySelector('#album').submit();
		});
	</script>
</body>
</html>
