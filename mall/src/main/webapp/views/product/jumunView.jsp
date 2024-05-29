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
	
	
</style>
<script>
	function chgBaesong()
	{
		open("baeList","","width=400,height=400");
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
	     var pay = document.gform.pay;
	     var chk = 0;
	     for(i=0;i<pay.length;i++)
	    	 {
	    	 if(pay[i].checked==true)
	    		 chk++
	    	 }
	     
		
		if(chk==0)
			{
			alert("결제수단을 선택해주세요.");
			return false;
			}
		else
			{
			return true;
			}
	}
</script>
</head>
<body>
<section>
  <caption><h3 align="center">주문완료</h3></caption>
	<input type="hidden" name="coupon">
	
	  <div id="content">
	  	<div id="left">
	  	  <div id="baesong"> <!-- 배송지 정보 -->
	  	  <input type="hidden" name="baeNo" value="${bvo.no}">
	  	  	<div style="font-size:20px;font-weight:900;height:40px;line-height:40px;padding-left:10px;border-bottom:2px solid black;text-align:center;margin-top:50px;">주문완료 되었습니다.</div>
<%-- 	  	    <c:if test="${bvo==null}"> --%>
<%-- 				<c:set var="baeform" value="style='display:none'"/>  	   --%>
<%-- 	  	    </c:if> --%>
	  	    <div id="baeform" style="display:flex;justify-content:start;border-bottom:1px solid #e3e5e8;padding-bottom:10px;">
	  	    <div style="margin-top:10px;width:100px;color:#767678;margin-left:10px;">배송지</div>
	  	    <div>
	  	    <div style="display: flex;justify-content: space-between;font-size:16px;font-weight:900;margin-top:10px;margin-left:10px">
	  	    <span id="name">${bvo.name}</span>
	  	    </div>  
	  	    <div style="font-size:16px;color:#767678;margin-left:10px" id="phone">${bvo.phone}</div>
	  	    <div style="font-size:16px;margin-top:10px;">
	  	    <div id="juso" style="margin-left:10px;padding-bottom:10px;font-size:14px;">${bvo.juso} (${bvo.jusoEtc} ${bvo.zip})</div>
	  	    </div>
	  	    </div>
	  	    </div>
	  	    <div style="display:flex;justify-content:start;margin-left:10px;height:40px;line-height:40px;">
	  	    <div style="color:#767678;width:110px;">주문번호</div><div>${jumuncode}</div>
	  	    </div>
	  	    
	  	    
	      </div> <!-- 배송 끝 -->
	      
	      
	      <input type="hidden" name="pcodes" value="${pcodes}">
	      <input type="hidden" name="nos" value="${nos}">
	      <input type="hidden" name="sus" value="${sus}">
	      <input type="hidden" name="colors" value="${colors}"> <!-- ppcode 만들떄 사용 -->
	      <input type="hidden" name="sizes" value="${sizes}">  <!-- ppcode 만들떄 사용 -->
	      <!-- 구매상품 정보 -->
	      <input type="hidden" name="cprice" value="${price+bprice}">
	      <div id="product"> 
	      <div style="display:flex;justify-content:space-between;font-size:20px;font-weight:900;border-bottom:2px solid black;margin-top:50px;height:40px;line-height:40px;">
	      <div style="margin-left:10px;">주문상품</div><div style="margin-right:10px;">${cnt}건</div>
	      </div> 
	      <c:forEach items="${plist}" var="pvo">
	      <div style="display:flex;justify-content:start;margin-top:20px;">
	      <div id="proleft" style="margin-left:10px;"><img src="/static/product/${pvo.pimg}" width="130" height="150"></div>
	      <div id="proright" style="margin-left:10px;">
	      <div style="font-weight:900;">${pvo.title}</div>
	      <div style="margin-top:5px;color:#8f8f8f;font-size:14px;"><span style="border:1px solid #dddde1;">&nbsp옵션&nbsp</span> 
	      색상: 
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
	      <div style="margin-top:5px;font-size:20px;">${pvo.price}원</div>
	      </div><!-- proright끝 -->
	      </div>
	      </c:forEach>
	      </div> <!--product끝 -->
	      
	  	</div> <!-- left끝 -->
	  	<div id="right" >
	  	 	    <div style="display: flex;justify-content: space-between;border-bottom:2px solid black;height:40px;line-height:40px;font-size:20px;padding-left:10px;padding-right:10px;font-weight:900;margin-top:50px;">
	  	 	    <div>결제상세</div><div>${price+bprice-useJuk}원</div>
	  	 	    </div>
	  		<div id="cprice" style="padding-right:10px;padding-left:10px;margin-top:5px;padding-bottom:15px;">
	  			<div style="font-size:16px;display: flex;justify-content: space-between;margin-top:10px;">
	  			<div>주문금액</div><div>${price+bprice-useJuk}원</div>
	  			</div>
	  			<div id="cprice1" style="margin-top:5px;">
	  			<div style="display: flex;justify-content: space-between;"><div>상품금액</div><div>${cprice}원</div></div>
	  			<div style="display: flex;justify-content: space-between;margin-top:2px;"><div>배송비</div><div>+${bprice}원</div></div>  
	  			<div style="display: flex;justify-content: space-between;margin-top:2px;"><div>할인</div><div>－${halin}원</div></div>
	  			<div style="display: flex;justify-content: space-between;margin-top:2px;">
	  			<div>적립금</div>
	  			<div id="juk2">
	  			<c:if test="${useJuk!=0}">
	  			－${useJuk}원
	  			</c:if>
	  			<c:if test="${useJuk==0}">
	  			0원
	  			</c:if>
	  			</div>
	  			</div>
	  			</div>
	  			
	  		</div><!-- cprice끝 -->
	  		<div id="point" style="">
	  	      <div style="display: flex;justify-content: space-between;border-bottom:2px solid black;height:40px;line-height:40px;margin-top:5px;padding:0px 10px"><div>포인트 혜택</div><div>최대${juk+150}원</div></div>
	  	      	<div style="padding:10px 10px;margin-top:5px;">
	  				<div style="display: flex;justify-content: space-between;font-size:16px;"><div>구매적립</div> <div>${juk}원</div></div>
	  				<div id="point1">
	  			 	<div style="display: flex;justify-content: space-between;font-size:14px;margin:5px 0;"><div>기본적립</div> <div>${juk}원</div></div>
	  				</div>
	  				<div style="display: flex;justify-content: space-between;font-size:16px;"><div>리뷰 적립</div><div>150원</div></div>
	  				</div>
	  			<div style="font-size:12px;font-weight:normal;margin-left:10px;color:#999999">동일 상품의 상품리뷰/한달사용리뷰 적립은 각각 1회로 제한됩니다.</div>
	  		</div>
	  	</div>
	  	
	  </div> <!-- content끝 -->
	  <div style="margin-top:30px;" align="center">
	  	<input style="width:320px;margin-top:10px;;height:50px;background:black;color:white;font-weight:900;border:1px solid black;cursor:pointer;" type="button" value="메인으로" onclick="location='../main/main'">
	  	</div>
	 	
</section>

</body>
</html>