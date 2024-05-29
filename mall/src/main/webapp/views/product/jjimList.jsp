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
	width:1000px;
	margin:auto;
	margin-top:100px;
	}
	
	

</style>

<script>
	function check()
	{
		var sub = document.getElementsByClassName("jchksub");
		var len = sub.length;
		var chk=0;
			for(i=0;i<len;i++)
			{
			if(sub[i].checked)
				chk ++;
			}
			
		if(chk==len)
			{
			document.getElementById("jchkmain").checked=true;
			}
		else
		{
		document.getElementById("jchkmain").checked=false;			
		}
			
	}
	
	function AllChk()
	{
		var main = document.getElementById("jchkmain");
		var sub = document.getElementsByClassName("jchksub");
		var len = sub.length;

		if(main.checked)
			{
			  for(i=0;i<len;i++)
				    {
					  document.getElementsByClassName("jchksub")[i].checked=true;
					}
			}
		else
		{
			for(i=0;i<len;i++)
		    {
			  document.getElementsByClassName("jchksub")[i].checked=false;
			}
		}
	}
	
	function addCart(pcode)
	{
		var chk = new XMLHttpRequest();
		chk.onload=function()
		{
			//alert(chk.responseText);
			if(chk.responseText=="1")//장바구니 담기 성공
			{
				alert("장바구니에 담겼습니다.");
			}
			else if(chk.responseText=="0") //재고 테이블에 제품 없을시 = 매진시
				{
				  alert("매진된 상품입니다.");
				}
			else //에러시
			{
				alert(chk.responseText);
			}
				
		}
		chk.open("get","addCart2?pcode="+pcode);
		chk.send();
		//location="/product/addCart2?pcode="+pcode;
	}
	
	function jjimSelDel()
	{
		var nos="";
		var sub = document.getElementsByClassName("jchksub");
		var len = sub.length;
		if(confirm("선택한 상품을 목록에서 삭제하시겠습니까?"))
		{
			for(i=0;i<len;i++)
				{
				if(sub[i].checked)
	    		   {
				    nos = nos+sub[i].value+",";
				   }
					
				}
			//alert(nos);
			location="jjimListDel?no="+nos;
		}
	}
	
	function jjimListDel(no)
	{
		if(confirm("선택한 상품을 찜리스트에서 삭제하시겠습니까?"))
		{
			location="jjimListDel?no="+no;
		}
	}
</script>
</head>
<body>
<section>
 <div style="font-size:20px;font-weight:900;border-bottom:2px solid black;padding-bottom:10px;">찜 리스트</div>
 <c:if test="${not empty plist }">
 <div style="margin-top:20px;">
 	<input id="jchkmain" type="checkbox" style="margin-bottom:30px;"  onclick="AllChk()">전체선택
 	<input  style="background:black;color:white;font-weight:900;border-reaidus:5px;border:1px solid black" type="button" value="선택상품 삭제" onclick="jjimSelDel()">
 </div>
 </c:if>
 <c:if test="${empty plist}">
 <div align="center" style="border-bottom:1px solid black;padding-top:70px;padding-bottom:70px;">
 <div style="font-size:13px;color:#888888;">찜한 상품이 없습니다.</div>
 </div>
 </c:if>
 
<table width="1000" align="center" style="border-collapse:collapse;">
	<c:forEach items="${plist}" var="pvo"> <!-- foreach 시작~~~~~~~~~~~~~~~~~~~~ -->
<tr height="140" style="border:1px solid #cacbd4;border-left:none;border-right:none;">
	<td width="40">
	<div style="line-height:120px;height:120px;text-align:center;">
	<input value="${pvo.no}" type="checkbox" class="jchksub" onclick="check()">
	</div>
	</td>
	<td style="line-height:10px;" width="100"><img src="/static/product/${pvo.pimg}" width="100" height="110"></td>
	<td style="vertical-align:top;font-size:14px;padding-left:10px;width:600px;">
	<div style="display:flex;justify-content:space-between;">
		<div style="color:#aaaaac;padding-top:10px;">${pvo.writeday }</div>
	</div>
		<div style="margin-top:5px;font-weight:900;">${pvo.title }</div>
		<div style="margin-top:5px;font-weight:900;font-size:14px;"><fmt:formatNumber type="number" value="${pvo.price-(pvo.price*pvo.halin/100)}"/>원</div>
	</td>
	<td>
		<div style="font-size:16px;cursor:pointer;color:#bdbdbd;padding-bottom:20px;text-align:right;width:250px;padding-top:10px;"><span onclick="jjimListDel(${pvo.no})"><img src="/static/main/close1.png"></span></div>
		<div style="text-align:center;height:80px;width:250px;">
		<input style="background:white;color:black;font-weight:900;border-radius:5px;border:1px solid black" type="button" value="장바구니 담기" onclick="addCart('${pvo.pcode}')"></div>
	
	</td>
</tr>
	</c:forEach>   <!-- foreach 끝~~~~~~~~~~~~~~~~~~~~ -->
</table>
	
</section>
</body>
</html>