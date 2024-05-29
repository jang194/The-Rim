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
body{
margin:0;
}

section{
width:100%;
height:100vh;
}

section input[type=button]{
cursor:pointer;
}


.star{
	cursor:pointer;
	}
	
	#modal{
	position:absolute;
	background-color:rgba(0,0,0,0.4);
 	display:none;
	top:0px;
	left:0px;
	width:100%;
	height:100%;
	}
	
	
	#modal_body{
	width:300px;
	height:300px;
	top:50%;
	left:50%;
	position:absolute;	
	border-radius:8px;
	background:white;
	text-align:center;
	transform: translateX(-50%) translateY(-50%);
	}
	
	
/*	.modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }
      
      .modal_body {
  position: absolute;
   top: 50%; 
   left: 50%;

  width: 400px;
  height: 600px;

  padding: 40px;

  text-align: center;

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

   transform: translateX(-50%) translateY(-50%); 
}*/

</style>
<script>
	function chgStar(n)
	{
		for(i=0;i<=n;i++)
		  {
		    document.getElementsByClassName("star")[i].src="/static/main/rstar.png";
		    document.getElementById("starsub2").innerText="만족도"+(n+1)+"점을 주셨네요.";
			document.getElementById("starsub2").style.display="block";
		  }
		for(i=n+1;i<=4;i++)
			{
		    document.getElementsByClassName("star")[i].src="/static/main/gstar.png";			
			}
		if(n==0)
			{
			document.getElementById("starsub").innerText=n+1+"점 (별로예요)";
			document.getElementById("starsub3").innerText="어떤 점이 아쉬웠나요?";
			}
		else if(n==1)
			{
			document.getElementById("starsub").innerText=n+1+"점 (그저그래요)";			
			document.getElementById("starsub3").innerText="어떤 점이 아쉬웠나요?";
			}
		else if(n==2)
			{
			document.getElementById("starsub").innerText=n+1+"점 (괜찮아요)";			
			document.getElementById("starsub3").innerText="어떤 점이 좋았나요?";
			}
		else if(n==3)
			{
			document.getElementById("starsub").innerText=n+1+"점 (좋아요)";			
			document.getElementById("starsub3").innerText="어떤 점이 좋았나요?";
			}
		else if(n==4)
			{
			document.getElementById("starsub").innerText=n+1+"점 (최고예요)";			
			document.getElementById("starsub3").innerText="어떤 점이 좋았나요?";
			}
		
		
		document.rform.star.value=n+1;  //star value값
		
	}
	
	function lenChk(my)
	{
		document.getElementById("msg").innerText=my.length;
	}
	
	function viewReviewOk()
	{

		
		var pcode = document.rform.pcode.value;
		var star = document.rform.star.value;
		var content = document.rform.content.value;
		var no = document.rform.no.value;
		var ppcode = document.rform.ppcode.value;
		if(star==0)
			{
			alert("별점을 선택해주세요.");
			return false;
			}
		else if(content.length<=9)
			{
			alert("내용을 최소 10자 이상 적어주세요.")
			return false;
			}
		else
			{
       var chk = new XMLHttpRequest();  //sbmit버튼 클릭시 페이지 전환 방지용 제이쿼리 사용
       chk.onload=function()
       {
    	
       }
       chk.open("get","reviewWriteOk?pcode="+pcode+"&star="+star+"&content="+content+"&no="+no+"&ppcode="+ppcode+"&color=${color}&size=${size}");
       chk.send();
		document.getElementById("modal").style.display="block";
			}
	}	
	
	function reloadPararent()
	{
		window.close();
		opener.location.reload();
	}
	
</script>
</head>
<body>
<section>
<form method="post" action="reviewWriteOk" name="rform" autocomplete="off" on>
<input type="hidden" name="pcode" value="${pcode}">
<input type="hidden" name="ppcode" value="${ppcode}">
<input type="hidden" name="no" value="${no}">
<input type="hidden" name="star" value="0">

<div style="display:flex;justify-content:space-between;height:60px;line-height:60px;">
		<div style="margin-left:30px;line-height:75px;"><img src="/static/main/gumaelogo.png" onclick="location='../main/main'" style="cursor:pointer;"></div><div style="font-weight:900;font-size:20px;">리뷰 작성</div><div style="line-height:70px;margin-right:15px;cursor:pointer;" onclick="window.close()"><img src="/static/main/close.png"></div>
	</div>

<div style="display:flex;justify-content:start;padding-top:15px;border-top:1px solid #888888"> <!-- 제품이름 -->
<div style="padding-left:15px;"><img src="/static/product/${pimg}" width="130" height="150"></div>
<div style="font-size:14px;padding-left:10px;">
<div style="font-weight:bold;">${title}</div>
<div style="margin-top:5px;color:#959692;"><span style="border:1px solid #dddde1;">옵션</span> 컬러:
<c:if test="${color==0}">
	 흰색
	 </c:if>
	 <c:if test="${color==1}">
	 검정
	 </c:if>
	 <c:if test="${color==2}">
	 네이비
	 </c:if>
	 <c:if test="${color==3}">
	 이미지참조
	 </c:if>
 / 사이즈:
 <c:if test="${size==0}">
	 M (95)
	 </c:if>
	   <c:if test="${size==1}">
	 L (100)
	 </c:if>
	   <c:if test="${size==2}">
	 XL (105)
	 </c:if>
	   <c:if test="${size==3}">
	 2XL (110)
	 </c:if>
	   <c:if test="${size==4}">
	 3XL (115)
	 </c:if>
	   <c:if test="${size==5}">
	 4XL (120)
	 </c:if>
 </div>
</div>
</div>

<div align="center" style="margin-top:20px;"> <!-- 별점 -->
<div style="font-weight:bold;">상품은 만족하셨나요?</div>
<div> <!-- 별 이미지 -->
<img src="/static/main/gstar.png" class="star" onclick="chgStar(0)">
<img src="/static/main/gstar.png" class="star" onclick="chgStar(1)">
<img src="/static/main/gstar.png" class="star" onclick="chgStar(2)">
<img src="/static/main/gstar.png" class="star" onclick="chgStar(3)">
<img src="/static/main/gstar.png" class="star" onclick="chgStar(4)">
</div>
<div id="starsub" style="color:#959595;">선택하세요.</div>
</div>

<div align="center" style="margin-top:30px;">
<div id="starsub2" style="display:none;font-weight:bold;">만족도 5점을 주셨네요.</div>
<div id="starsub3" style="font-weight:bold;">어떤 점이 좋았나요?</div>
</div>

<div style="border:1px solid #cbcbcb;height:170px;margin-left:20px;margin-right:20px;">
<textarea name="content" onkeyup="lenChk(this.value)" style=" width: calc(100% - 30px);box-sizing:border-box;word-break:break-all;resize:none;height:125px;margin-left:15px;margin-top:10px;outline:none;" placeholder="최소 10자 이상 입력해주세요."></textarea>
<div align="right"><span id="msg">0</span>/5,000</div>
</div>

<div align="center" style="white-space:nowrap;margin-top:30px;">
<input style="width:49.5%;height:40px;font-weight:bold;color:white;background:black;border:1px solid black;" type="button" value="취소" onclick="window.close()">
<!-- <input style="width:49.5%;height:40px;" type="submit" value="등록" onclick="confirmReview()"> -->
<input style="width:49.5%;height:40px;font-weight:bold;color:white;background:black;border:1px solid black;" type="button" value="등록" onclick="viewReviewOk()">
</div>
</form>
</section>
<div id="modal">
	<div id="modal_body">
		<div style="font-weight:900;margin-top:30px;font-size:23px;">포인트 150원 </div>
		<div style="margin-top:15px;font-weight:bold;font-size:18px;color:#333333;">리뷰 작성 완료!</div>
		<div style="font-size:14px;color:#888888;margin-top:10px;">${userid}님의 즐거운 쇼핑을 위해</div>
		<div style="font-size:14px;color:#888888;margin-top:5px;">포인트 두둑하게 챙겨드려요:)</div>
		<div align="left" style="margin-top:25px;font-size:15px;color:#666666;font-weight:900;margin-left:40px;">나의 포인트  
		<span style="display:inline-block;margin-left:60px;"><fmt:formatNumber type="number" value="${mvo.juk+150}"/>원</span></div>
		<input type="button" value="확인" style="border-radius:5px;width:260px;height:40px;margin-top:30px;font-weight:bold;color:white;background:black;border:1px solid black;" onclick="reloadPararent()">
	</div>
</div>

</body>
</html>