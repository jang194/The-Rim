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
	margin-top:50px;
	}
	



</style>
<script>
window.onload=function()
	{
	var imsi = "${pvo.size}".split(",");
	
	for(i=0;i<imsi.length-1;i++)
		{
			document.pform.size[imsi[i]].checked=true;
		}
	
	var imsi2="${pvo.color}".split(",");
	
	for(i=0;i<imsi2.length-1;i++)
		{
			document.pform.color[imsi2[i]].checked=true;
		}
	
	}
	
	function Pchg() //P이미지 변경시 
	{
		document.getElementById("oldpimg").style.display="none";
		document.getElementById("pbtn").style.display="none";
		document.getElementById("pimg").style.display="inline";
		document.getElementById("pcancelbtn").style.display="inline";
	}
	
	function Cchg() //C이미지 변경시
	{
		document.getElementById("oldcimg").style.display="none";
		document.getElementById("cbtn").style.display="none";
		document.getElementById("cimg").style.display="inline";
		document.getElementById("ccancelbtn").style.display="inline";
	}
	
	function Pcancel() //P이미지 변경취소시
	{
		document.getElementById("oldpimg").style.display="inline";
		document.getElementById("pbtn").style.display="inline";
		document.getElementById("pimg").style.display="none";
		document.getElementById("pcancelbtn").style.display="none";
	}
	
	function Ccancel() //C이미지 변경취소시
	{
		document.getElementById("oldcimg").style.display="inline";
		document.getElementById("cbtn").style.display="inline";
		document.getElementById("cimg").style.display="none";
		document.getElementById("ccancelbtn").style.display="none";
	}
	
	
</script>
</head>
<body>
<section>
<form method="post" action="ListUpOk" name="pform" enctype="multipart/form-data">
<input type="hidden" name="no" value="${pvo.no }">
<input type="hidden" name="delpimg" value="${pvo.pimg}">
<input type="hidden" name="delcimg" value="${pvo.cimg}">
	<table width="1000" align="center">
	  <caption><h2>상품 수정</h2></caption>
	
	  <tr>
	  	<td>상품 메인그림</td>
	  	<td height="200"><img src="/static/product/${pvo.pimg}" width="250" height="150" id="oldpimg">
	  	<input type="button" id="pbtn" value="이미지 변경" onclick="Pchg()">
	  	<input type="file" name="pimg" id="pimg" style="display:none">
	  	<input type="button" value="변경취소" id="pcancelbtn" style="display:none" onclick="Pcancel()">			
	  	</td>
	  </tr>
	  <tr>
	  	<td>상품 상세그림</td>
	  	<td height="200"><img src="/static/product/${pvo.cimg}" width="250" height="150" id="oldcimg">
	  	<input type="button" id="cbtn" value="이미지 변경" onclick="Cchg()">
	  	<input type="file" name="cimg" id="cimg" style="display:none">
	  	<input type="button" value="변경취소" id="ccancelbtn" style="display:none" onclick="Ccancel()">
	  	</td>
	  	
	  </tr>
	  <tr>
	  	<td>상품명</td>
	  	<td><input type="text" name="title" value="${pvo.title }"></td>
	  </tr>
	  <tr>
	  	<td>상품가격</td>
	  	<td><input type="text" name="price" value="${pvo.price }"></td>
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
	  	<td>할인율(%)</td>
	  	<td><input type="text" name="halin" value="${pvo.halin}"></td>
	  </tr>
	  <tr>
	  	<td>적립률(%)</td>
	  	<td><input type="text" name="juk" value="${pvo.juk }"></td>
	  </tr>
	  <tr>
	  	<td>배송기간(일)</td>
	  	<td><input type="text" name="btime" value="${pvo.btime }"></td>
	  </tr>
	  <tr>
	  	<td>배송가격(원)</td>
	  	<td><input type="text" name="bprice" value="${pvo.bprice }"></td>
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