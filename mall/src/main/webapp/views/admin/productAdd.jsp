<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
	margin-top:100px;
	}
	

</style>
<script>
	function getJung(daecode)
	{
		var chk = new XMLHttpRequest();
		chk.onload=function()
		{
			document.getElementById("jung").innerHTML=chk.responseText;
		}
		
		chk.open("get","getJung?daecode="+daecode);
		
		chk.send();
	}
	
	function getPcode()
	{
		var dae = document.pform.dae.value;
		var jung = document.pform.jung.value;
		var pcode = "p"+dae+jung;
		
		var chk = new XMLHttpRequest();
		chk.onload=function()
		{
			pcode = pcode+chk.responseText;
			document.pform.pcode.value=pcode;
		}
		chk.open("get","getPcode?pcode="+pcode);
		chk.send();
	}
</script>
</head>
<body>
<section>
<form method="post" action="productAddOk" name="pform" enctype="multipart/form-data">
	<table width="1000" align="center">
	  <caption><h2>상품 등록</h2></caption>
	
	  <tr>
	  	<td>상품코드</td>
	  	<td>
	  	<input type="text" name="pcode">
	  		<select name="dae" onchange="getJung(this.value)">
	  			<option value="">선택</option>
	  			<c:forEach items="${dlist}" var="dvo">
	  				<option value="${dvo.code}">${dvo.name}</option>
	  			</c:forEach>
	  		</select>
	  		<select id="jung" name="jung">
	  			<option value="">선택</option>
	  		</select>
	  		<input type="button" value="코드발생" onclick="getPcode()">
	  	</td>
	  </tr>
	  <tr>
	  	<td>상품 메인그림</td>
	  	<td><input type="file" name="pimg"></td>
	  </tr>
	  <tr>
	  	<td>상품 상세그림</td>
	  	<td><input type="file" name="cimg"></td>
	  </tr>
	  <tr>
	  	<td>상품명</td>
	  	<td><input type="text" name="title"></td>
	  </tr>
	  <tr>
	  	<td>상품가격</td>
	  	<td><input type="text" name="price"></td>
	  </tr>
	  
	    <tr>
	  	<td>사이즈</td>
	  	<td>
	  	<input type="checkbox" name="size" value="0">M(95)
	  	<input type="checkbox" name="size" value="1">L(100)
	  	<input type="checkbox" name="size" value="2">XL(105)
	  	<input type="checkbox" name="size" value="3">2XL(110)
	  	<input type="checkbox" name="size" value="4">3XL(115)
	  	<input type="checkbox" name="size" value="5">4XL(120)
	  	</td>
	  </tr>
	  <tr>
	  	<td>색상</td>
	  	<td>
	  	<input type="checkbox" name="color" value="0">흰색
	  	<input type="checkbox" name="color" value="1">검정
	  	<input type="checkbox" name="color" value="2">네이비
	  	<input type="checkbox" name="color" value="3">그외
	  	</td>
	  </tr>
	
	  <tr>
	  	<td>할인율</td>
	  	<td><input type="text" name="halin"></td>
	  </tr>
	  <tr>
	  	<td>적립률</td>
	  	<td><input type="text" name="juk"></td>
	  </tr>
	  <tr>
	  	<td>배송기간(일)</td>
	  	<td><input type="text" name="btime"></td>
	  </tr>
	  <tr>
	  	<td>배송가격(원)</td>
	  	<td><input type="text" name="bprice"></td>
	  </tr>
	  <tr>
	  	<td colspan="2" align="center"><input type="submit" value="상품 등록"></td>
	  	<td colspan="2"><input type="button" value="상품 목록" onclick="location='productList'"></td>
	  </tr> 
	</table>
</form>
</section>
</body>
</html>