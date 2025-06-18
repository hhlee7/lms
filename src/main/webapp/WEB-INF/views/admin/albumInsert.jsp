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
    <h2 class="fw-bold">📁 앨범 등록</h2>
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
            [${lec.subjectName}] ${lec.dayOfWeek}요일 ${lec.startTime} ~ ${lec.endTime}
          </option>
        </c:forEach>
      </select>
    </div>

    <div class="mb-3">
      <label for="description" class="form-label">설명</label>
      <textarea name="description" id="description" class="form-control" rows="4" placeholder="앨범 설명을 입력하세요"></textarea>
    </div>

    <div class="mb-3">
      <label class="form-label d-block">사진 업로드</label>
      <button type="button" class="btn btn-outline-primary mb-2" id="appendFile">파일 추가</button>
      <div id="fileDiv" class="d-flex flex-column gap-2">
        <input type="file" name="photoFiles" class="form-control photoFile">
      </div>
    </div>

    <button type="button" class="btn btn-success" id="addBtn">등록</button>
  </form>
</main>

<script>
  $('#appendFile').on('click', function () {
    let hasEmpty = false;

    $('.photoFile').each(function () {
      if ($(this).val() === '') {
        alert('비어 있는 파일 입력란이 있습니다.');
        hasEmpty = true;
        return false;
      }
    });

    if (hasEmpty) return;

    const newInput = $('<input type="file" name="photoFiles" class="form-control photoFile">');
    $('#fileDiv').append(newInput);
  });

  $('#addBtn').on('click', function () {
    if ($('#title').val().trim() === '') {
      alert('제목을 입력하세요.');
      return;
    }

    $('.photoFile').each(function () {
      if ($(this).val() === '') {
        $(this).remove();
      }
    });

    $('#album').submit();
  });
</script>

</body>
</html>
