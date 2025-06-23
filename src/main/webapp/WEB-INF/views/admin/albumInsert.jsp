<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>앨범 등록</title>
  <%@ include file="/WEB-INF/views/common/common-style.jsp" %>
</head>
<body>

<main class="main-content container mt-4">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="fw-bold">앨범 등록</h2>
    <a href="/admin/albumManagement" class="btn btn-secondary">뒤로가기</a>
  </div>

  <form action="albumInsert" method="post" id="album" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="title" class="form-label">제목</label>
      <input type="text" id="title" name="title" class="form-control" placeholder="앨범 제목을 입력하세요">
    </div>

    <div class="mb-3">
      <label for="lectureId" class="form-label">수업</label>
      <select id="lectureId" name="lectureId" class="form-select">
        <c:forEach items="${lectureList}" var="lec">
          <option value="${lec.lectureId}">
            [${lec.subjectName} ${lec.lectureId}기] ${lec.dayOfWeek}요일 ${lec.startTime} ~ ${lec.endTime}
          </option>
        </c:forEach>
      </select>
    </div>

    <div class="mb-3">
      <label for="description" class="form-label">설명</label>
      <textarea name="description" id="description" class="form-control" rows="4" placeholder="앨범 설명을 입력하세요"></textarea>
    </div>

    <div class="mb-3">
	  <label for="photoFiles" class="form-label">사진 업로드</label>
	  <input type="file" name="photoFiles" id="photoFiles" class="form-control" multiple>
	  <div class="form-text">여러 개의 파일을 선택하려면 Ctrl 또는 Shift 키를 누른 채 선택하세요.</div>
	</div>

   	<button type="button" class="btn btn-success" id="addBtn">등록</button>
  </form>
</main>

<script>
  $('#addBtn').on('click', function () {
    // 제목 검사
    if ($('#title').val().trim() === '') {
      alert('제목을 입력하세요.');
      return;
    }

    // 파일 업로드 검사
    const files = $('#photoFiles')[0].files;
    if (!files || files.length === 0) {
      alert('사진 파일을 최소 1개 이상 선택해주세요.');
      return;
    }

    // 이상 없으면 제출
    $('#album').submit();
  });
</script>

</body>
</html>
