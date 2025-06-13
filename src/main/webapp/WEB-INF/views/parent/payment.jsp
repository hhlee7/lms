<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>카드 결제</h2>
	
<div>
    <!-- 카드사 선택 -->
    <label for="cardCompany">카드사:</label>
    <select name="cardCompany" id="cardCompany" required>
        <option value="">-- 카드사를 선택하세요 --</option>
        <option value="삼성">삼성카드</option>
        <option value="신한">신한카드</option>
        <option value="국민">국민카드</option>
        <option value="현대">현대카드</option>
        <option value="하나">하나카드</option>
    </select>
    <br><br>

    <!-- 카드 번호 -->
    <label for="cardNumber">카드 번호:</label>
    <input type="text" id="cardNumber" name="cardNumber" placeholder="1234-5678-9012-3456" required>
    <br><br>

    <!-- 유효기간 -->
    <label for="expiry">유효기간:</label>
    <input type="text" id="expiry" name="expiry" placeholder="MM/YY" required>
    <br><br>

    <!-- CVC -->
    <label for="cvc">CVC:</label>
    <input type="text" id="cvc" name="cvc" placeholder="123" required>
    <br><br>
    
    <!-- 비밀번호 앞 2자리 -->
    <label for="pw">비밀번호 앞 2자리:</label>
    <input type="password" id="pw" name="pw" placeholder="**" required>
    <br><br>

    <!-- 카드 소유자 이름 -->
    <label for="cardHolder">소유자 이름:</label>
    <input type="text" id="cardHolder" name="cardHolder" placeholder="홍길동" required>
    <br><br>
</div>

<form method="post" action="/parent/payment">
	<input type="hidden" name="lectureId" value="${lectureId}">
    <input type="hidden" name="studentId" value="${studentId}">
    <input type="hidden" name="amount" value="${amount}">
    <button type="submit">결제하기</button>
</form>
</body>
</html>