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
	width:1100px;
	margin:auto;
	margin-top:100px;
	}
	
	button{
	cursor:pointer;
	}

	section #content #left{
	display:inline-block;
	margin-left:20px;
	padding-right:45px;
	height:640px;
	border-right:1px solid #ededed;
	}
	
	section #content #right{
	width:430px;
	display:inline-block;
	border:1px solid #ededed;
	vertical-align:top;
	margin-left:35px;
	padding:40px;
	}
	
	section #right button[type=button]{
	cursor:pointer;
	}
	
	section #content #right #title{
	font-weight:900;
	//border:1px solid red;
	margin-top:-20px;
	}
	section #content #right #price{
	font-weight:900;
	font-size:23px;
	margin-top:35px;
	color:red;
	//border:1px solid black;
	}
	section #content #right #price #won{
	font-weight:900;
	font-size:20px;
	color:red;
	}
	section #content #right #bae{
	font-size:12px;
	margin-top:25px;
	
	}
	section #content #right #bae1{
	font-size:12px;
	margin-top:5px;
	color:#ababab;
	}
	section #content #right #bae2{
	font-size:12px;
	color:#6799FF;
	text-decoration:underline;
	}
	
	section #content #right select{
	width:430px;
	height:35px;
	border:1px solid #bdbdbd;
	margin-top:0px;
	}
	
	section #content #right #size{
	margin-top:5px;
	}
	section #content #right > form > div{
	margin-top:15px;
	}
	
	
	section #chong{
	display:inline-block;
	font-weight:900;
	font-size:14px;
	//border:1px solid blue;
	}
	section #chong1{
	width:345px;
	display:inline-block;
	font-size:15px;
	//border:1px solid red;
	}
	
	section #chong2{
	color:#999999;
	font-size:15px;
	}
	
	section #cprice{
	color:red;
	font-size:23px;
	font-weight:900;
	}
	
	section .prosu #outer{
	width:101px;
	height:40px;
	line-height:45px;
	//border:1px solid red;
	white-space:nowrap;
	}
	
	section #outer #left1{
	//border:1px solid blue;
	line-height:45px;
	}
	
	section #outer #left1 input[type=button]{
	width:35px;
	height:40px;
	font-size:20px;
	text-align:center;
	font-weight:900;
	float:left;
	border:1px solid #dde0e3;
	}
	
	section #right1 input[type=button]{
	width:35px;
	height:40px;
	font-size:25px;
	//text-align:center;
	//float:right;
	margin-left:-6px;
	vertical-align:top;
	border:1px solid #dde0e3;
	//border-left:none;
	}
	
	
	section #outer #center{
	width:25px;
	height:50px;
	vertical-align:top;
	//border:1px solid red;
	}
	
	
	section #center input[type=text]{
	width:37px;
	height:36px;
	vertical-align:top;
	margin-left:-3px;
	text-align:center;
	border:1px solid #dde0e3;
	border-right:none;
	}
	
	#topmenu{
	width:1100px;
	}
	
	#topmenu ul{
	padding-left:0px;
	white-space : nowrap; 
	}
	
	
	#topmenu li{   /* 위에 따라다니는 메뉴 */
	list-style-type:none;
	width:274px;
	height:40px;
	line-height:40px;
 	border:1px solid #dbdddf; 
	display:inline-block;
	font-weight:900;
	font-size:14px;
	margin-left:-6px;
	text-align:center;
	background:#F3F5F7;
	}
	
	#topmenu li a{
	color:#333333;
	}
	
	#topmenu li:first-child{
	width:274px;
	margin-left:0px;
	border-left:1px solid #dbdddf;
	}
	#topmenu li:last-child{
	width:274px;
	}
	
	#topmenu1{
	width:1100px;
	height:82px;
	background:white;
	padding-top:10px;
	margin-bottom:10px;
	display:none;
	}
	
	
	
</style>
<script>
	function up(n)
	{	
		var su = parseInt(document.getElementsByClassName("sus")[n].value);
		if(su<40)
			document.getElementsByClassName("sus")[n].value=++su;
		calPrice(n);
	}
	
	function down(n)
	{
		var su = parseInt(document.getElementsByClassName("sus")[n].value);
		if(su>1)
			document.getElementsByClassName("sus")[n].value=--su;
		calPrice(n);
	}
	
// 	function up2()
// 	{	
// 		var su = parseInt(document.gform.sus2.value);
// 		if(su<40)
// 			document.gform.sus2.value=++su;
// 		calPrice2();
// 	}
	
// 	function down2()
// 	{
// 		var su = parseInt(document.gform.sus2.value);
// 		if(su>1)
// 			document.gform.sus2.value=--su;
// 		calPrice2();
// 	}
	
	function calPrice(n)
	{
		var cprice=0;
		var su = parseInt(document.getElementsByClassName("sus")[n].value);
		var price= parseInt(document.gform.price.value);
		 cprice = (price-(price*${pvo.halin}/100))*su;
		document.getElementsByClassName("cprice")[n].innerText="  "+comma(cprice);
		document.getElementsByClassName("su2")[n].innerText=su;
	}
	
	
	
	
	function checkColor(n)
	{
// 		document.getElementById("nosize").style.display="inline";
//컬러 선택전
		document.getElementsByClassName("color1")[n].innerText="";
	 	document.getElementsByClassName("size1")[n].innerText="";
 		document.getElementsByClassName("prosu")[n].style.display="none";
 		document.getElementsByClassName("pro1")[n].style.display="none";
		var color = document.getElementsByClassName("colorSel")[n];
	 	var c = parseInt(color.value);
	 	
	 	if(color.checked=true) //컬러가 선퇙되면
	 		{
	 		
	 		document.getElementsByClassName("sus")[n].value=0;
	 		document.getElementsByClassName("colors")[n].value=color.value;
	 		document.getElementsByClassName("sizes")[n].value="";
		 calPrice(n);
	 			switch(c) //수량표시 위에 들어갈 컬러
	 			{
	 			case 0 : document.getElementsByClassName("color1")[n].innerText="화이트";break;
	 			case 1 : document.getElementsByClassName("color1")[n].innerText="검정";break;
	 			case 2 : document.getElementsByClassName("color1")[n].innerText="네이비";break;
	 			case 3 : document.getElementsByClassName("color1")[n].innerText="이미지 참조";break;
	 			}
	 			document.getElementsByClassName("size")[n].style.display="inline";
 	 			document.getElementsByClassName("nosize")[n].style.display="none";
	 		}
	 	
	}
	
	function checkSize(n)
	{
		//Append.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.child
// 		const newDiv = document.createElement("div");
// 		newDiv.innerHTML ='<div style="font-size:14px"> <span class="color1">색상</span>&nbsp<span class="size1">사이즈</span></div><div><div id="outer"><span id="left1"><input type="button" value="-" onclick="down(0)"></span> <span id="center"><input type="text"  name="sus" class="sus" size="1" value="0"></span> <span id="right1"><input type="button" value="+" onclick="up(0)"></span></div></div>';
// 		document.querySelector(".createDiv").append(newDiv);
		
		
		var size = document.getElementsByClassName("sizeSel")[n];
		var s = parseInt(size.value);
		
		if(size.checked=true) //사이즈가 선퇙되면
			{
			var su = parseInt(document.getElementsByClassName("sus")[n].value);
			document.getElementsByClassName("sus")[n].value=1;
 			document.getElementsByClassName("pro1")[n].style.display="block"; //컬러+사이즈 글자
	 		document.getElementsByClassName("prosu")[n].style.display="block"; //수량 박스
			switch(s) //수량표시 위에 들어갈 사이즈
 			{
 			case 0 :document.getElementsByClassName("size1")[n].innerText="M(95)";break;
 			case 1 : document.getElementsByClassName("size1")[n].innerText="L(100)";break;
 			case 2 : document.getElementsByClassName("size1")[n].innerText="XL(105)";break;
 			case 3 : document.getElementsByClassName("size1")[n].innerText="2XL(110)";break;
 			case 4 : document.getElementsByClassName("size1")[n].innerText="3XL(115)";break;
 			case 5 : document.getElementsByClassName("size1")[n].innerText="4XL(120)";break;
 			}
			
			}
		
		calPrice(n);                                                       
																
		 //셀렉트 창 name=color,size 였으나 밑에 선택완료후 원위치를 실행하면 값이 초기화 되므로 color,size값을 input type=hidden sizes,colors에 저장
		document.getElementsByClassName("sizes")[n].value=size.value;
		
		document.getElementsByClassName("colorSel")[n].options[0].selected=true;  // 사이즈 선택 완료후 컬러 사이즈 원위치
		document.getElementsByClassName("sizeSel")[n].options[0].selected=true;   //  
	 	//document.gform.size.value="";
	 	//document.gform.color.value="";
	 	document.getElementsByClassName("size")[n].style.display="none";
		document.getElementsByClassName("nosize")[n].style.display="block";
		//document.getElementById("hidesize").style.display="none";
	}


	function jjimAdd()
	{
		var msg = document.getElementsByClassName("jjim")[0].src.indexOf("onheart.png");//하트일 경우 !=-1값 /빈하트일 경우 -1값
		
		var chk = new XMLHttpRequest();
		chk.onload=function()
		{
			if(chk.responseText=="1") //하트를 눌러서 찜테이블에 추가완료시
				{
					//alert(msg);
					if(msg==-1) //빈하트 클릭시
						{
							document.getElementsByClassName("jjim")[0].src="/static/main/onheart.png";
							document.getElementsByClassName("jjim")[1].src="/static/main/onheart.png";
						}
					else //빨간하트 클릭시
						{
							document.getElementsByClassName("jjim")[0].src="/static/main/offheart.png";	
							document.getElementsByClassName("jjim")[1].src="/static/main/offheart.png";	
						}
				}
			else if(chk.responseText=="0") //로그인 안했을시
				{
				location="../member/login?pcode=${pvo.pcode}";
				}
			else // chk.responseText가 2일경우
			{
				location="../error/error1";
			}
				
		}
		chk.open("get","addjjim?pcode=${pvo.pcode}&msg="+msg);
		chk.send();
	}
		
function addCart(n)
	{
		var color = document.getElementsByClassName("colors")[n].value;
		var size = document.getElementsByClassName("sizes")[n].value;
		var su = document.getElementsByClassName("sus")[n].value;
		if(color=="")
			{
			 alert("컬러를 선택해주세요");
			 return false;
			}
		else if(size=="")
			{
			alert("사이즈를 선택해주세요");
			return false;
			}
			
		
			

			
		var chk = new XMLHttpRequest();
		chk.onload=function()
		{
			//alert(chk.responseText);
			if(chk.responseText=="1") //로그인 , cart테이블에 성공적으로 저장
				{
				 alert("장바구니에 추가되었습니다.");
				 
				 location.reload();
				 
				}
			else if(chk.responseText=="0") //로그인 안되어있을시
				{
				
				}
			else if(chk.responseText=="2")// 에러
				{
					location="../error/error2";
				}
  			else //responseText=="3" //카트테이블에 이미존재, 더 추가할거냐고 묻는 항목
  				{
  					if(confirm("장바구니에 이미 존재하는 상품입니다. 추가하시겠습니까?"))
  						{
							location="addCart1?pcode=${pvo.pcode}&color="+color+"&size="+size+"&su="+su;
							alert("장바구니에 추가되었습니다.");
  						}
 				}
		}
		chk.open("get","addCart?pcode=${pvo.pcode}&color="+color+"&size="+size+"&su="+su);
		chk.send();
			
		
	}
	
	window.onscroll = function()
	{
		
		var inmenu = document.getElementsByClassName("inmenu");
		
		var top=document.documentElement.scrollTop;
		if(top>=1000)
			{
			document.getElementById("topmenu").style.position="fixed";
			if(parseInt(document.getElementById("topmenu").style.top)==415)
				{
				document.getElementById("topmenu").style.top="415px";
				}
			else
				{
				document.getElementById("topmenu").style.top="90px";
				document.getElementById("chgTopbtn").style.display="block";		
				document.getElementById("chgTopbtn2").style.display="none";		
				}
			
			
			document.getElementById("topmenu").style.marginTop="-15px";
			document.getElementById("noview").style.paddingBottom="250px";
			
			
			document.getElementById("topmenu1").style.position="fixed";
			document.getElementById("topmenu1").style.display="block";
			document.getElementById("topmenu1").style.top="0px";
			
			document.getElementById("menu1").style.paddingTop="150px";
			document.getElementById("menu1").style.marginTop="-170px";
			
			document.getElementById("menu2").style.paddingTop="150px";
			document.getElementById("menu2").style.marginTop="-130px";
			
			document.getElementById("menu3").style.paddingTop="145px";
			document.getElementById("menu3").style.marginTop="-125px";
			
			document.getElementById("menu4").style.paddingTop="150px";
			document.getElementById("menu4").style.marginTop="-130px";
			}
		
		else 
			{
			document.getElementById("topmenu").style.position="relative";
			document.getElementById("topmenu").style.top="0px";
			document.getElementById("topmenu").style.marginTop="0px";
			document.getElementById("topmenu1").style.display="none";
			
			document.getElementById("topmenu2").style.display="none";
			
			document.getElementById("noview").style.paddingBottom="0px";
			
			document.getElementById("menu1").style.paddingTop="244px";
			document.getElementById("menu1").style.marginTop="-244px";
			
// 			document.getElementById("menu2").style.paddingTop="-45px";
// 			document.getElementById("menu2").style.marginTop="25px";

			document.getElementById("menu2").style.paddingTop="244px";
			document.getElementById("menu2").style.marginTop="-224px";
			
			document.getElementById("menu3").style.paddingTop="239px";
			document.getElementById("menu3").style.marginTop="-219px";
			
// 			document.getElementById("menu3").style.paddingTop="224x";
// 			document.getElementById("menu3").style.marginTop="-224px";

			document.getElementById("menu4").style.paddingTop="204px";
			document.getElementById("menu4").style.marginTop="-224px";
			
			//document.getElementById("noview").style.paddingBottom="0px";
			
			}
	}
 	
// 	function chgTop()
// 	{
// 		if(didScroll=true)
// 			{
// 		document.getElementById("topmenu2").style.display="none";
// 			}
// 		else
// 			{
// 			document.getElementById("topmenu2").style.display="block";			
// 			}
// 	}
	
	
	function proQuestWrite()
	{
		var userid = document.gform.userid.value;
		
		if(userid.length==0)
			{
 			if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?"))
 				{
 				location = "../member/login?pcode=${pvo.pcode}";					
 				}
			}
		else
			{
			var left = Math.ceil((window.screen.width-500)/2);
			var top = Math.ceil((window.screen.height-600)/2);
			window.open("../member/proQuestWrite?pimg=${pvo.pimg}&title=${pvo.title}&pcode=${pvo.pcode}","","width=500,height=600,left="+left+",top="+top);
			}
	}
	

	function chgBg(n)  //탑메뉴 클릭시 배경전환
	{
		var inmenu = document.getElementsByClassName("inmenu");
		
		document.getElementById("noview").style.paddingBottom="250px";
		
		for(i=0;i<inmenu.length;i++)
		  {
			inmenu[i].style.background="#F3F5F7";
			inmenu[i].style.color="#333333";
		  }
			inmenu[n].style.background="#3d3d4f";
			inmenu[n].style.color="white";
	}
	
	function reviewDel(no)
	{
		if(confirm("리뷰를 삭제 시 복구 및 재작성이 불가합니다.\n정말 삭제하시겠습니까?"))
			{
				location="reviewDel?no="+no+"&pcode=${pvo.pcode}";
			}
	}
	
	function reviewUpdate(color,size,no)
	{
		var left = Math.ceil((window.screen.width-500)/2);
		var top = Math.ceil((window.screen.height-680)/2);
		open("../member/reviewUpdate?pimg=${pvo.pimg}&color="+color+"&size="+size+"&pcode=${pvo.pcode}&title=${pvo.title}&no="+no,"","width=500,height=680,left="+left+",top="+top);
	}
	
	function proQuestDel(no)
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
	
	function proQuestUpdate(content,no,view,qtype)
	{
		open("../member/proQuestUpdate?title=${pvo.title}&pimg=${pvo.pimg}&pcode=${pvo.pcode}&content="+content+"&no="+no+"&view="+view+"&qtype="+qtype,"","width=500,height=600");
		
	}
	
	function getAnswer(n,ref)
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
			chk.open("get","getAnswer?ref="+ref);
			chk.send();
			}
	}
	
	function formChk(my)
	{
		if(my.colors.value.length==0)
			{
			alert("컬러를 선택해주세요.");
			return false;
			}
		else if(my.sizes.value=="")
			{
			alert("사이즈를 선택해주세요.");
			return false;
			}
		else
			{
			return true;
			}
	}
	function chgTop()
	{
		document.getElementById("topmenu").style.top="415px";
		
		document.getElementById("topmenu2").style.position="fixed";
		document.getElementById("topmenu2").style.display="block";
		document.getElementById("topmenu2").style.top="70px";
		
		document.getElementById("chgTopbtn").style.display="none";
		document.getElementById("chgTopbtn2").style.display="block";
	}
	
	function chgTop2()
	{
		document.getElementById("chgTopbtn").style.display="block";		
		document.getElementById("chgTopbtn2").style.display="none";
		document.getElementById("topmenu2").style.display="none";
		document.getElementById("topmenu").style.top="90px";
	}
	
	 function comma(num)
	    {
	    	return new Intl.NumberFormat().format(num);
	    }
	

</script>
</head>
  <section>
  
		<div id="content" style="padding-bottom:120px;margin-bottom:80px;border: 1px solid #dcdcdc;height:520px;">
			<div id="left">
				<img src="/static/product/${pvo.pimg}" width="450" height="510">
				
				<div style="margin-top:40px;width:300px;">
				<span style="color:#555555;font-size:15px;">리뷰수</span><span style="font-weight:900;font-size:24px;display:inline-block;vertical-align:sub;"> ${cnt} </span>
				<span  style="color:#555555;font-size:15px;"> · 사용자 총 평점</span> <span style="font-weight:900;font-size:24px;vertical-align:sub;">${pvo.star}.0<span style="color:#555555;font-weight:100;">/</span>5</span>
				</div>
			</div>
	
	
			<div id="right">
				<form method="post" action="proGumae" name="gform" onsubmit="return formChk(this)">
					<input type="hidden" name="userid" value=${userid}> 
					<input type="hidden" class="colors" name="colors"> 
					<input type="hidden" class="sizes" name="sizes"> 
					<input type="hidden" name="nos" value="0">
					<input type="hidden" name="price" value="${pvo.price}">
					<input type="hidden" name="pcodes" value="${pvo.pcode }">
					<div id="title">${pvo.title}</div>
					<div id="price" align="right">        
					<c:if test="${pvo.halin>0}">
					<span style="display:inline-block;float:left">${pvo.halin}%</span>
					<span style="text-decoration:line-through;color:#888888;font-size:17px;"><fmt:formatNumber value="${pvo.price}" type="number"/><span style="font-size:14px;">원</span></span>&nbsp<fmt:formatNumber value="${pvo.price-(pvo.price*pvo.halin/100)}" type="number" pattern="#,###"/><span id="won">원</span>
					</c:if>
					<c:if test="${pvo.halin==0}">
					<fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/><span id="won">원</span>
					</c:if>
					</div>
					<div id="bae">
						택배배송 | 3,000원<span style="color: #6799FF">(주문시 결제)</span> |
						CJ대한통운(오네)
					</div>
					<div id="bae1">제주 추가 4,000원 제주 외 도서지역 추가 7,000원</div>
					<div id="bae2">배송비 절약상품 보기></div>

					<div id="color">
						<select class="colorSel" onchange="checkColor(0)">
							<option value="">컬러</option>
							<c:forEach items="${pvo.color}" var="color">
								<c:if test="${color==0}">
									<option value="0">흰색</option>
								</c:if>
								<c:if test="${color==1}">
									<option value="1">검정</option>
								</c:if>
								<c:if test="${color==2}">
									<option value="2">네이비</option>
								</c:if>
								<c:if test="${color==3}">
									<option value="3">---</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<!-- color끝 -->
						<select class="nosize"  style="margin-top:10px;">
							<!-- 컬러 선택전 보이는 셀렉트 값 없음 -->
							<option>사이즈</option>
						</select>
						<!-- 컬러 정하기전 사이즈 셀렉트 숨기기 -->
					<div class="size" style="display:none;" >
						<select class="sizeSel" onchange="checkSize(0)"  style="margin-top:10px;">
							<option value="">사이즈</option>
							<c:forEach items="${pvo.size}" var="size">
								<c:if test="${size==0}">
									<option value="0">M(95)</option>
								</c:if>
								<c:if test="${size==1}">
									<option value="1">L(100)</option>
								</c:if>
								<c:if test="${size==2}">
									<option value="2">XL(105)</option>
								</c:if>
								<c:if test="${size==3}">
									<option value="3">2XL(110)</option>
								</c:if>
								<c:if test="${size==4}">
									<option value="4">3XL(115)</option>
								</c:if>
								<c:if test="${size==5}">
									<option value="5">4XL(120)</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<!--사이즈 셀렉트 끝 -->
					<!-- pro1 수량박스 위 컬러 사이즈 텍스트 -->
					<div  id="pro1" class="pro1" style="display:none;font-size:14px">
						<span class="color1">색상</span>&nbsp<span class="size1">사이즈</span>
					</div>
					<div class="prosu" style="display: none">
						<!-- 수량 박스 -->
						<div id="outer">
							<span id="left1"><input type="button" value="-"
								onclick="down(0)"></span> <span id="center"><input
								type="text"  name="sus" class="sus" size="1" value="0"></span> <span
								id="right1"><input type="button" value="+" onclick="up(0)"></span>
						</div>
						<!-- outer끝 -->
					</div>
					<!--  <div class="createDiv">ddd</div> --> <!--  Append.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.childAppend.child -->
					<!-- prosu끝 -->
					<div id="chong">
						<span>총 상품금액</span>
					</div>
					<div id="chong1" align="right">
						<span id="chong2" style="font-size:14px;">총 수량<span class="su2">0</span>개
						</span>&nbsp <span class="cprice" style="font-size:23px;font-weight:bold;color:#ff0000">0</span><span
							style="font-weight: 900; color: red; font-size: 20px">원</span>
					</div>
					<!--   		<div><input type="submit" value="구매하기"></div> -->
					<div>
						<button type="submit"
							style="width: 430px; font-weight: 900; font-size: 15px;line-height:20px;color:white;background:black;border:1px solid black;">
							<span style="display: inline-block; margin-top: 7px;"><img
								src="/static/main/gumaelogo.png"></span><span
								style="display: inline-block; vertical-align: top; margin-top: 11px;">구매하기</span>
						</button>
					</div>
					<div>
					
					<button type="button" style="width:49%;height:40px;font-size:15px;background:white;border:1px solid #dcdcdc" onclick="jjimAdd();">
					<span style="display:inline-block;">
					<img class="jjim" src="/static/main/${img}">
					</span>
					<span style="display:inline-block;vertical-align:top;margin-top:2px;font-weight:900;">
					찜리스트
					</span>
					</button>
					
					<button type="button" style="width:49%;height:40px;font-size:15px;font-weight:900;background:white;border:1px solid #333333" onclick="addCart(0)">
					<span style="display:inline-block;"><img src="/static/main/${cartimg}" style="background:white;"></span>
					<span style="display:inline-block;vertical-align:top;margin-top:2px;font-weight:900;color:${color}">
					장바구니
					</span>
					</button>
					</div>
				<!-- 	<div>
						<img id="jjim" src="/static/main/${img}" onclick="jjimAdd()">
						<c:set var="cart" value="장바구니에 담기" />
						<c:if test="${cartIn==1}">
							<c:set var="cart" value="장바구니에 이미 포함" />
						</c:if>
						<input type="button" value="${cart}" onclick="addCart()">
					</div>  -->
			  </form>
			</div>
			<!--id right 끝 -->
		
		</div>
		<!-- id content 끝 -->
  	<!-- ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss -->
  	<div id="topmenu1">
  	<div style="float:left;"><img src="/static/product/${pvo.pimg}" width="70" height="70"></div>
  	<div style="display:flex;justify-content:start;">
  	<div>
  	<div style="width:720px;padding-top:7px;font-weight:900;">&nbsp&nbsp${pvo.title}</div>
  	<div style="width:720px;font-size:19px;font-weight:900;color:#f40022;">
  	&nbsp 
  	<c:if test="${pvo.halin>0}">
  	<fmt:formatNumber value="${pvo.price-(pvo.price*pvo.halin/100)}" type="number" pattern="#,###"/>원&nbsp<span style="font-size:15px;text-decoration:line-through;color:#888888;font-weight:100;"><fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/>원</span>
  	</c:if>
  	<c:if test="${pvo.halin==0}">
  	<fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/>원
  	</c:if>
  	</div>
  	</div>
  	
  	<div style="height:60px;line-height:80px;">
  	<button id="chgTopbtn" style="width: 250px; font-weight: 900; font-size: 15px;line-height:20px;color:white;background:black;border:1px solid black;margin-left:57px;margin-top:7px;cursor:pointer;" onclick="chgTop()">
	<span style="display: inline-block; margin-top: 7px;"><img src="/static/main/gumaelogo.png"></span><span style="display: inline-block; vertical-align: top; margin-top:11px;">구매하기</span>
	</button>
  	</div>
	<div id="chgTopbtn2" style="display:none;font-size:40px;width:300px;text-align:right;padding-right:20px;" onclick="chgTop2()"><span style="cursor:pointer;">X</span></div>
  	
  	</div>
  	</div>
  	<form method="post" action="proGumae" onsubmit="return formChk(this)">
					<input type="hidden" name="userid" value=${userid}> 
					<input type="hidden" class="colors" name="colors"> 
					<input type="hidden" class="sizes" name="sizes"> 
					<input type="hidden" name="nos" value="0">
					<input type="hidden" name="price" value="${pvo.price}">
					<input type="hidden" name="pcodes" value="${pvo.pcode }">
   	<div id="topmenu2" style="margin-top:22px;display:none;width:1100px;height:315px;padding-bottom:10px;background:#f8f9fa;border:1px solid #eaeaea;"> 
   	<div style="display:flex;justify-content:space-between;">
   	
   	<div style="width:345px;font-size:14px;padding-left:20px;"><!--  -->
   	<div style="margin-top:20px;">택배배송 | <span style="font-weight:bold;">3,000원</span><span style="color:#6b90dc">(주문시 결제)</span>·로젠택배</div>
   	<div style="margin-top:5px;color:#999999;">제주 추가 3,000원, 제주 외 도서지역 추가 6,000원</div>
   	<div style="margin-top:5px;color:#6b90dc;padding-bottom:20px;border-bottom:1px solid #ededed;margin-right:25px;">배송비 절약상품 보기 ></div>
   	</div> 
   	
   	<div style="width:345px;height:320px;border-left:1px solid #eaeaea;border-right:1px solid #eaeaea;padding-left:20px;"> <!--  -->
   	<div style="margin-top:20px;">
   	<select  class="colorSel" onchange="checkColor(1)" style="width:290px;height:35px;">
							<option value="">컬러</option>
							<c:forEach items="${pvo.color}" var="color">
								<c:if test="${color==0}">
									<option value="0">흰색</option>
								</c:if>
								<c:if test="${color==1}">
									<option value="1">검정</option>
								</c:if>
								<c:if test="${color==2}">
									<option value="2">네이비</option>
								</c:if>
								<c:if test="${color==3}">
									<option value="3">---</option>
								</c:if>
							</c:forEach>
						</select>
   	</div>
   	<select class="nosize"  style="margin-top:10px;width:290px;height:35px;">
							<!-- 컬러 선택전 보이는 셀렉트 값 없음 -->
							<option>사이즈</option>
						</select>
   	<div class="size" style="margin-top:5px;display:none;">
   	<select class="sizeSel" onchange="checkSize(1)" style="margin-top:10px;width:290px;height:35px;">
							<option value="">사이즈</option>
							<c:forEach items="${pvo.size}" var="size">
								<c:if test="${size==0}">
									<option value="0">M(95)</option>
								</c:if>
								<c:if test="${size==1}">
									<option value="1">L(100)</option>
								</c:if>
								<c:if test="${size==2}">
									<option value="2">XL(105)</option>
								</c:if>
								<c:if test="${size==3}">
									<option value="3">2XL(110)</option>
								</c:if>
								<c:if test="${size==4}">
									<option value="4">3XL(115)</option>
								</c:if>
								<c:if test="${size==5}">
									<option value="5">4XL(120)</option>
								</c:if>
							</c:forEach>
   	</select></div>
   	</div>
   	
   	<div style="width:320px;padding:0px 25px;"> <!--  -->
   	
   	<div class="pro1" style="display:none;font-size:14px;margin-top:20px;"> <!-- id pro1 -->
	  <span class="color1">색상</span><span> / </span><span class="size1">사이즈</span>
	</div>
	<div class="prosu" style="display:none;margin-top:10px;border-bottom:1px solid #c7c7c7;padding-bottom:20px;">
	  <div id="outer">
	    <span id="left1"><input type="button" value="-" onclick="down(1)"></span> 
	    <span id="center"><input type="text" name="sus" class="sus" size="1" value="0"></span>
	    <span id="right1"><input type="button" value="+" onclick="up(1)"></span>
	  </div>
	</div>
	
	
   	<div style="font-size:14px;margin-top:0px;color:#999999;margin-top:20px;" align="right">총 수량 <span class="su2">0</span>개</div>
   	<div style="display:flex;justify-content:space-between;margin-top:5px;">
   	<div style="font-weight:900;font-size:14px;line-height:30px;">총 상품금액</div><div style="color:#d40022;"><span style="font-weight:bold;font-size:20px;"><span class="cprice">0</span></span>원</div>
   	</div>
   	<div style="margin-top:10px;">
   	<button type="submit" style="width:310px;font-weight:900;height:50px;font-size:15px;color:white;background:black;border:1px solid black;margin-left:5px;">
	<span style="display: inline-block; margin-top: 7px;"><img src="/static/main/gumaelogo.png"></span>
	<span style="display: inline-block; vertical-align: top; margin-top:11px;">구매하기</span>
	</button>   	
   	</div>
   	<div style="margin-top:5px;width:310px;margin-left:5px;padding-right:26px;">
   	<button type="button" style="width:49%;height:40px;font-size:15px;background:white;border:1px solid #dcdcdc" onclick="jjimAdd();">
					<span style="display:inline-block;vertical-align:top;margin-top:2px;">
					<img class="jjim" src="/static/main/${img}">
					</span>
					<span style="display:inline-block;vertical-align:top;margin-top:2px;font-weight:900;">
					찜리스트
					</span>
					</button>
					
	<button type="button" style="width:49%;height:40px;font-size:15px;background:white;border:1px solid #333333" onclick="addCart(1)">
					<span style="display:inline-block;vertical-align:top;margin-top:2px;"><img src="/static/main/${cartimg}" style="background:white;"></span>
					<span style="display:inline-block;vertical-align:top;margin-top:2px;font-weight:900;color:${color}">
					장바구니
					</span>
					</button>
   	</div>
   	</div>
   	
   	
   	</div>
   	</div>
   	</form>
  	
  	 <!-- 구매 form 끝  탑 메뉴 구매하기 버튼 쓰려고 내림-->
  	<div id="noview" style="border:1px solid red;visibility:hidden;"></div> <!-- noview@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
  	<div id="topmenu">
  		<ul>
  			<li onclick="chgBg(0)"><a class="inmenu" style="display:block;" href="#menu1">상세정보</a></li>
  			<li onclick="chgBg(1)"><a class="inmenu" style="display:block;" href="#menu2">리뷰 <span style="font-size:15px;">${cnt}</span></a></li>
  			<li onclick="chgBg(2)"><a class="inmenu" style="display:block;" href="#menu3">Q&A <span style="font-size:15px;">${qcnt}</span></a></li>
  			<li onclick="chgBg(3)"><a class="inmenu"style="display:block;" href="#menu4">반품/교환정보</a></li>
  		</ul>
  	</div>
  	<div id="cimg" style="width:1100px;" align="center">
  	<h3 id="menu1" align="left">상품상세</h3>  <!-- sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss -->
  	<img src="../static/product/${pvo.cimg}" width="400px;" height="500px;">
  	</div>
  	
  	
  	<div style="margin-bottom:100px;"> <!-- 리뷰시작 -->
  	<div style="border-bottom:2px solid black;">
  	<h3 id="menu2">상품리뷰</h3>
  	</div>
  	
  	<div style="background:#f8f9fb;border-bottom:1px solid #777777;margin-top:30px;font-weight:900;text-align:center;padding-bottom:30px;"> <!-- 백그라운드 시작 -->
  	<div style="display:flex;justify-content:start;padding-top:30px;"> <!-- 리뷰 요약 -->
  	<div style="width:33%;font-size:14px;">사용자 총 평점</div>
  	<div style="width:33%;font-size:14px;">전체 리뷰수</div>
  	<div style="width:33%;font-size:14px;">평점 비율</div>
  	</div>
  	
  	<div style="display:flex;justify-content:start;"> <!-- 리뷰 요약 -->
  	
  	<div style="width:33%;display:flex;justify-content:start;padding-left:3px;margin-top:40px;background:#f8f9fb">
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  	<c:forEach begin="1" end="${pvo.star}" >
  	<img src="/static/main/rstar1.png" width="40px" height="40px">
  	</c:forEach>
  	<c:forEach begin="1" end="${5-pvo.star}" >
  	<img src="/static/main/gstar1.png" width="40px" height="40px">
  	</c:forEach>
  	</div>
  	
  	<div style="width:33%;margin-top:40px;"><img src="/static/main/review1.png"></div>
  	<div style="width:33%;margin-top:40px;"><img src="/static/main/graph.png"></div>
  	</div>
  	
  	<div style="display:flex;justify-content:start;"> <!-- 리뷰 요약 -->
  	<div style="width:33%;font-size:35px;color:#313131;">${pvo.star}.0<span style="color:#e1e3e5;font-weight:100;">/</span><span style="color:#e1e3e5;">5</span></div>
  	<div style="width:33%;font-size:35px;;color:#313131;padding-left:7px;">${cnt}</div>
  	</div>
  	</div> <!-- 백그라운드 끝 -->

	<div style="display:flex;justify-content:space-between;border-bottom:1px solid #e3e5e8;padding-bottom:20px;padding-top:20px;">
	<div style="font-weight:900;">리뷰${cnt}건</div>
	<div>랭킹순 | 최신순 | 평점 높은순 | 평점 낮은순</div>
	</div>  	
	<c:if test="${cnt==0}">
	<div align="center" style="border-bottom:1px solid #e3e5e8;">
	<div style="margin-top:70px;"><img src="/static/main/review.png"></div>
	<div style="margin-bottom:70px;color:#888888;font-size:13px;">아직 작성된 리뷰가 없습니다.</div>
	</div>
	</c:if>
	
 	<c:forEach items="${rlist}" var="rvo">
		<div style="display:flex;justify-content:start;padding-top:15px;padding-bottom:15px;border-bottom:1px solid #e3e5e8;">
		<div><img src="/static/main/pic.png"></div>
		<div>
		<div style="display:flex;justify-content:start;margin-left:5px;">
		<c:forEach begin="1" end="${rvo.star}">
		<img src="/static/main/rstar.png" width="20px" height="20px">
		</c:forEach>
		<c:forEach begin="1" end="${5-rvo.star}">
		<img src="/static/main/gstar.png" width="20px" height="20px">
		</c:forEach>
		<span style="font-weight:900;font-size:20px;line-height:20px;margin-left:10px;">${rvo.star}</span>
		</div>
		<div style="display:flex;justify-content:space-between;">
		<div style="color:#999999;margin-top:5px;font-size:13px;margin-left:5px;">${rvo.userid} &nbsp ${rvo.writeday }&nbsp&nbsp | &nbsp신고</div>
		<c:if test="${rvo.userid==userid}">
		<div style="margin-top:10px;margin-left:750px;font-size:13px;"> <span onclick="reviewUpdate(${rvo.color_1},${rvo.size_1},${rvo.no})">수정</span> &nbsp|&nbsp <span onclick="reviewDel(${rvo.no})">삭제</span></div>
		</c:if>
		</div>
		<div style="color:#999999;margin-top:5px;font-size:13px;margin-left:5px;">색상: ${rvo.color} / 사이즈: ${rvo.size}</div>
		<div style="color:#5f5f5f;margin-top:10px;font-size:15px;margin-left:5px;">${rvo.content}</div>
		</div>
		</div>
 	</c:forEach>
  	</div> <!-- 리뷰끝 -->
  	
  	
  	<div> <!-- Q&A시작 -->
  	<span id="menu3" style="font-size:22px;font-weight:900;">Q&A</span>
  	<div style="margin-top:15px;">
  	<input type="button" value="Q&A 작성하기" onclick="proQuestWrite()" style="width:135px;height:35px;background:#333333;border:1px solid #333333;color:white;">
  	<input type="button" value="나의 Q&A 조회" onclick="proQuestWrite()" style="width:135px;height:35px;background:#999999;border:1px solid #999999;color:white;">
  	</div>
  	<div style="width:100%;border-bottom:2px solid black;padding-bottom:20px;"></div>
  	<c:if test="${qcnt==0}">
	<div align="center">
	<div style="margin-top:70px;border-top:1px solid #e3e5e8;padding-top:70px;"><img src="/static/main/qna.png"></div>
	<div style="margin-bottom:70px;color:#888888;border-bottom:1px solid #e3e5e8;padding-bottom:70px;font-size:13px;">작성된 상품 Q&A가 없습니다.</div>
	</div>
	</c:if>
	<c:if test="${qcnt!=0}">
  	<div style="width:1100px;height:35px;display:flex;justify-content:space-between;text-align:center;line-height:35px;border-bottom:1px solid #dadada;">
	  	<div style="width:100px;">구분</div>
	  	<div style="width:640px;">내용</div>
	  	<div style="width:100px;">답변여부</div>
	  	<div style="width:130px;">작성자</div>
	  	<div style="width:130px;">등록일</div>
  	</div>
  	</c:if>
  	<c:forEach items="${qlist}" var="qvo" varStatus="my">
  	<div style="font-size:14px;"> <!-- Q&A전체 스타일 적용 -->
	  	<div style="width:1100px;height:35px;line-height:35px;display:flex;justify-content:space-between;text-align:center;border-bottom:1px #eaeced;">
	  	<c:if test="${qvo.qtype==0}">
	  	<div style="width:100px;">사이즈</div>
	  	</c:if>
	  	<c:if test="${qvo.qtype==1}">
	  	<div style="width:100px;">배송</div>
	  	</c:if>
	  	<c:if test="${qvo.qtype==2}">
	  	<div style="width:100px;">재입고</div>
	  	</c:if>
	  	<c:if test="${qvo.qtype==3}">
	  	<div style="width:100px;">기타</div>
	  	</c:if>
	  	<c:if test="${qvo.view==1}">
	  	<div style="width:640px;text-align:left;overflow:hidden;" onclick="getAnswer(${my.index},${qvo.ref})">&nbsp&nbsp&nbsp${qvo.content}</div>
	  	</c:if>
	  	<c:if test="${qvo.view==0 && qvo.userid!=userid}"> <!-- 비공개  다른 아이디-->
	  	<div style="width:640px;text-align:left;overflow:hidden;cursor:pointer;color:#aaaaaa;" onclick="alert('비공개 문의내역은 작성자 본인만 확인하실 수 있습니다.')">&nbsp&nbsp비밀글입니다.
	  	<span style="display:inline-block;float:right;margin-top:3px;margin-right:515px;"><img src="/static/main/lock.png"></span></div>
	  	</c:if>
	  	<c:if test="${qvo.view==0 && (qvo.userid==userid) }"> <!-- 비공개  같은 아이디-->
	  	<div style="width:640px;text-align:left;overflow:hidden;">
	  	<span style="display:inline-block;vertical-align:top;cursor:pointer;" onclick="getAnswer(${my.index},${qvo.ref})">&nbsp&nbsp&nbsp${qvo.content}</span>
	  	<span style="display:inline-block;margin-top:3px;width:20px;"><img src="/static/main/lock.png"></span>
	  	</div>
	  	</c:if>
	  	
	  	<c:if test="${qvo.ref==1}">
	  	<div style="width:100px;color:#5f5f5f;">답변대기</div>
	  	</c:if>
	  	<c:if test="${qvo.ref==2}">
	  	<div style="width:100px;font-weight:900;">답변완료</div>
	  	</c:if>
	  	<div style="width:130px;overflow:hidden;font-size:14px;">${qvo.userid2}</div>
	  	<div style="width:130px;font-size:14px;">${qvo.writeday_date}</div>
	  	</div>
	  	</div>
	  	
 	  	<div class="answer" style="display:none;"></div>
 	  	
 	  	<!-- ajax실행 문구 -->
 	  	<!-- 
	  	<div style="width:1100px;background:#f7f8fa;padding-bottom:30px;font-size:14px;">  
	  	<div style="margin-left:115px;padding-top:20px;">
 	  	<div style="width:500px;color:#5f5f5f;">${qvo.content}</div> 
 	  	<div style="margin-top:20px;color:#a3a3a3"><span style="cursor:pointer" onclick="proQuestUpdate('${qvo.content}',${qvo.no},${qvo.view },${qvo.qtype})">수정</span> | <span style="cursor:pointer" onclick="proQuestDel(${qvo.no})">삭제</span></div> 
 	  	
 	  	<div style="display:flex;justify-content:space-between;"> 
 	  	<div style="margin-top:20px;padding-top:30px;border-top:1px solid #eaeced;width:500px;">└답변 안녕하세요 고객님 어쩌구 저쩌구이시고 어쩌구 입니다 감사합니다 	</div>
 	  	<div style="padding-top:50px;margin-left:220px;">운영자</div>
 	  	<div style="padding-top:50px;margin-right:30px;">2024-02-03</div>
 	  	</div>  
 	  	</div>
 	  	</div> -->
 	  	<!-- ajax 끝 -->
 	  	
  	</c:forEach>
  	</div><!-- Q&A끝 -->
  	
  	
  	
  	
  	<div> <!-- 반품교환 시작 -->
  	<h3 id="menu4">반품/교환정보</h3>
  	<img src="../static/main/exch1.png" width="1100px" style="border-top:2px solid black">
  	<img src="../static/main/exch2.png" width="1100px">
  	</div> <!-- 반품교환 끝 -->
  </section>





</body>
</html>