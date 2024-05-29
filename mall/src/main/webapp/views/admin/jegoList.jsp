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
   width:1200px;
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
<script>
	window.onload=function()
	{
 		var jegoSel = document.getElementsByClassName("jegoSel");
		for(i=0;i<jegoSel.length;i++)
			{
 			var jegosu = document.getElementsByClassName("jegosu")[i].value;
			jegoSel[i].options[jegosu].selected=true;
			}
	}
	
 	function jegoSet(ppcode,n)
 	{
 		var jegoSel = document.getElementsByClassName("jegoSel")[n];
 		var su = jegoSel.options[jegoSel.selectedIndex].value;
 		var chk = new XMLHttpRequest();
 		{
 		}
 		chk.open("get","jegoSet?ppcode="+ppcode+"&su="+su);
 		chk.send();
 		location.reload();
 	}
 	
 	function jegoDel(no)
 	{
 		if(confirm("선택한 재고목록을 삭제하시겠습니까?"))
 			{
 			location="jegoDel?no="+no;
 			}
 		
 	}
</script>
</head>
<body>
<div id="adminbtn" style="display:flex;justify-content:space-between;margin:auto;margin-top:100px;width:1000px;">
<input type="button" value="회원 관리" onclick="location='member'">
<input type="button" value="구매 관리" onclick="location='gumaeList'">
<input type="button" value="상품 관리" onclick="location='productList'">
<input type="button" value="재고 관리" onclick="location='jegoList'" style="background:black;color:white;font-weight:900;">
<input type="button" value="문의 답변" onclick="location='proQuest'">
</div>
<section>
<div style="margin-top:50px;font-size:20px;text-align:center;font-weight:bold;padding-bottom:20px;border-bottom:2px solid black">재고 관리</div>
  <table width="1200" align="center" style="border-collapse:collapse;">
  <tr style="border-bottom:1px solid black;height:30px;" align="center">
  	<td width="150px">재고코드</td>
  	<td width="350px">상품이름</td>
  	<td width="200px">색상</td>
  	<td width="200px">사이즈</td>
  	<td width="200px">재고수량</td>
  	<td width="100px"></td>
  	<td width="100px"></td>
  </tr>
  <c:forEach items="${jlist}" var="jvo" varStatus="my">
  <input type="hidden" class="jegosu" value="${jvo.su}">
  <tr style="border-bottom:1px solid #747474;">
  	<td width="150px">${jvo.ppcode}</td>
  	<td width="350px">${jvo.title}</td>
  	<td width="200px" align="center">
  	 <c:if test="${jvo.color==0}">
	 흰색
	 </c:if>
	 <c:if test="${jvo.color==1}">
	 검정
	 </c:if>
	 <c:if test="${jvo.color==2}">
	 네이비
	 </c:if>
	 <c:if test="${jvo.color==3}">
	 이미지참조
	 </c:if>
  	</td>
  	<td width="200px" align="center">
  	<c:if test="${jvo.size==0}">
	 M (95)
	 </c:if>
	   <c:if test="${jvo.size==1}">
	 L (100)
	 </c:if>
	   <c:if test="${jvo.size==2}">
	 XL (105)
	 </c:if>
	   <c:if test="${jvo.size==3}">
	 2XL (110)
	 </c:if>
	   <c:if test="${jvo.size==4}">
	 3XL (115)
	 </c:if>
	   <c:if test="${jvo.size==5}">
	 4XL (120)
	 </c:if>
  	</td>
  	<td width="200px" align="center">
  	<span>
  	<select class="jegoSel" onchange="jegoSet('${jvo.ppcode}',${my.index})">
  	<c:forEach begin="0" end="100" var="i">
  	<option  value="${i}">${i}</option>
  	</c:forEach>
  	</select>
  	</span></td>
  	<td width="100px"><input type="button" value="재고 삭제" onclick="jegoDel(${jvo.no})"></td>
  </tr>
  </c:forEach>
  </table>
</section>
<div style="height:100px;"></div>
</body>
</html>