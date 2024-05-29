<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	section{
	max-width:100%;	
	width:1902px;
	margin:auto;
	}

	section #first{
	margin-top:50px;
	overflow:hidden;
	}
	
	section #first #pic{
	width:1920px;
	max-width:100%;
	height:600px;
	text-align:center;
	}
	
	section #first #imgs{
	width:12000px;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(function()
		{
			setInterval(function()
					{
						$("#imgs").animate(
								{
									marginLeft:"-1902px"	
								},3000,function()
								{
							       $(".img").eq(0).insertAfter( $(".img").eq(5) );
							       $("#imgs").css("margin-left","0px");
								});
					},5000);
		});

		

</script>
</head>
<body>
<section>
	<div id="first">
	  <div id="imgs">
 		<img class="img" src="/static/main/main1.png">
 		<img class="img" src="/static/main/main9.png">
 		<img class="img" src="/static/main/main10.png">
 		<img class="img" src="/static/main/main11.png">
 		<img class="img" src="/static/main/main12.png">
 		<img class="img" src="/static/main/main13.png">
 	  </div>
	</div>
	
	<div align="center" style="margin-top:110px;margin-bottom:110px;">
	<div style="font-size:30px;">THERIM(더림)</div>
	<div style="font-size:25px;">Custom Sportswear Emotional Design</div>
	<div style="margin-top:12px;">더림은 고객과 소통하며 함꼐 만들고자 합니다.</div>
	</div>
	
	<div>
		<img src="/static/main/main2.png">
	</div>
	
	<div align="center" style="margin-top:110px;margin-bottom:110px;">
	<div style="font-size:30px;">JUST SPORTSWEAR</div>
	<div style="font-size:25px;">Functional Sportswear Line-up For Active Activities</div>
	<div style="margin-top:12px;">역동적이고 세련된 스타일로 더 가볍고 더 쾌적하게</div>
	</div>
	
	<div style="border:none;">
		<img src="/static/main/main3.png">
	</div>
	
	<div style="margin-top:-4px;">
		<img src="/static/main/main4.png">
	</div>
	
	<div align="center" style="margin-top:110px;margin-bottom:110px;">
	<div style="font-size:30px;">CUSTOMIZE UNIFORM SERVICE</div>
	<div style="margin-top:12px;">유니폼은 100% 국내생산으로 제작하고 있습니다.</div>
	<div style="margin-top:12px;">주문과 동시에 제작이 진행되므로 제작시간이 필요한</div>
	<div style="margin-top:12px;">맞춤 제작 유니폼입니다.</div>
	</div>
	
	<div>
		<img src="/static/main/main5.png">
	</div>
	
	<div style="margin-top:-4px;">
		<img src="/static/main/main6.png">
	</div>
	
	<div align="center" style="margin-top:110px;margin-bottom:110px;">
		<div style="font-size:30px;">CUSTOMIZE SERVICE</div>
		<div style="margin-top:12px;">맞춤 제작 전문 '더림'의 모든 제품은</div>
		<div style="margin-top:12px;">주문과 동시에 제작이 진행되므로</div>
		<div style="margin-top:12px;">제작시간이 필요한 시스템입니다.</div>
	</div>
	
	<div>
		<img src="/static/main/main7.png">
	</div>
	
		<div align="center" style="margin-top:110px;margin-bottom:110px;">
			<div style="font-size:30px;">CUSTOMIZE GROUP SUIT</div>	
			<div style="margin-top:12px;">데일리룩에서 기능성 스포츠웨어까지</div>	
			<div style="margin-top:12px;">우리를 위한 특별한 단체복</div>	
			<div style="margin-top:12px;">맞춤디자인 맞춤제작 전문 더림</div>	
		</div>
		
	<div style="margin-bottom:0px;">
		<img src="/static/main/main8.png">
	</div>
	
</section>

</body>
</html>