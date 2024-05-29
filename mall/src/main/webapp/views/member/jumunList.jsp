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
//border:1px solid black;
}

.jumunbtn{
background:#f3f5f7;
border:1px solid #f3f5f7;
color:#404048;
}

.jumunList:nth-child(2){
padding-bottom:25px;
border-top:2px solid black;
}
.jumunList:last-child{
padding-bottom:25px;
border-bottom:2px solid black;
}

.jumunList{
padding-bottom:25px;
border-bottom:1px solid black;
}

button{
cursor:pointer;
}

input[type=button]
{
cursor:pointer;
}



</style>
<script>
	function jlistDel(jumuncode,cnt)
	{
		if(cnt>1)
			{
			if(confirm("함께 주문한 전체 상품의 결제내역이 삭제되어 복구할 수 없으며, 삭제 이후 상품에 대한 리뷰작성이 불가능합니다. 정말 삭제하시겠습니까?"))
			  {
			  location="jlistDel?jumuncode="+jumuncode;
			  }
			}
		else
			{
			if(confirm("삭제된 내역은 복구할 수 없습니다.정말로 삭제하시겠습니까?"))
				{
				location="jlistDel?jumuncode="+jumuncode;
				}
			}
	}
	
	function reviewWrite(ppcode,pimg,title,su,no)
	{
		var left = Math.ceil((window.screen.width-485)/2);
		var top = Math.ceil((window.screen.height-700)/2);
	window.open("reviewWrite?ppcode="+ppcode+"&pimg="+pimg+"&title="+title+"&no="+no,"","width=485,height=700,left="+left+",top="+top);
	}
	
	function jumunQuestWrite(no)
	{
		var left = Math.ceil((window.screen.width-500)/2);
		var top = Math.ceil((window.screen.height-700)/2);
	window.open("jumunQuestWrite?no="+no,"","width=500,height=700,left="+left+",top="+top);
	}
	
	function viewList(jumuncode,n)
	{
		
		var chk = new XMLHttpRequest();
		var viewList = document.getElementsByClassName("viewList");
		var jumun = document.getElementsByClassName("jumun");
		if(viewList[n].style.display=="block")
			{
			viewList[n].style.display="none";
			jumun[n].style.display="block";
			document.getElementsByClassName("viewbtn")[n].innerText="펼쳐보기";
			}
		else
			{
			viewList[n].style.display="block";
			jumun[n].style.display="none";
			document.getElementsByClassName("viewbtn")[n].innerText="접기";
			}
		chk.onload=function()
		{
			viewList[n].innerHTML=chk.responseText;
		}
		chk.open("get","viewList?jumuncode="+jumuncode);
		chk.send();
	}
</script>
</head>
<body>
<section>
<div style="font-size:20px;font-weight:900;border-bottom:2px solid black;padding-bottom:10px;">주문확인</div>

<c:if test="${empty glist}">
<div style="padding-top:70px;padding-bottom:70px;border-bottom:1px solid black;font-size:13px;color:#888888;" align="center">주문하신 상품이 없습니다.</div>
</c:if>

<c:if test="${not empty glist}">
<c:forEach items="${glist}" var="gvo" varStatus="my"> <!-- for 시작 -->
<input type="hidden" name="jumuncode" value="${gvo.jumuncode}" >
<%-- <input type="hidden" name="isReview" value="${gvo.isReview}"> --%>
<div class="jumunList" id="jumunList" style="padding-left:20px;padding-right:20px;">
<!-- 아작스 시작 -->
<div class="jumun">

<div style="display: flex;justify-content: space-between;margin-top:10px;">
<div style="color:#929294;font-size:17px;font-weight:900;">
<c:if test="${gvo.cnt>1}"> <!-- 복수 구매 -->
총 ${gvo.cnt}건
</c:if>

<c:if test="${gvo.cnt==1 && gvo.state==12}"> <!-- 구매확정시 -->
구매확정완료
</c:if>
<c:if test="${gvo.cnt==1 && (gvo.state==0 || gvo.state==1)}"> <!-- 결제완료시 -->
결제완료
</c:if>
<c:if test="${gvo.cnt==1 && (gvo.state==2)}"> <!-- 배송중일시 -->
배송중
</c:if>
<c:if test="${gvo.cnt==1 && (gvo.state==3)}"> <!-- 배송완료 -->
배송완료
</c:if>
<c:if test="${gvo.cnt==1 && gvo.state==4}"> <!-- 취소신청시 -->
취소신청
</c:if>
<c:if test="${gvo.cnt==1 && gvo.state==5 || gvo.state==10}"> <!-- 취소완료 -->
취소완료
</c:if>
<c:if test="${gvo.cnt==1 && gvo.state==6}"> <!-- 교환신청시 -->
교환신청
</c:if>
<c:if test="${gvo.cnt==1 && gvo.state==7}"> <!-- 교환완료 -->
교환완료
</c:if>
<c:if test="${gvo.cnt==1 && gvo.state==8}"> <!-- 반품신청시 -->
반품신청
</c:if>
<c:if test="${gvo.cnt==1 && gvo.state==9}"> <!-- 반품완료 -->
반품완료
</c:if>

</div>
<div style="font-size:25px;cursor:pointer;" onclick="jlistDel('${gvo.jumuncode}',${gvo.cnt})"><img src="/static/main/close1.png"></div>
</div>

<!--  -->
<div style="display:flex;justify-content:start;margin-top:10px;">
	<div><img width="150" src="/static/product/${gvo.pimg}"></div>
	<div style="width:800px;margin-left:20px;font-size:15px;">
		<div style="font-size:14px;color:#aaaaac;">${gvo.writeday } 결제</div>
		<div style="margin-top:3px;">${gvo.title}</div>
		<div style="font-weight:900;margin-top:3px;"><fmt:formatNumber type="number" value="${gvo.cprice-3000}"/>원</div>
		<div style="margin-top:3px;color:#8f8f8f;font-size:14px;"><span style="border:1px solid #dddde1;">&nbsp옵션&nbsp</span> 색상: ${gvo.color} / 사이즈 ${gvo.size} / 수량: ${gvo.su}개</div>
		<div>
		<span style="float:left;margin-top:3px;">주문상세></span><span style="float:right;margin-right:15px;cursor:pointer;" onclick="jumunQuestWrite(${gvo.no})">제품문의 ></span>
		</div>
	</div>
</div> 
</div>

<!--  -->
		<div class="viewList" style="display:none;"></div>
		<!-- 펼쳐보기 버튼 -->
		<c:if test="${gvo.cnt>1}">
		<div>
		<button onclick="viewList('${gvo.jumuncode}',${my.index})" style="width:100%;height:35px;margin-top:20px;background:white;border:1px solid #dcdee0;border-radius:7px;box-shadow:2px 2px 3px 0px #f4f4f4"><span style="font-weight:900;">총${gvo.cnt}건</span> 주문 <span class="viewbtn">펼쳐보기</span></button>
		</div>
		</c:if>
		
		<c:if test="${gvo.cnt==1}">
		<div  align="center" style="margin-top:20px;">
		<c:if test="${gvo.state==0}"> <!-- 결제완료시 -->
		<input class="jumunbtn"  style="width:30%;margin-left:30px;height:35px;" type="button" value="취소신청" onclick="location='stateUp?no=${gvo.no}&state=4'">
		</c:if>
		<c:if test="${gvo.state==1 || gvo.state==2}"> <!-- 배송준비~중 -->
		<input class="jumunbtn"  style="width:30%;margin-left:30px;height:35px;" type="button" value="배송조회">
		<input class="jumunbtn"  style="width:30%;margin-left:30px;height:35px;" type="button" value="취소신청" onclick="location='stateUp?no=${gvo.no}&state=4'">
		</c:if>
		<c:if test="${gvo.state==4 || gvo.state==5}"> <!-- 취소신청시 -->
		<input class="jumunbtn"  style="width:30%;margin-left:30px;height:35px;" type="button" value="취소내용 확인">
		<input class="jumunbtn"  style="width:30%;margin-left:30px;height:35px;" type="button" value="재구매">
		</c:if>
		<c:if test="${gvo.state==3}"> <!-- 배송완료시 -->
		<input class="jumunbtn"  style="width:30%;height:35px;" type="button" value="구매확정" onclick="location='stateUp?no=${gvo.no}&state=12'">
		<input class="jumunbtn"  style="width:30%;margin-left:30px;height:35px;" type="button" value="반품신청" onclick="location='stateUp?no=${gvo.no}&state=8'">
		<input class="jumunbtn"  style="width:30%;margin-left:30px;height:35px;" type="button" value="교환신청" onclick="location='stateUp?no=${gvo.no}&state=6'">
		</c:if>
		<c:if test="${gvo.state==12 && gvo.isReview==0}"> <!-- 구매확정시 -->
		<input class="jumunbtn"  style="width:30%;height:35px;" type="button"type="button" value="리뷰쓰기" onclick="reviewWrite('${gvo.ppcode}','${gvo.pimg}','${gvo.title}',${gvo.su},${gvo.no})">
		<input class="jumunbtn"  style="width:30%;height:35px;" type="button"type="button" value="재구매">
		</c:if>
		<c:if test="${gvo.state==12 && gvo.isReview==1}"> <!-- 구매확정시 -->
		<input class="jumunbtn"  style="width:30%;height:35px;" type="button"type="button" value="재구매">
		</c:if>
		</div>
		</c:if>
		
		</div>
		<!-- 아작스 끝 -->
</c:forEach> <!-- for 끝 -->
</c:if>
</section>
</body>
</html>