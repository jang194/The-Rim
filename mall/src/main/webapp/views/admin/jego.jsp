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
	margin-top:50px;
	}

</style>
<script>
	function jegoOk()
	{
		var color = document.pform.color.value;
		var size = document.pform.size.value;
		var su = document.pform.su.value;
			
			
			var chk = new XMLHttpRequest();
			chk.onload=function()
			{
	 			if(chk.responseText==1)
	 			{
	 				alert("이미 재고가 존재합니다.");
	 			}
	 			else
	 			{
					alert("재고가 등록 되었습니다");
				}
			}
		
			chk.open("get","jegoOk?pimg=${pvo.pimg}&cimg=${pvo.cimg}&title=${pvo.title}&pcode=${pvo.pcode}&color="+color+"&size="+size+"&su="+su);
		
			chk.send();
		
		
		
	}


</script>

</head>
<body>
<section>
<form method="post" action="jegoOk" name="pform" enctype="multipart/form-data">
<input type="hidden" name="title" value="${pvo.title}">
<input type="hidden" name="pcode" value="${pvo.pcode}">
<input type="hidden" name="pimg" value="${pvo.pimg }">
<input type="hidden" name="cimg" value="${pvo.cimg }">
	<table width="1000" align="center" style="border-collapse: collapse;">
	  <caption><h2>재고 등록</h2></caption>
	
	
	  <tr>
	  	<td>상품 사진</td>
	  	<td><img src="/static/product/${pvo.pimg}" width="200" style="margin-top:50px;margin-left:50px;"></td>
	  	<td><img src="/static/product/${pvo.cimg}" width="200" style="margin-top:50px;"></td>
	  </tr>
	  <tr>
	  	<td height="50">상품명</td>
	  	<td><span  style="margin-left:50px;">${pvo.title}</span></td>
	  </tr>
	  <tr>
	  	<td>상품가격</td>
	  	<td><span  style="margin-left:50px;"><fmt:formatNumber type="number" value="${pvo.price}" />원</span></td>
	  </tr>
	  <tr height="50">
	  	<td>색상</td>
	  	<td>
	  	<span  style="margin-left:50px;">
	  		<select name="color">
					<option value="">색상</option>
					<option value="0">흰색</option>
					<option value="1">검정</option>
					<option value="2">네이비</option>
					<option value="3">그외</option>
				</select>
				</span>
	  	</td>
	  </tr>
	  <tr>
	  	<td>사이즈</td>
	  	<td>
	  	<span  style="margin-left:50px;">
	  	  <select name="size">
				<option value="">사이즈</option>
				<option value="0">95</option>
				<option value="1">100</option>
				<option value="2">105</option>
				<option value="3">110</option>
				<option value="4">115</option>
				<option value="5">120</option>
		  </select>
		  </span>
	  	</td>
	  </tr>
	  <tr height="50">
	  	<td>수량</td>
	  	<td>
	  	<span  style="margin-left:50px;">
	  	<input type="text" name="su">
	  	</span></td>
	  </tr>
	</table>
	<div align="center" style="margin-top:30px;">
	  	<input type="button" style="width:150px;height:40px;font-weight:900;color:white;background:black;border:1px solid black;cursor:pointer" value="재고 등록" onclick="jegoOk()">
	  	&nbsp&nbsp&nbsp
	  	<input type="button" style="width:150px;height:40px;font-weight:900;color:white;background:black;border:1px solid black;cursor:pointer" value="상품 목록" onclick="location='productList'">
	  	</div>
</form>
</section>
</body>
</html>