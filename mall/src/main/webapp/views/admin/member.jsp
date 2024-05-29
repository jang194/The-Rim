<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
width:1150px;
margin:auto;
margin-top:100px;
}

#adminbtn input[type=button]{
	background:white;
	width:150px;
	height:40px;
	cursor:pointer;
	}
</style>
</head>
<body>
<div id="adminbtn" style="display:flex;justify-content:space-between;margin:auto;margin-top:100px;width:1000px;">
<input type="button" value="회원 관리" onclick="location='member'" style="background:black;color:white;font-weight:900;">
<input type="button" value="구매 관리" onclick="location='gumaeList'">
<input type="button" value="상품 관리" onclick="location='productList'">
<input type="button" value="재고 관리" onclick="location='jegoList'">
<input type="button" value="문의 답변" onclick="location='proQuest'">
</div>
<section>
<div style="border-bottom:2px solid black;">
<div style="padding-bottom:20px;border-bottom:2px solid black;font-size:20px;font-weight:bold;" align="center">회원관리</div>
<div style="display:flex;justify-content:start;padding-top:5px;padding-bottom:5px" align="center">
<div style="width:150px;">아이디</div>
<div style="width:150px;">이름</div>
<div style="width:200px;">전화번호</div>
<div style="width:200px;">이메일</div>
<div style="width:200px;">가입일</div>
<div style="width:100px;">구매건수</div>
<div style="width:150px;">적립금</div>
</div>
<c:forEach items="${mlist}" var="mvo">
<div style="display:flex;justify-content:start;padding-top:5px;padding-bottom:5px;border-top:1px solid #747474;" align="center">
<div style="width:150px;">${mvo.userid}</div>
<div style="width:150px;">${mvo.name}</div>
<div style="width:200px;">${mvo.phone }</div>
<div style="width:200px;">${mvo.email}</div>
<div style="width:200px;">${mvo.writeday }</div>
<div style="width:100px;">${mvo.cnt}건</div>
<div style="width:150px;"><fmt:formatNumber type="number" value="${mvo.juk}"/>원</div>
</div>
</c:forEach>
</div>
</section>
</body>
</html>