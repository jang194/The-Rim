<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


body{
margin:0px;
}

#wrap{
	min-height: calc(100vh - 150px);
	}

a{
text-decoration:none;
color:black;
}

nav{
width:1700px;
height:80px;
line-height:80px;
margin:auto;
margin-top:50px;
//border:1px solid yellow;
}

nav div{
display:inline-block;
}

nav #left{
//border:1px solid black;
width:100px;
height:80px;
vertical-align:top;
}

nav #center{
width:1200px;
//border:1px solid red;
}

nav #main{
padding-left:0px;
}

nav #main .category{
list-style-type:none;
display:inline-block;
width:120px;
height:30px;
margin-left:30px;
vertical-align:middle;
line-height:30px;
text-align:center;
//border:1px solid black;
position:relative;
top:-20px;
left:-40px;
font-size:14px;
font-weight:900;
}
nav #main .category:nth-last-child(-n+3){
list-style-type:none;
display:inline-block;
width:90px;
height:30px;
margin-left:23px;
vertical-align:middle;
line-height:30px;
text-align:center;
//border:1px solid black;
position:relative;
top:-20px;
left:-40px;
font-size:14px;
font-weight:900;
color:#333333;
}
nav #main .category:nth-child(-n+3){
list-style-type:none;
display:inline-block;
width:175px;
height:30px;
margin-left:23px;
vertical-align:middle;
line-height:30px;
text-align:left;
//border:1px solid black;
position:relative;
top:-20px;
left:-40px;
font-size:14px;
font-weight:900;
color:#333333;
}
nav #main .category:nth-child(-n+3) #sub{
width:175px;
padding-left:0px;
position:absolute;
visibility:hidden;
background:white;

}

nav #main .category:nth-child(-n+3) #sub li{
list-style-type:none;
//border:1px solid blue;
width:165px;
margin-left:-2px;
font-weight:400;
padding-left:10px;
}



nav #main .category #sub{
width:120px;
padding-left:0px;
position:absolute;
visibility:hidden;
background:white;
text-align:left;
border:1px solid #e3e5e8;
}


nav #main .category #sub li{
list-style-type:none;
//border:1px solid blue;
width:115px;
margin-left:-2px;
font-weight:400;
padding-left:5px;
}



nav #right{
width:350px;
float:right;
height:50px;
line-height:50px;
text-align:center;
//border:1px solid black;
vertical-align:top;
}

#right #mymenu{
position:relative;
}

#right #mymenu #submy{
width:130px;
position:absolute;
background:white;
border:1px solid #e3e5e8;
padding-left:0px;
top:20px;
left:-30px;
visibility:hidden;

}

#right #mymenu #submy li{
line-height:40px;
text-align:left;
height:40px;
padding-left:10px;
list-style-type:none;
font-size:12px;
}

footer{
 height:150px;
}

</style>
<script>
	function subview(n)
	{
		document.getElementsByClassName("sub")[n].style.visibility="visible";
	}
	
	function subhide(n)
	{
		document.getElementsByClassName("sub")[n].style.visibility="hidden";
	}
	
	function viewMy()
	{
		var sub = document.getElementById("submy");
		
		if(sub.style.visibility==='visible')
			{
			sub.style.visibility='hidden';
			}
		else
			{
			sub.style.visibility='visible';
			}
	}

</script>

<sitemesh:write property="head"/>
</head>

<body>
<div id="wrap">
<nav>
	<div id="left"><a href="../main/main"><img src="/static/main/mark.png" width="100"></a></div>
	<div id="center">
		<ul id="main" align="center">
			<li class="category" onmouseover="subview(0)" onmouseout="subhide(0)">&nbsp하계유니폼(S_UNIFORM)
				<ul id="sub" class="sub">
					<li><a href="../product/productList?pcode=p0101">농구(basketball)</a></li>
					<li>축구(football)</li>
					<li>배구(volleyball)</li>
					<li>야구(baseball)</li>
					<li>배드민턴(badminton)</li>
					<li>육상(track and field)</li>
				</ul>
			</li>
			<li class="category" onmouseover="subview(1)" onmouseout="subhide(1)">&nbsp동계유니폼(F_UNIFORM)
				<ul id="sub" class="sub">
					<li>바람막이</li>
					<li>스탠다드 바람막이</li>
					<li>슈팅져지</li>
					<li>트레이닝세트</li>
					<li>후드집업세트</li>
					<li>야구점퍼</li>
					<li>패딩</li>
				</ul>
			</li>
			<li class="category" onmouseover="subview(2)" onmouseout="subhide(2)">&nbsp단체복(CLUBWEAR)
			<ul id="sub" class="sub">
				<li>반팔</li>
				<li>맨투맨</li>
				<li>후드</li>
				<li>아노락/플리스</li>
				<li>폴로셔츠</li>
				<li>면티커스텀</li>
				<li>바지</li>
				<li>후드/맨투맨/바지</li>
				<li>기능성조끼</li>
			</ul>
			</li>
			<li class="category" onmouseover="subview(3)" onmouseout="subhide(3)" style="text-align:left;">&nbsp굿즈(GOODS)
				<ul id="sub" class="sub">
					<li>&nbsp모자</li>
					<li>&nbsp타월</li>
					<li>&nbsp양말</li>
					<li>&nbsp가방</li>
					<li>&nbsp텀블러</li>
				</ul>
			</li>
			<li class="category">보호대
			</li>
			<li class="category">체육복
			</li>
			<li class="category">제작문의
			</li>
		</ul>
	</div>
	<div id="right">
	<c:if test="${userid==null}">
	<a href="../member/member">회원가입</a>  |  <a href="../member/login">로그인</a>
	</c:if>
	<c:if test="${userid!=null}">
	${name}님 
		<c:if test="${userid!='admin'}">
		|
	<span id="mymenu"><span onclick="viewMy()" style="cursor:pointer;"> 회원정보</span>
	<ul id="submy">
		<li><a href="../member/userModify">회원정보 변경</a></li>
		<li><a href="../member/mypage">My 쇼핑</a></li>
		<li><a href="../product/jjimList">찜한 상품</a></li>
		<li><a href="../product/cartList">장바구니</a></li>
		<li><a href="../member/jumunList">주문확인/배송조회</a></li>
		<li><a href="../calendar/gumaeCal">월별 구매내역 검색</a></li>
	</ul>
	</span> <!-- 회원정보 태그 -->
		</c:if>
	| <a href="../member/logout">로그아웃</a>
	</c:if>
	  | 
	  <c:if test="${userid!='admin'}">
	  <a href="../member/customList">문의내역</a>
	  </c:if>
	  <c:if test="${userid=='admin'}">
	  <a href="../admin/main">관리자페이지</a>	  
	  </c:if>
	
	  
	  
	  </div>
</nav>


<sitemesh:write property="body"/>
</div>
<footer style="background:#2E2E2E;">
<div align="center" style="margin-top:-4px;">
<img src="/static/main/bottom.png" style="width:1903px;">
</div>
</footer>
</body>
</html>