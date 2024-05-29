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
	width:1300px;
	margin:auto;
	margin-top:50px;
	margin-bottom:100px;
	}
	
	section #content{
	width:1200px;
	height:auto;
	}
	
	section #content #left{
	width:700px;
	display:inline-block;
	}
	
	
	
	
	
	section #content #right{
	width:400px;
	display:inline-block;
	vertical-align:top;
	margin-left:50px;
	}
	
	
	section #cprice{		
	font-size:20px;
	font-weight:900;
	}
	
	section #cprice1{
	font-size:14px;
	color:#757575;
	font-weight:normal;
	border-left:4px solid black;
	padding-left:10px;
	}
	
	
	section #point{
	font-size:20px;
	font-weight:900;
	}
	
	section #point1{
	font-size:15px;
	color:#757575;
	font-weight:normal;
	border-left:4px solid black;
	padding-left:10px;
	}
	
	#btn{
	width:400px;
	height:55px;
	margin-top:22px;
	margin-bottom:52px;
	font-size:20px;
	}
	
	#pay div{
	margin-top:10px;
	}
	
	#modal{
	position:absolute;
	background-color:rgba(0,0,0,0.4);
	display:none;
	top:0px;
	left:0px;
	width:100%;
	height:100%
	}
	
	#modal_body{
	width:570px;
	height:360px;
	top:50%;
	left:50%;
	position:absolute;
	background:white;
	transform: translateX(-50%) translateY(-50%);
	border-radius:10px;
	}
	
	
</style>
<script>
	function chgBaesong()
	{
		var no = document.getElementById("no").value;
		open("baeList?no="+no,"","width=400,height=400");
	}
	function addBaesong()
	{
		open("baeWrite","","width=400,height=400");
	}
	
	function chgPay(n)
	{
		for(i=0;i<4;i++)
			{
			document.getElementsByClassName("pay")[i].style.fontWeight="100";
			document.getElementsByClassName("payment")[i].style.display="none";
			}
			document.getElementsByClassName("pay")[n].style.fontWeight="900";
			document.getElementsByClassName("payment")[n].style.display="block";
	}
	
	function formChk(my)
	{
 		var usejuk = parseInt(document.gform.juk2.value);
 		document.gform.cprice.value = ${price+bprice}-usejuk;
		
	     var pay = document.gform.pay;
	     var chk = 0;
	     for(i=0;i<pay.length;i++)
	    	 {
	    	 if(pay[i].checked==true)
	    		 chk++
	    	 }
	     
		
		if(my.req.value.length==0)
			{
			alert("배송메모를 선택해주세요");
			return false;
			}
		else if(chk==0)
			{
			alert("결제수단을 선택해주세요.");
			return false;
			
			}
		else
			{
			return true;
			}
	}
	
	function viewModal()
	{
		document.getElementById("modal").style.display="block";
	}
	
	function chgReq(n)
	{
		document.gform.req.value=n;
		
		for(i=0;i<document.getElementsByClassName("req").length;i++)
			{
			document.getElementsByClassName("req")[i].style.fontWeight="100";			
			}
		document.getElementsByClassName("req")[n].style.fontWeight="900";
		var gibonReq=document.gform.gibonReq;
			if(gibonReq.checked)
				{
				gibonReq.value=n;
				}
			else
				{
				gibonReq.value=0;
				}
		var no = document.gform.baeNo.value;
		
		if(n==1)
			{
			document.getElementById("baeReqText").style.display="block";
			}
		else
			{
			document.getElementById("baeReqText").style.display="none";
			}
		document.getElementById("modal").style.display="none";	
		
		var chk = new XMLHttpRequest();
		
		chk.onload=function()
		{
			if(chk.responseText==0)
				{
				switch(n)
				{
				case 0: document.getElementById("baeReq").innerText="선택안함";break;	
				case 1: document.getElementById("baeReq").innerText="직접 입력하기";break;
				case 2: document.getElementById("baeReq").innerText="문 앞에 놓아주세요";break;
				case 3: document.getElementById("baeReq").innerText="부재 시 연락 부탁드려요";break;
				case 4: document.getElementById("baeReq").innerText="배송 전 미리 연락해주세요";break;
				}
				}
			else
				{
				alert("오류");
				}
		}
		chk.open("get","chgReq?no="+no+"&req="+n+"&greq="+gibonReq.value);
		chk.send();
		
		
	}
	
	function closeModal()
	{
		document.getElementById("modal").style.display="none";	
	}
	
  	function chgGreq()
 	{
  		var no = document.gform.baeNo.value;
 		var gibonReq=document.gform.gibonReq;
 		var req = document.gform.req.value;
 		
 		
 		if(gibonReq.checked)
 			{
 			gibonReq.value=req;
 			if(req.length==0)
 			{
 			gibonReq.value=0;
 			}
 			
 			}
 		else if(gibonReq.checked==false)
 			{
 			gibonReq.value=0;
 			}
 		
 		
 		
 		var chk = new XMLHttpRequest();
		
 		chk.onload=function()
 		{
		}
 		chk.open("get","chgGreq?greq="+gibonReq.value+"&no="+no);
 		chk.send();
 	}
  	
  	function novalue(my)
  	{
  		if(my.value.trim()=="")
  			{
  				my.value="0";
  			}
  		var juk = parseInt(my.value);
  		document.getElementById("cprice2").innerText=comma(${price}+${bprice}-juk)+"원";
  		document.getElementById("cprice3").innerText=comma(${price}+${bprice}-juk)+"원";
  		document.getElementById("cprice4").innerText=comma(${price}+${bprice}-juk)+"원";
  		document.getElementById("juk2").innerText=comma(-juk)+"원";
  		document.gform.juk2.value=juk;
  	}
  	
  	function comma(num)
    {
    	return new Intl.NumberFormat().format(num);
    }
  	
  	function check(my)
  	{
  		my.value=my.value.replace(/[^0-9]/g,"");
  		var juk = parseInt(my.value);
  		var myjuk = ${mvo.juk}
  		if(juk>myjuk)
  			{
  			alert("보유 금액 이상 사용은 불가능 합니다.");
  			my.value=myjuk;
  			}
  	}
</script>
</head>
<body>
<section>
  <caption><h3 align="center">주문/결제하기</h3></caption>
	<form method="post" action="proGumaeOk" onsubmit="return formChk(this)" name="gform">
	<input type="hidden" name="req">
	<input type="hidden" name="coupon">
	
	  <div id="content">
	  	<div id="left">
	  	  <div id="baesong"> <!-- 배송지 정보 -->
	  	  <input type="hidden" id="no" name="baeNo" value="${bvo.no}">
	  	  	<div style="font-size:20px;font-weight:900;height:40px;line-height:40px;padding-left:10px;border-bottom:2px solid black;">배송지</div>
<%-- 	  	    <c:if test="${bvo==null}"> --%>
<%-- 				<c:set var="baeform" value="style='display:none'"/>  	   --%>
<%-- 	  	    </c:if> --%>
			<c:if test="${not empty bvo}">
	  	    <div id="baeform" ${baeform}>
	  	    <div style="display: flex;justify-content: space-between;font-size:16px;font-weight:900;margin-top:10px;margin-left:10px">
	  	    <span id="name">${bvo.name}</span><input type="button" value="변경" style="margin-right:10px;background:black;font-weight:900;color:white;border:1px solid black;" onclick="chgBaesong()">
	  	    </div>  
	  	    <div style="font-size:16px;color:#767678;margin-left:10px" id="phone">${bvo.phone}</div>
	  	    <div style="font-size:16px;margin-top:10px;">
	  	    <div id="juso" style="margin-left:10px;padding-bottom:10px;font-size:14px;">${bvo.juso} (${bvo.jusoEtc}) ${bvo.zip}</div>
	  	    </div>
	  	    <div style="background:#e9ecef;">
	  	    <div>
	  	    <button id="baeReq" type="button" style="background:white;width:670px;height:45px;margin-top:15px;text-align:left;margin-left:10px;border:1px solid #dcdee0;" onclick="viewModal()">배송메모를 선택해주세요</button>
	  	    </div>
	  	    <div id="baeReqText" style="display:none;"><textarea style="margin-left:10px;width:656px;border:1px solid #dcdee0;border-top:none;resize:none;height:60px;padding-left:10px;padding-top:10px;"></textarea></div>
	  	    <div style="font-size:16px;margin-left:10px;margin-top:10px;padding-bottom:10px;font-size:14px;"><input type="checkbox" name="gibonReq" onclick="chgGreq()">다음에도 사용할게요</div>
	  	    </div>
	  	    </div>
	  	    </c:if>
	  	    <c:if test="${empty bvo}">
	  	    <div style="text-align:center;">
	  	    <input type="button" id="btn" value="배송지 등록" style="color:white;font-weight:bold;background:black;border:1px solid black;"onclick="addBaesong()">
	  	    </div>
	  	    </c:if>
	      </div> <!-- 배송 끝 -->
	      <div id="gumaeja" style="margin-top:30px;">	<!--  주문자 정보  -->
	      <div style="height:40px;line-height:40px;">
	      <div style="display: flex;justify-content: space-between;font-weight:900;border-bottom:2px solid black;"><div style="font-size:20px;padding-left:10px;">주문자</div></div>
	      </div>
	      <div style="padding-bottom:15px;">
	      <div style="display: flex;justify-content: space-between;padding-left:10px;margin-top:10px;"><span>이름 ${mvo.name}</span></div>
	      <div style="padding-left:10px;margin-top:5px;"><span>이메일</span><span> ${mvo.email}</span></div>
	      <div style="padding-left:10px;margin-top:5px;"><span>전화번호</span><span> ${mvo.phone }</span></div>
	      </div>
	      </div><!-- 구매자정보 끝 -->
	      
	      <input type="hidden" name="pcodes" value="${pcodes}">
	      <input type="hidden" name="nos" value="${nos}">
	      <input type="hidden" name="sus" value="${sus}">
	      <input type="hidden" name="colors" value="${colors}"> <!-- ppcode 만들떄 사용 -->
	      <input type="hidden" name="sizes" value="${sizes}">  <!-- ppcode 만들떄 사용 -->
	      <!-- 구매상품 정보 -->
	      <input type="hidden" name="cprice" value="${price+bprice}">
	      <input type="hidden" name="juk" value="${juk}"> <!-- 구입으로 저장되는 적립금 -->
	      <input type="hidden" name="juk2" value="0"> <!-- 사용하는 적립금 -->
	      
	      <div id="product"> 
	      <div style="display:flex;justify-content:space-between;font-size:20px;font-weight:900;border-bottom:2px solid black;margin-top:30px;height:40px;line-height:40px;">
	      <div style="margin-left:10px;">주문상품</div><div style="margin-right:10px;">${cnt}건</div>
	      </div> 
	      <c:forEach items="${plist}" var="pvo">
	      <div style="display:flex;justify-content:start;margin-top:20px;">
	      <div id="proleft" style="margin-left:10px;"><img src="/static/product/${pvo.pimg}" width="130" height="150"></div>
	      <div id="proright" style="margin-left:10px;">
	      <div style="font-weight:900;">${pvo.title}</div>
	      <div style="margin-top:5px;color:#8f8f8f;font-size:14px;"><span style="border:1px solid #dddde1;">&nbsp옵션&nbsp</span> 색상: 
		      <c:if test="${pvo.color==0}">
			  흰색
			  </c:if>
			  <c:if test="${pvo.color==1}">
			  검정
			  </c:if>
			  <c:if test="${pvo.color==2}">
			  네이비
			  </c:if>
			  <c:if test="${pvo.color==3}">
			  이미지 참조
			  </c:if>
	           / 사이즈: 
	            <c:if test="${pvo.size==0}">
			    M (95)
			    </c:if>
			    <c:if test="${pvo.size==1}">
				L (100)
				</c:if>
				<c:if test="${pvo.size==2}">
				XL (105)
				</c:if>
			    <c:if test="${pvo.size==3}">
				2XL (110)
				</c:if>
				<c:if test="${pvo.size==4}">
				3XL (115)
				</c:if>
				<c:if test="${pvo.size==5}">
				4XL (120)
				</c:if>
 / 수량: ${pvo.su}개</div>
	      <div style="margin-top:5px;font-size:18px;">
	      <c:if test="${pvo.halin>0}">
	      <span style="color:#1088ed"><fmt:formatNumber type="number" value="${(pvo.price-(pvo.price*pvo.halin/100))*pvo.su}" />원</span>&nbsp<span style="font-size:15px;color:#888888;text-decoration:line-through"><fmt:formatNumber type="number" value="${pvo.price*pvo.su}" />원</span>
	      </c:if>
	      <c:if test="${pvo.halin==0}">
	      <fmt:formatNumber type="number" value="${pvo.price*pvo.su}" />원
	      </c:if>
	      </div>
	      </div><!-- proright끝 -->
	      </div>
	      </c:forEach>
	      </div> <!--product끝 -->
	      
	      <div style="display:flex;justify-content:space-between;padding-bottom:10px;border-bottom:2px solid black;margin-top:30px;font-weight:900;">
	      <div style="font-size:20px;">적립금·쿠폰</div>
	      <div>보유 ${mvo.juk}원</div>
	      </div>
	      <div style="border-left:4px solid black;padding-left:10px;">
	      <div style="display:flex;justify-content:space-between;margin-top:10px;font-weight:900;">
	      <div>적립금</div>
	      <div>보유 ${mvo.juk}원</div>
	      </div>
	      <div style="display:flex;justify-content:space-between;font-weight:900;margin-top:5px;">
	      <div>쿠폰</div>
	      <div>보유 0원</div>
	      </div>
	      </div>
	      <div style="display:flex;justify-content:start;margin-top:10px;">
	      <div style="margin-top:7px;">사용</div>
	      <div style="border:1px solid #999999;border-radius:5px;height:40px;;width:650px;margin-left:15px;">
	      <input style="width:600px;font-size:20px;heigth:20px;margin-top:5px;outline:none;border:none;"  type="text" value="0" dir="rtl" onblur="novalue(this)" onkeyup="check(this)"><span style="fonr-size:17px;font-weight:bold;">원</span></div>
	      </div>
	      
	      <!-- 결제방법 -->
 	      <div style="display: flex;justify-content: space-between;font-size:20px;height:40px;line-height:40px;margin-top:50px;border-bottom:2px solid black;background:#f0faff;">
 	      <div style="font-weight:900;margin-left:10px;">결제수단</div>
 	      <div style="margin-right:10px;" id="cprice2"><fmt:formatNumber value="${price+bprice}" type="number" pattern="#,###"/>원</div>
 	      </div>
	  
 	      <div id="pay" style="margin-left:10px;margin-top:10px;font-size:14px;">
 	      <div style="height:40px;line-height:40px;">
 	      <input type="radio" name="pay" value="0" onclick="chgPay(0)"><span class="pay">계좌이체</span>
 	      <input type="radio" name="pay" value="1" onclick="chgPay(1)"><span class="pay">카드결제</span>
 	      <input type="radio" name="pay" value="2" onclick="chgPay(2)"><span class="pay">휴대폰</span>
 	      <input type="radio" name="pay" value="3" onclick="chgPay(3)"><span class="pay">무통장입금</span>
 	      </div>
 	      <div class="payment" style="display:none;">
 	      <div style="background:#e9ecef;height:40px;line-height:40px;font-size:14px;font-weight:900;">&nbsp&nbsp&nbsp은행선택&nbsp&nbsp&nbsp 
 	      <select name="bank">
 	      <option value="0">카카오뱅크</option>
 	      <option value="1">농협은행</option>
 	      <option value="2">신한은행</option>
 	      <option value="3">국민은행</option>
 	      <option value="4">우리은행</option>
 	      <option value="5">기업은행</option>
 	      </select>
 	      </div>
 	      </div>
 	      <div class="payment" style="display:none;">
	 	      <div style="background:#e9ecef;height:40px;line-height:40px;font-size:14px;font-weight:900;border-bottom:1px solid #e4e4e4;margin-top:0px;">&nbsp&nbsp&nbsp카드선택&nbsp&nbsp&nbsp 
	 	      <select name="card">
	 	      <option value="0">카카오뱅크</option>
	 	      <option value="1">삼성카드</option>
	 	      <option value="2">KB국민카드</option>
	 	      <option value="3">롯데카드</option>
	 	      <option value="4">신한카드</option>
	 	      <option value="5">하나카드</option>
	 	      <option value="6">BC카드</option>
	 	      <option value="7">현대카드</option>
	 	      </select>
	 	      </div>
	 	      <div style="background:#e9ecef;height:40px;line-height:40px;font-size:14px;font-weight:900;margin-top:0px;">&nbsp&nbsp&nbsp할부기간&nbsp&nbsp&nbsp 
	 	      <select name="gigan">
	 	      <option value="0">일시불</option>
	 	      <option value="1">2개월</option>
	 	      <option value="2">3개월</option>
	 	      <option value="3">6개월</option>
	 	      <option value="4">12개월</option>
	 	      <option value="5">24개월</option>
	 	      <option value="6">36개월</option>
	 	      </select>
	 	      </div>
 	      </div>
 	      
 	      
 	      
 	      <div class="payment" style="display:none;">
		    <div style="background:#e9ecef;height:40px;line-height:40px;font-size:14px;font-weight:900;margin-top:0px;">&nbsp&nbsp&nbsp할부기간&nbsp&nbsp&nbsp 
	 	      <select name="tong">
	 	      <option value="0">SKT</option>
	 	      <option value="1">KT</option>
	 	      <option value="2">LG</option>
	 	      </select>
	 	    </div> 
 	      
 	      </div>
 	      <div class="payment" style="display:none;">
 	      <div style="background:#e9ecef;height:40px;line-height:40px;font-size:14px;font-weight:900;">&nbsp&nbsp&nbsp은행선택&nbsp&nbsp&nbsp 
 	      <select name="bank2">
 	      <option value="0">카카오뱅크</option>
 	      <option value="1">농협은행</option>
 	      <option value="2">신한은행</option>
 	      <option value="3">국민은행</option>
 	      <option value="4">우리은행</option>
 	      <option value="5">기업은행</option>
 	      </select>
 	      </div>
 	      </div>
 	      
	      </div> <!-- payment끝 -->
	       <div style="margin-top:30px;" align="center">
	       <div style="margin-bottom:10px;font-weight:900;font-size:14px;">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</div>
	  	<input style="width:320px;margin-top:10px;;height:50px;background:black;color:white;font-weight:900;border:1px solid black;" type="submit" value="결제하기">
	  	</div>
	  	</div> <!-- left끝 -->
	  	<div id="right" >
	  	 	    <div style="display: flex;justify-content: space-between;border-bottom:2px solid black;height:40px;line-height:40px;font-size:20px;padding-left:10px;padding-right:10px;font-weight:900;">
	  	 	    <div>결제상세</div><div id="cprice3"><fmt:formatNumber type="number" value="${price+bprice}" />원</div>
	  	 	    </div>
	  		<div id="cprice" style="padding-right:10px;padding-left:10px;margin-top:5px;padding-bottom:15px;">
	  			<div style="font-size:16px;display: flex;justify-content: space-between;margin-top:10px;">
	  			<div>주문금액</div><div id="cprice4"><fmt:formatNumber type="number" value="${price+bprice}" />원</div>
	  			</div>
	  			<div id="cprice1" style="margin-top:5px;">
	  			<div style="display: flex;justify-content: space-between;"><div>상품금액</div><div><fmt:formatNumber type="number" value="${cprice}" />원</div></div>
	  			<div style="display: flex;justify-content: space-between;margin-top:2px;"><div>배송비</div><div>+<fmt:formatNumber type="number" value="${bprice}" />원</div></div>  
	  			<div style="display: flex;justify-content: space-between;margin-top:2px;">
	  			<div>할인</div>
	  			<div>－<fmt:formatNumber type="number" value="${halin}"/>원</div>
	  			</div>
	  			<div style="display: flex;justify-content: space-between;margin-top:2px;">
	  			<div>적립금</div>
	  			<div id="juk2">0원</div>
	  			</div>
	  			</div>
	  			
	  		</div><!-- cprice끝 -->
	  		<div id="point" style="">
	  	      <div style="display: flex;justify-content: space-between;border-bottom:2px solid black;height:40px;line-height:40px;margin-top:5px;padding:0px 10px"><div>포인트 혜택</div><div>최대<fmt:formatNumber type="number" value="${juk+150}" />원</div></div>
	  	      	<div style="padding:10px 10px;margin-top:5px;">
	  				<div style="display: flex;justify-content: space-between;font-size:16px;"><div>구매적립</div> <div><fmt:formatNumber type="number" value="${juk}" />원</div></div>
	  				<div id="point1">
	  			 	<div style="display: flex;justify-content: space-between;font-size:14px;margin:5px 0;"><div>기본적립</div> <div><fmt:formatNumber type="number" value="${juk}" />원</div></div>
	  				</div>
	  				<div style="display: flex;justify-content: space-between;font-size:16px;"><div>리뷰 적립</div><div>150원</div></div>
	  				</div>
	  			<div style="font-size:12px;font-weight:normal;margin-left:10px;color:#999999">동일 상품의 상품리뷰/한달사용리뷰 적립은 각각 1회로 제한됩니다.</div>
	  		</div>
	  	</div>
	  </div> <!-- content끝 -->
	 	
	</form>
</section>

<div id="modal">
	<div id="modal_body">
	<div style="display:flex;justify-content:space-between;font-size:20px;margin-top:20px;">
	 <div style="width:30px;"></div><div style="font-weight:900;border:1px solid black;">배송메모를 선택해주세요</div><div style="font-size:40px;font-weight:100;height:30px;line-height:20px;padding-right:15px;"><span onclick="closeModal()">×</span></div>
	 </div>
	<div style="display:flex;justify-content:space-between;margin-top:30px;padding-left:20px;padding-bottom:10px;cursor:pointer;" onclick="chgReq(0)">
	<div class="req" style="font-size:18px;">선택안함</div><div></div>
	 </div>
	<div style="display:flex;justify-content:space-between;margin-top:15px;padding-left:20px;padding-bottom:10px;cursor:pointer;" onclick="chgReq(1)">
	<div class="req" style="font-size:18px;">직접 입력하기</div><div></div>
	 </div>
	<div style="display:flex;justify-content:space-between;margin-top:15px;padding-left:20px;padding-bottom:10px;cursor:pointer;" onclick="chgReq(2)">
	<div class="req" style="font-size:18px;">문 앞에 놓아주세요</div><div></div>
	 </div>
	<div style="display:flex;justify-content:space-between;margin-top:15px;padding-left:20px;padding-bottom:10px;cursor:pointer;" onclick="chgReq(3)">
	<div class="req" style="font-size:18px;">부재 시 연락 부탁드려요</div><div></div>
	 </div>
	<div style="display:flex;justify-content:space-between;margin-top:15px;padding-left:20px;padding-bottom:10px;cursor:pointer;" onclick="chgReq(4)">
	<div class="req" style="font-size:18px;">배송 전 미리 연락해주세요</div><div></div>
	 </div>
	
	</div>
</div>

</body>
</html>