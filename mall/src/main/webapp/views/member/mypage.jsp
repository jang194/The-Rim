<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
	width:1200px;
	margin:auto;
	margin-top:100px;
	//border:1px solid red;
	}

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
		//alert(nos);
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
	    	hprice = hprice + pr*(hr/100)*su;
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
	
	location="../product/proGumae?pcodes="+pcodes+"&colors="+colors+"&sizes="+sizes+"&sus="+sus+"&nos="+nos;		
}

function up(index,no)
{	
	
	var su = parseInt(document.cform.getElementsByClassName("psu")[index].value);
	if(su<40)
		document.cform.getElementsByClassName("psu")[index].value=++su;
	
	var chk = new XMLHttpRequest();
	chk.onload=function()
	{
		location.reload();
	}
	chk.open("get","MycartUp?no="+no+"&su="+su);
	chk.send();
	
	
	
	
}

function down(index,no)
{
	var su = parseInt(document.cform.getElementsByClassName("psu")[index].value);
	if(su>1)
		document.cform.getElementsByClassName("psu")[index].value=--su;
	
	var chk = new XMLHttpRequest();
	chk.onload=function()
	{
		location.reload();
	}
	chk.open("get","MycartUp?no="+no+"&su="+su);
	chk.send(); 
	
}

function Gpage(gpage)
{
	var len = document.getElementsByClassName("gpage").length;
	for(i=0;i<len;i++)
		{
		document.getElementsByClassName("gpage")[i].style.background="white";
		document.getElementsByClassName("gpage")[i].style.color="black";
		}
	document.getElementsByClassName("gpage")[gpage-1].style.background="black";
	document.getElementsByClassName("gpage")[gpage-1].style.color="white";
	
	
	var chk = new XMLHttpRequest();
	chk.onload=function()
	{
		document.getElementById("gumaeList").innerHTML=chk.responseText;
		document.getElementById("gumaeList1").style.display="none";
	}
	chk.open("get","Gpage?gpage="+gpage);
	chk.send();
}


function getAnswer(n,ref,pimg,title,pcode)
{
	var answer = document.getElementsByClassName("answer");
	if(answer[n].style.display==='block')
		{
			answer[n].style.display='none';
		}
	else
		{
		var chk = new XMLHttpRequest();
		chk.onload=function()
		{
			answer[n].style.display='block';
			answer[n].innerHTML=chk.responseText;
		}
		chk.open("get","getAnswer?ref="+ref+"&pimg="+pimg+"&title="+title+"&pcode="+pcode);
		chk.send();
		}
	
	}
function getAnswer1(n,ref,pimg,title,pcode)
{
	var answer = document.getElementsByClassName("answer1");
	if(answer[n].style.display==='block')
		{
			answer[n].style.display='none';
		}
	else
		{
		var chk = new XMLHttpRequest();
		chk.onload=function()
		{
			answer[n].style.display='block';
			answer[n].innerHTML=chk.responseText;
		}
		chk.open("get","getAnswer1?ref="+ref+"&pimg="+pimg+"&title="+title+"&pcode="+pcode);
		chk.send();
		}
	
	}
	
function proQuestDel(no)  //no로 표시했지만 사실 ref값 질문글,답글 둘다 지우기위해
{
	var chk = new XMLHttpRequest();
	
	if(confirm("삭제하시겠습니까?"))
	{
		chk.onload=function()
		{
			alert("삭제되었습니다.");
			location.reload();
		}
		chk.open("get","../member/proQuestDel?pcode=${pvo.pcode}&no="+no);
		chk.send();
			
			}
}

function proQuestUpdate(pimg,title,pcode,content,no,view,qtype)
{
	open("../member/proQuestUpdate?title="+title+"&pimg="+pimg+"&pcode="+pcode+"&content="+content+"&no="+no+"&view="+view+"&qtype="+qtype,"","width=800,height=600");
	
}

function comma(num)
{
	return new Intl.NumberFormat().format(num);
}

function reviewDel(no)
	{
		location = "reviewDel?no="+no;
	}

function reviewUpdate(pimg,color,size,pcode,title,no)
{
	var left = Math.ceil((window.screen.width-500)/2);
	var top = Math.ceil((window.screen.height-680)/2);
	open("../member/reviewUpdate?pimg="+pimg+"&color="+color+"&size="+size+"&pcode="+pcode+"&title="+title+"&no="+no,"","width=500,height=680,left="+left+",top="+top);
}
</script>
</head>
<body>
<section>
	<div style="font-size:20px;font-weight:900;">최근 주문내역</div>
	<div style="border-top:2px solid black;border-bottom:1px solid black;margin-top:10px;">
 	<c:if test="${empty glist}">
	<div style="font-size:13px;color:#888888;margin-top:70px;margin-bottom:70px;text-align:center">최근 주문하신 내역이 없습니다.</div>
 	</c:if>
<div id="gumaeList1">	
	<c:forEach items="${glist}" var="gvo">
	<c:if test="${gvo.title!=null}">  <!-- ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss -->
<div style="display:flex;justify-content:start;margin-top:10px;">
	<div><img width="100" height="110" src="/static/product/${gvo.pimg}"></div>
	<div style="width:800px;margin-left:10px;font-size:14px;">
		<div style="font-size:14px;color:#aaaaac;">${gvo.writeday } 결제</div>
		<div style="margin-top:4px;font-weight:900;">${gvo.title}</div>
		<div style="font-weight:900;margin-top:3px;"><fmt:formatNumber type="number" value="${(gvo.price-(gvo.price*gvo.halin/100))*gvo.su}"/>원</div>
		<div style="margin-top:5px;color:#8f8f8f;font-size:14px;"><span style="border:1px solid #dddde1;">&nbsp옵션&nbsp</span> 색상: ${gvo.color} / 사이즈: ${gvo.size} / 수량: ${gvo.su}개</div>
	</div>
</div>
  <!-- sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss -->
	</c:if>
	</c:forEach>
</div>
	<div id="gumaeList"></div>
	</div>
	<div style="margin-top:20px;" align="center">
	<c:forEach begin="${gpstart}" end="${gpend}" var="i">
	<c:if test="${gpage==i}">
	<span class="gpage" onclick="Gpage(${i})" style="cursor:pointer;border:1px solid black;display:inline-block;width:20px;text-align:center;font-weight:900;background:black;color:white;margin-right:5px;">${i}</span>
	</c:if>
	<c:if test="${gpage!=i}">
	<span class="gpage" onclick="Gpage(${i})" style="cursor:pointer;border:1px solid black;display:inline-block;width:20px;text-align:center;font-weight:900;background:white;color:black;">${i}</span>
	</c:if>
	
	</c:forEach>
	</div>
	 <!-- 최근 주문내역 끝 -->
	
	
	
	
	<!-- 장바구니 시작 -->
	<div style="font-size:20px;font-weight:900;border-bottom:2px solid black;padding-bottom:10px;margin-top:200px;">장바구니</div>
	<c:if test="${empty plist}">
	<div style="font-size:13px;color:#888888;margin-top:70px;margin-bottom:70px;text-align:center;border-bottom:1px solid black;padding-bottom:70px;">장바구니가 비어있습니다.</div>
	</c:if>
	<c:if test="${not empty plist}">
	<form method="post" name="cform">
<div style="margin-bottom:20px;margin-top:20px;">
	<input type="checkbox" id="mainChk" onclick="allChk()"> <span style="">전체선택</span>
	<input style="background:black;color:white;font-weight:900;;border:1px solid black;border-reaidus:5px;" type="button" value="선택상품 삭제" onclick="cartSelDel()"></div>
<table width="1200" align="center" style="border-spacing:0 30px;border-collapse:collapse;">
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
	  
	  <td width="400"  style="vertical-align:top;margin-left:-100px;padding-top:22px;font-size:14px;">
	  <div style="vertical-align:top;font-weight:900;">${pvo.title}</div>
	  <div style="padding-top:4px;font-weight:900;"><span><fmt:formatNumber type="number" value="${pvo.price-(pvo.price*pvo.halin/100)}"/>원</span>&nbsp<span style="font-size:14px;color:#888888;text-decoration:line-through"><fmt:formatNumber value="${pvo.price}" type="number"/>원</span></div>
	  <div style="padding-top:5px;color:#8f8f8f;font-size:14px;">
	  <span style="border:1px solid #dddde1;">&nbsp옵션&nbsp</span>
	  색상 : 
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
	 이미지참조
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
	   </div>
	  </td>
	  
	  <td width="40" style="vertical-align:top;padding-top:22px;text-align:center;"> <!-- 타이틀 -->
	  <div><a href="../product/cartDel?no=${pvo.no}" style="color:#bdbdbd;">X</a></div> <!-- 장바구니 삭제 -->
	  </td>
	  
	  <td width="200" style="vertical-align:top;border-left:1px solid #ececef;border-right:1px solid #ececef;padding-top:22px;"> <!-- 사이즈 -->
	  <div id="outer" style="width:150px;margin-left:45px;margin-top:25px;height:40px;">
	  <span id="left1"><input style="height:100%" type="button" value="-" onclick="down(${my.index},${pvo.no})"></span> <!--  버튼ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ -->
  		<span id="center"><input style="height:36px;" readonly type="text" class="psu" value="${pvo.su}"></span>
  		<span id="right1"><input style="height:100%" type="button" value="+" onclick="up(${my.index},${pvo.no})"></span>
	  </div>
	  </td>
	  
	  <td style="text-align:center;width:200px;"> <!-- 가격 -->
	  <div style="font-size:14px;font-weight:900;color:#444444;">상품금액</div>
	  <div style="font-size:17px;font-weight:900;padding-top:2px;"><fmt:formatNumber type="number" value="${(pvo.price-(pvo.price*pvo.halin/100))*pvo.su}"/>원</div>
	  <div style="padding-top:5px;"><input style="border:1px solid black;background:white;font-weight:900;border-radius:5px;" type="button" value="주문하기" onclick="location='../product/proGumae?pcodes=${pvo.pcode}&sus=${pvo.su}&sizes=${pvo.size}&colors=${pvo.color}&nos=${pvo.no}'"></div>
	  </td>
	  
	  <td style="border-left:1px solid #ececef;border-right:none;text-align:center;"> <!-- 배송비 -->
	  <div style="font-size:14px;font-weight:900;color:#444444;">배송비</div>
	  <div style="font-size:17px;font-weight:900;padding-top:2px;"><fmt:formatNumber type="number" value="${pvo.bprice}"/>원</div>
	  </td>
	</tr>
  </c:forEach>
</table>
</form>

<table width="1200" align="center">
  	<tr height="70px" style="text-align:center;font-weight:900;font-size:14px;color:#222222;">
  		<td width="150px" align="right">
  		  <div style="width:100px;text-align:left;margin-left:30px;">선택상품금액</div>
  		  <div style="margin-top:5px;font-size:18px;width:100px;text-align:left;padding-left:15px;margin-left:30px;"><span id="Chkprice">0</span><span style="font-size:14px;">원</span></div>
  		</td>
  		<td width="30">
  			<span style="font-size:30px;color:#c7c7c7;">+</span>
  		</td>
  		<td width="45" style="text-align:left;padding-left:10px;">
  		  <div>총 배송비</div>
  		  <div style="margin-top:5px;font-size:18px;"><span id="Chkbprice">0</span><span style="font-size:14px;">원</span></div>
  		</td>
  		<td width="20">
  			<span style="font-size:30px;color:#c7c7c7;">-</span>
  		</td>
  		<td width="70" style="text-align:left;padding-left:10px;">
  		  <div>즉시할인예상금액</div>
  		  <div style="margin-top:5px;" id="Chkhalin">0원</div>
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
	<!-- 장바구니 끝 -->
	
	
	<!-- 좋아요 시작 -->
	<div style="font-size:20px;font-weight:900;margin-top:150px;">좋아요</div>
	<div style="border-top:2px solid black;border-bottom:1px solid black;margin-top:10px;">
	<c:if test="${empty jlist}">
	<div style="font-size:13px;color:#888888;margin-top:70px;margin-bottom:70px;text-align:center">좋아요 표시한 상품이 없습니다.</div>
	</c:if>
	<c:if test="${not empty jlist }">
	<div style="display:flex;justify-content:start;width:1200px;height:500px;">
	<c:forEach items="${jlist}" var="jvo">
	<div style="width:200px;height:500px;padding:0px 20px;">
	<div style="width:200px;height:280px;margin-top:30px;"><img src="/static/product/${jvo.pimg}" style="width:200px;height:280px;"></div>
	<div style="height:60px;font-size:14px;font-weight:900;padding-top:10px">${jvo.title}</div>
	<div style="height:60px;font-weight:900;">${jvo.price}원</div>
	<div style="height:40px;">
	<span style="display:inline-block;margin-top:3px;"><img src="/static/main/onheart.png"></span>
	<span style="display:inline-block;font-size:19px;font-weight:900;vertical-align:top;color:#e52528;">${jvo.heart}</span></div>
	</div>
	</c:forEach>
	</div>
	</c:if>
	</div>
	
	
	<div>
	<div style="font-size:20px;font-weight:900;margin-top:150px;border-bottom:2px solid black;padding-bottom:10px;">내가 작성한 리뷰</div>
	<c:if test="${empty rlist}">
	<div style="border-bottom:1px solid black;">
	<div style="font-size:13px;color:#888888;margin-top:70px;margin-bottom:70px;text-align:center">내가 쓴 리뷰 내역이 없습니다.</div>
	</div>
	</c:if>
	<c:if test="${not empty rlist}">
	<c:forEach items="${rlist}" var="rvo">
	<div style="display:flex;justify-content:start;font-size:14px;margin-top:10px;padding-bottom:10px;border-bottom:1px solid #cacbd4">
	<div style="display:flex;justify-content:start;width:550px;">
	<div><img src="/static/product/${rvo.pimg}" width="60px" height="70px"></div>
	<div style="padding-left:10px;border-right:1px solid #e3e5e8;padding-right:10px;">
	<div>${rvo.title }</div>
	<div style="color:#8f8f8f;margin-top:5px;"><span style="border:1px solid #dddde1;">&nbsp옵션&nbsp</span> 색상: 
	<c:if test="${rvo.color==0}">
	 흰색
	 </c:if>
	 <c:if test="${rvo.color==1}">
	 검정
	 </c:if>
	 <c:if test="${rvo.color==2}">
	 네이비
	 </c:if>
	 <c:if test="${rvo.color==3}">
	 이미지참조
	 </c:if>
	 / 사이즈: 
	 <c:if test="${rvo.size==0}">
	 M (95)
	 </c:if>
	   <c:if test="${rvo.size==1}">
	 L (100)
	 </c:if>
	   <c:if test="${rvo.size==2}">
	 XL (105)
	 </c:if>
	   <c:if test="${rvo.size==3}">
	 2XL (110)
	 </c:if>
	   <c:if test="${rvo.size==4}">
	 3XL (115)
	 </c:if>
	   <c:if test="${rvo.size==5}">
	 4XL (120)
	 </c:if>
	 </div>
	 <div style="margin-top:6px;">
	 <c:forEach begin="1" end="${rvo.star}">
	 	<img src="/static/main/rstar.png" width="20px">
	 </c:forEach>
	 <c:forEach begin="1" end="${5-rvo.star}">
	 	<img src="/static/main/gstar.png" width="20px;">
	 </c:forEach>
	 <span style="color:#8f8f8f;display:inline-block;vertical-align:top;margin-top:1px;">${rvo.writeday}</span>
	 </div>
	</div>
	</div>
	<div style="width:500px;line-height:20px;padding-left:20px;">${rvo.content}</div>
	<div style="line-height:70px;margin-left:20px;color:#888888;"><span style="cursor:pointer" onclick="reviewUpdate('${rvo.pimg}',${rvo.color},${rvo.size},'${rvo.pcode}','${rvo.title}',${rvo.no})">수정</span> | <span style="cursor:pointer;" onclick="reviewDel(${rvo.no})">삭제</span></div>
	</div>
	</c:forEach>
	</c:if>
	</div>
	
	
	<div style="hidden;height:200px;"></div>
</section>

</body>
</html>