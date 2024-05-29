<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
width:1200px;
margin:auto;
margin-top:100px;
}

input[type=button]{
background:white;
width:150px;
height:40px;
cursor:pointer;
}

</style>
</head>
<body>
<section>
<div style="padding-bottom:10px;border-bottom:2px solid black;">
<div style="font-size:20px;font-weight:bold;">관리자 페이지</div>
</div>
<div style="display:flex;justify-content:space-between;margin-top:20px;">
<input type="button" value="회원 관리" onclick="location='member'">
<input type="button" value="구매 관리" onclick="location='gumaeList'">
<input type="button" value="상품 관리" onclick="location='productList'">
<input type="button" value="재고 관리" onclick="location='jegoList'">
<input type="button" value="문의 답변" onclick="location='proQuest'">
</div>

</section>
</body>
</html>