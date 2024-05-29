<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
	width:1600px;
	margin:auto;
	margin-top:100px;
	padding-left:50px;
	}
	#adminbtn input[type=button]{
	background:white;
	width:150px;
	height:40px;
	cursor:pointer;
	}
</style>
<script>

function jegoFirst(pcode,pimg,cimg,color,size,title)
	{
		location="jegoFirst?pcode="+pcode+"&pimg="+pimg+"&cimg="+cimg+"&color="+color+"&size="+size+"&title="+title;
	}

</script>
</head>
<body>
<div id="adminbtn" style="display:flex;justify-content:space-between;margin:auto;margin-top:100px;width:1000px;">
<input type="button" value="회원 관리" onclick="location='member'">
<input type="button" value="구매 관리" onclick="location='gumaeList'">
<input type="button" value="상품 관리" onclick="location='productList'" style="background:black;color:white;font-weight:900;">
<input type="button" value="재고 관리" onclick="location='jegoList'">
<input type="button" value="문의 답변" onclick="location='proQuest'">
</div>
<section>
<table width="1600" align="center" style="border-collapse:collapse;">
<caption style="margin-top:0px;padding-bottom:20px;border-bottom:2px solid black"><span style="font-size:20px;font-weight:bold;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp상품 목록</span>&nbsp&nbsp&nbsp&nbsp&nbsp <span width="50"><input type="button" value="등록" onclick="location='productAdd'" style="background:black;color:white;font-weight:900;width:80px;height:35px;" ></span></caption>
<tr align="center" style="border-bottom:1px solid #747474;height:30px;">
	<td width="200">상품명</td>
	<td width="120">상품그림</td>
	<td width="50">가격</td>
	<td width="100">할인율</td>
	<td width="100">배송비</td>
	<td width="100">배송기간</td>
	<td width="100">적립률</td>
	<td width="100">등록일</td>
	<td width="100">재고 등록</td>
	
</tr>
	<c:forEach items="${plist}" var="pvo">
<tr align="center" style="border-bottom:1px solid #747474;">
	<td align="left">${pvo.title }</td>
	<td ><img src="/static/product/${pvo.pimg}" width="120" height="70"></td>
	<td>${pvo.price }원</td>
	<td>${pvo.halin }%</td>
	<td>${pvo.bprice }원</td>
	<td>${pvo.btime }일</td>
	<td>${pvo.juk }%</td>
	<td>${pvo.writeday }</td>
	<td><input type="button" value="재고 자동 등록" onclick="jegoFirst('${pvo.pcode}','${pvo.pimg}','${pvo.cimg}','${pvo.color}','${pvo.size}','${pvo.title}')"></td>
	
	<td width="50"><input type="button" value="재고 등록" onclick="location='jego?no=${pvo.no}'"></td>
	<td width="50"><input type="button" value="수정" onclick="location='ListUp?no=${pvo.no}'"></td>
	<td width="50"><input type="button" value="삭제" onclick="location='ListDel?no=${pvo.no}'"></td>
</tr>
	</c:forEach>

	
	<tr>
		<td colspan="14" align="center">
		<c:if test="${pstart!=1}">
		<a href="productList?page=${pstart-1}"><<</a>
		</c:if>
		<c:if test="${pstart==1}">
		<<
		</c:if>
		<c:if test="${page!=1}">
		<a href="productList?page=${page-1}"><</a>
		</c:if>
		<c:if test="${page==1}">
		<
		</c:if>
		
		<c:forEach begin="${pstart}" end="${pend}" var="i">
		<c:if test="${i==page}">
		<a href="productList?page=${i}" style="color:red">${i}</a>
		</c:if>
		<c:if test="${i!=page}">
		<a href="productList?page=${i}">${i}</a>
		</c:if>
		</c:forEach>
		
		<c:if test="${page==chong}">
		>
		</c:if>
		<c:if test="${page!=chong}">
		<a href="productList?page=${page+1}">></a>
		</c:if>
		<c:if test="${pend!=chong}">
		<a href="productList?page=${pend+1}">>></a>
		</c:if>
		<c:if test="${pend==chong}">
		>>
		</c:if>
	 <span><input type="button" value="등록" onclick="location='productAdd'"></span>
		</td>
	</tr>
</table>
</section>
<div style="height:100px;"></div>
</body>
</html>