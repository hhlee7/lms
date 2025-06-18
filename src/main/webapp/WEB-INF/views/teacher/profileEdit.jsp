<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>개인정보 수정</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 600px;
      margin: 80px auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 24px;
      color: #222;
    }

    form p {
      margin-bottom: 15px;
      font-size: 16px;
      color: #333;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px 12px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      box-sizing: border-box;
      margin-top: 6px;
    }

    hr {
      margin: 30px 0;
      border: none;
      border-top: 1px solid #eee;
    }

    .btn-group {
      display: flex;
      justify-content: center;
      gap: 12px;
      margin-top: 30px;
    }

    button {
      background-color: #00cfe8;
      color: white;
      border: none;
      padding: 12px 20px;
      font-size: 15px;
      font-weight: 500;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    button:hover {
      background-color: #00b8cf;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
	$(document).ready(function () {		
	// 수정 버튼 눌렀음
	$('#modifyBtn').click(function(){
		const postcode = $('#postcode').val();
		const roadAddress = $('#roadAddress').val();
		const jibunAddress = $('#jibunAddress').val();
		const detailAddress = $('#detailAddress').val();
		const extraAddress = $('#extraAddress').val();

		const address = postcode + " " + roadAddress + " " + jibunAddress + " " + detailAddress + " " + extraAddress;
		// hidden input에 넣기
		$('#fullAddress').val(address);
		$('#editForm').submit();
		
		});
	});
    window.onload = function () {
      const success = '${success}';
      const error = '${error}';

      if (success) alert(success);
      if (error) alert(error);
    };
  </script>
</head>
<body>
  <div class="container">
    <h2>개인정보 수정</h2>
    <form name="editForm" id="editForm" method="post" action="/teacher/profile/edit">
      <p>이름: ${teacher.name}</p>
      <p>생년월일: ${teacher.birth}</p>
      <p>최종학력: ${teacher.lastEducation}</p>
      <p>이력: ${teacher.personalHistory}</p>

      <p>전화번호:  
        <input type="text" name="phone" value="${teacher.phone}" />
      </p>
      <p>주소:  
        <input type="text" name="address" value="${teacher.address}" />
        <input type="hidden" id="fullAddress" name="fullAddress"/>
        <div class="row g-2 mb-2">
          <div class="col-4">
            <input type="text" id="postcode" class="form-control" placeholder="우편번호" />
          </div>
          <div class="col-auto">
            <button type="button" class="btn btn-secondary" onclick="execDaumPostcode()">우편번호 찾기</button>
          </div>
        </div>
        <input type="text" id="roadAddress" class="form-control mb-2" placeholder="도로명 주소" />
        <input type="text" id="jibunAddress" class="form-control mb-2" placeholder="지번 주소" />
        <input type="text" id="detailAddress" class="form-control mb-2" placeholder="상세 주소" />
        <input type="text" id="extraAddress" class="form-control mb-2" placeholder="참고 항목" />
        <input type="hidden" name="address" id="fullAddress" />
        <div id="guide" class="form-text text-muted" style="display: none;"></div>
      </p>

      <hr>

      <p>현재 비밀번호:  
        <input type="password" name="currentPassword" />
      </p>
      <p>새 비밀번호:  
        <input type="password" name="newPassword" />
      </p>
      <p>새 비밀번호 확인:  
        <input type="password" name="confirmPassword" />
      </p>

      <div class="btn-group">
        <button type="button" id="modifyBtn" name="modifyBtn">✏️ 수정하기</button>
        <button type="button" onclick="history.back()">🔙 뒤로가기</button>
      </div>
    </form>
  </div>
  
  <!-- 카카오 주소API 호출을 위한 CDN주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                document.getElementById("jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>
</body>
</html>
