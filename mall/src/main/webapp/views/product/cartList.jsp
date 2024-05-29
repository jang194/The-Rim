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
	width:1500px;	
	margin:auto;
	margin-top:100px;
	}
	
	/*section table{
	border-spacing:0px;
	}*/
	
	section tr{
	margin-top:100px;
	}
	
/*	section tr td{
	border-bottom:1px solid black;
	} */

	section #outer #center{
	width:25px;
	height:50px;
	vertical-align:top;
	//border:1px solid red;
	}
	
	
	section #center input[type=text]{
	width:37px;
	vertical-align:top;
	text-align:center;
	border:1px solid #dde0e3;
	outline:none;
	float:left;
	}
	
	
	section #outer #left1 input[type=button]{
	width:35px;
	height:40px;
	font-size:20px;
	text-align:center;
	font-weight:900;
	float:left;
	border:1px solid #dde0e3;
	border-right:none;
	outline:none;
	}
	
	section #right1 input[type=button]{
	width:35px;
	height:40px;
	font-size:25px;
	text-align:center;
	float:right;
	vertical-align:top;
	float:left;
	border:1px solid #dde0e3;
	border-left:none;
	outline:none;
	}
</style>
<script>
	function allChk()
	{
		var main =  document.getElementById("mainChk");
		var sub = document.getElementsByClassName("subChk");
		if(main.checked)
			{
				for(i=0;i<sub.length;i++)
					{
						sub[i].checked=true;
					}
			}
		else
			{
				for(i=0;i<sub.length;i++)
				{
					sub[i].checked=false;
				}
			}
		calChk();
		calPrice();
	}
	
	function Chk()
	{
		var sub = document.getElementsByClassName("subChk");
		var len = sub.length;
		var chk=0;
		
			for(i=0;i<len;i++)
				{
					if(sub[i].checked)
						chk ++;
				}
			if(chk==len)
				{
				document.getElementById("mainChk").checked=true;
				}		
			else
				{
				document.getElementById("mainChk").checked=false;				
				}
			calChk();
			calPrice();
	}
	
	function cartSelDel()
	{
		confirm("선택한 상품을 장바구니 목록에서 삭제하시겠습니까?")
		{
		var nos="";
		var sub = document.getElementsByClassName("subChk");
			for(i=0;i<sub.length;i++)
				{
					if(sub[i].checked)
					nos = nos+sub[i].value+",";
				}
			location="cartDel?no="+nos;
		}
	}
	
	function calPrice()
	{
		var sub = document.getElementsByClassName("subChk");
		var cprice = 0;
		var hprice = 0;
		var bprice = 0;
		for(i=0;i<sub.length;i++)
			{
			var pr = parseInt(document.getElementsByClassName("price")[i].value);
			var hr = parseInt(document.getElementsByClassName("halin")[i].value);
			var br = parseInt(document.getElementsByClassName("bprice")[i].value);
			var su = parseInt(document.getElementsByClassName("sus")[i].value);
				
		
		    if(sub[i].checked)
		    	{
		    	cprice = cprice + (pr*su);
		    	hprice = hprice + (pr*(hr/100))*su;
		    	bprice = br;
		    	}
			}
		document.getElementById("Chkprice").innerText=comma(cprice);
		document.getElementById("Chkbprice").innerText=comma(bprice);
		document.getElementById("Chkhalin").innerText=comma(hprice);
		document.getElementById("Chkcprice").innerText=comma(cprice+bprice-hprice);
	}
	
	function calChk()
	{
		var sub = document.getElementsByClassName("subChk");
		var chk=0;
		for(i=0;i<sub.length;i++)
			{
			if(sub[i].checked)
				chk++;
			}
		document.getElementById("gbtn").value=chk+"건 구매하기";
	}
	
	function SelGumae()
	{
		var pcodes="";
		var colors="";
		var sizes="";
		var sus="";
		var nos="";
		var sub = document.getElementsByClassName("subChk");
		
		for(i=0;i<sub.length;i++)
			{
				if(sub[i].checked)
					{
						pcodes = pcodes+document.getElementsByClassName("pcodes")[i].value+",";
						colors = colors+document.getElementsByClassName("colors")[i].value+",";
						sizes = sizes+document.getElementsByClassName("sizes")[i].value+",";
						sus = sus+document.getElementsByClassName("sus")[i].value+",";
						nos = nos+document.getElementsByClassName("nos")[i].value+",";
					}
			}
		
		location="proGumae?pcodes="+pcodes+"&colors="+colors+"&sizes="+sizes+"&sus="+sus+"&nos="+nos;		
	}
	
	function up(index,no)
	{	
		
		var su = parseInt(document.cform.getElementsByClassName("psu")[index].value);
		if(su<40)
			document.cform.getElementsByClassName("psu")[index].value=++su;
		
		location="cartUp?no="+no+"&su="+su;
	}
	
	function down(index,no)
	{
		var su = parseInt(document.cform.getElementsByClassName("psu")[index].value);
		if(su>1)
			document.cform.getElementsByClassName("psu")[index].value=--su;
		
		location="cartUp?no="+no+"&su="+su;
		
		
	}
	
	
	function comma(num)
    {
    	return new Intl.NumberFormat().format(num);
    }
</script>
</head>
<body>
<section>
<form method="post" name="cform">
	<div style="font-size:20px;font-weight:900;border-bottom:2px solid black;padding-bottom:10px;">장바구니</div>
	
	<c:if test="${empty plist}">
	<div style="font-size:13px;color:#888888;margin-top:70px;margin-bottom:70px;text-align:center;border-bottom:1px solid black;padding-bottom:70px;">장바구니가 비어있습니다.</div>
	</c:if>
	
	
	<c:if test="${not empty plist}">
<div style="margin-bottom:20px;margin-top:20px;">
	<input type="checkbox" id="mainChk" onclick="allChk()"> <span>전체선택</span>
	<input style="background:black;color:white;font-weight:900;;border:1px solid black;border-reaidus:5px;" type="button" value="선택상품 삭제" onclick="cartSelDel()"></div>
	</c:if>
<table width="1500" align="center" style="border-spacing:0 30px;border-collapse:collapse;">
  <c:forEach items="${plist}" var="pvo" varStatus="my">
  <input type="hidden" class="nos" value="${pvo.no}">
  <input type="hidden" class="pcodes" value="${pvo.pcode}">
  <input type="hidden" class="colors" value="${pvo.color}">
  <input type="hidden" class="sizes" value="${pvo.size}">
  <input type="hidden" class="sus" value="${pvo.su}">
  <input type="hidden" class="price" value="${pvo.price}">
  <input type="hidden" class="halin" value="${pvo.halin}">
  <input type="hidden" class="bprice" value="${pvo.bprice}">
    <tr style="border:1px solid #cacbd4;border-left:none;border-right:none;">
      <td width="50" style="text-align:center;"><input type="checkbox" value="${pvo.no}" class="subChk" onclick="Chk()"></td>      
	  <td width="100" height="100" style="vertical-align:top;padding-top:15px;padding-bottom:10px;padding-right:10px;"><img src="/static/product/${pvo.pimg}" width="100" height="110"></td>
	  
	  <td width="400"  style="vertical-align:top;margin-left:-100px;padding-top:22px;font-size:15px;">
	  <div style="vertical-align:top;font-weight:900;">${pvo.title}</div>
	  <c:if test="${pvo.halin>0}">
	  <div style="padding-top:4px;font-weight:900;"><span><fmt:formatNumber type="number" value="${pvo.price-(pvo.price*pvo.halin/100)}"/>원</span>&nbsp<span style="font-size:14px;color:#888888;text-decoration:line-through"><fmt:formatNumber value="${pvo.price}" type="number"/>원</span></div>
	  </c:if>
	  <c:if test="${pvo.halin==0}">
	  <div style="padding-top:4px;font-weight:900;">${pvo.price}원</div>
	  </c:if>
	  <div style="padding-top:5px;font-size:14px;color:#8f8f8f"><span style="border:1px solid #dddde1;">&nbsp옵션&nbsp</span>&nbsp색상 : ${pvo.color_1}/ 사이즈: ${pvo.size_1}</div>
	  </td>
	  
	  <td width="40" style="vertical-align:top;padding-top:22px;text-align:center;"> <!-- 타이틀 -->
	  <div><a href="../product/cartDel?no=${pvo.no}" style="color:#bdbdbd;">X</a></div> <!-- 장바구니 삭제 -->
	  </td>
	  
	  <td width="300" style="vertical-align:top;border-left:1px solid #ececef;border-right:1px solid #ececef;padding-top:22px;"> <!-- 사이즈 -->
	  <div id="outer" style="width:150px;margin-left:95px;margin-top:25px;height:40px;">
	  <span id="left1"><input style="height:100%" type="button" value="-" onclick="down(${my.index},${pvo.no})"></span> <!--  버튼ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ -->
  		<span id="center"><input style="height:36px;" readonly type="text" class="psu" value="${pvo.su}"></span>
  		<span id="right1"><input style="height:100%" type="button" value="+" onclick="up(${my.index},${pvo.no})"></span>
	  </div>
	  </td>
	  
	  <td style="text-align:center;"> <!-- 가격 -->
	  <div style="font-size:14px;font-weight:900;color:#444444;">상품금액</div>
	  <div style="font-size:17px;font-weight:900;padding-top:2px;"><fmt:formatNumber type="number" value="${(pvo.price-(pvo.price*pvo.halin/100))*pvo.su}"/>원</div>
	  <div style="padding-top:5px;"><input style="border:1px solid black;background:white;font-weight:900;border-radius:5px;" type="button" value="주문하기" onclick="location='proGumae?pcodes=${pvo.pcode}&sus=${pvo.su}&sizes=${pvo.size}&colors=${pvo.color}&nos=${pvo.no}'"></div>
	  </td>
	  
	  <td style="border-left:1px solid #ececef;border-right:none;text-align:center;"> <!-- 배송비 -->
	  <div style="font-size:14px;font-weight:900;color:#444444;">배송비</div>
	  <div style="font-size:17px;font-weight:900;padding-top:2px;"><fmt:formatNumber type="number" value="${pvo.bprice}"/>원</div>
	  
	  </td>
	</tr>
  </c:forEach>
</table>
</form>
</section>
<c:if test="${not empty plist}">
<table width="1500" align="center">
  	<tr height="100px" style="text-align:center;font-weight:900;font-size:14px;color:#222222;">
  		<td width="150px" align="right">
  		  <div style="width:100px;text-align:left;margin-left:30px;">선택상품금액</div>
  		  <div style="margin-top:10px;font-size:18px;width:100px;text-align:left;padding-left:15px;margin-left:30px;"><span id="Chkprice">0</span><span style="font-size:14px;">원</span></div>
  		</td>
  		<td width="30">
  			<span style="font-size:30px;color:#c7c7c7;">+</span>
  		</td>
  		<td width="45" style="text-align:left;padding-left:10px;">
  		  <div>총 배송비</div>
  		  <div style="margin-top:10px;font-size:18px;"><span id="Chkbprice">0</span><span style="font-size:14px;">원</span></div>
  		</td>
  		<td width="20">
  			<span style="font-size:30px;color:#c7c7c7;">-</span>
  		</td>
  		<td width="60" style="text-align:left;padding-left:10px;">
  		  <div>즉시할인예상금액</div>
  		  <div style="margin-top:10px;margin-left:10px;"><span id="Chkhalin">0</span><span>원</span></div>
  		</td>
  		<td width="20">
  			<span style="font-size:30px;color:#c7c7c7;font-weight:100;">|</span>
  		</td>
  		<td width="100" style="text-align:left;padding-left:20px;font-size:18px;">
  		  <div>주문금액 <span id="Chkcprice" style="font-size:20px">0</span><span style="font-size:17px;">원</span></div>
  		</td>
  		<td width="200">
  		  <div align="left" style="margin-left:30px;">
  		  <input  id="gbtn" type="button" value="0건 구매하기" style="width:200px;height:50px;background:black;color:white;font-weight:900;border:1px solid black;border-radius:7px;cursor:pointer;" onclick="SelGumae()"></div>
  		</td>
  	</tr>
  	</table>
  	</c:if>
  
  	
  	<!-- <form method="post" action="Upcart">
  		<div>주문수정</div>
  		<div style="display:flex;justify-content:start;">
  		<img src="/static/product/${cart.pimg}" width="150px">
  		<div>
  			<div>${cart.title}</div>
  			<div>${cart.price}</div>
  		</div>
  		</div>
  		<div><span>배송방법</span><span>택배</span></div>
  		<div><span>배송비결제</span><span>3,000원 주문시 결제</span></div>
  		<div>제주 추가 4,000원, 제주 외 도서지역 추가 7,000원</div>
  		<div>옵션추가</div>
  		<select name="color">
  			<option value="">색상</option>
  		</select>
  		<select name="size">
  			<option value="">사이즈</option>
  		</select>
  		<div>색상:블랙/사이즈:M</div>
  		<div><span>-숫자+</span><span>가격</span></div>
  		<div><span>상품금액</span><span>가격</span></div>
  		<div><span>배송비</span><span>3000원</span></div>
  	</form>  -->
  	
  	
</body>
</html>