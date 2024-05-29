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
width:1400px;
margin:auto;
margin-top:100px;
border:1px solid balck;
}

#adminbtn input[type=button]{
background:white;
width:150px;
height:40px;
cursor:pointer;
}
</style>
</head>
<body>
<div id="adminbtn" style="display:flex;justify-content:space-between;margin:auto;margin-top:100px;width:1000px;">
<input type="button" value="회원 관리" onclick="location='member'">
<input type="button" value="구매 관리" onclick="location='gumaeList'" style="background:black;color:white;font-weight:900;">
<input type="button" value="상품 관리" onclick="location='productList'">
<input type="button" value="재고 관리" onclick="location='jegoList'">
<input type="button" value="문의 답변" onclick="location='proQuest'">
</div>
<section>
<div style="border-bottom:2px solid black">
	<div align="center" style="font-size:20px;font-weight:900;margin-top:50px;padding-bottom:20px;">구매 관리</div>
		<div align="center" style="margin-bottom:10px;border-top:2px solid black;width:1400px;padding-top:10px;">
		<span style="display:inline-block;width:100px;">주문번호</span>
		<span style="display:inline-block;width:100px;">구매자</span>
		<span style="display:inline-block;width:100px;text-align:right">구매금액</span>
		<span style="display:inline-block;width:350px;margin-left:30px;">구매상품</span>
		<span style="display:inline-block;width:100px;">구매수량</span>
		<span style="display:inline-block;width:100px;">결제방법</span>
		<span style="display:inline-block;width:200px;">주문일</span>
		<span style="display:inline-block;width:100px;">상태</span>
		<span style="display:inline-block;width:150px;">변경</span>
		</div>
		<c:forEach items="${glist}" var="gvo">
		<div align="center" style="padding-top:5px;margin-bottom:5px;border-top:1px solid #747474;">
		<span style="display:inline-block;width:100px;">${gvo.jumuncode }</span>
		<span style="display:inline-block;width:100px;">${gvo.userid}</span>
		<span style="display:inline-block;width:100px;text-align:right;">${gvo.cprice}원</span>
		<span style="display:inline-block;width:350px;text-align:left;margin-left:30px;">${gvo.ppcode} / ${gvo.color} / ${gvo.size}</span>
		<span style="display:inline-block;width:100px;">${gvo.su}</span>
		<span style="display:inline-block;width:100px;">
		<c:if test="${gvo.pay==0}">
		계좌이체
		</c:if>
		<c:if test="${gvo.pay==1}">
		카드결제
		</c:if>
		<c:if test="${gvo.pay==2}">
		휴대폰
		</c:if>
		<c:if test="${gvo.pay==3}">
		무통장입금
		</c:if>
		</span>
		<span style="display:inline-block;width:200px;">${gvo.writeday }</span>
		<span style="display:inline-block;width:100px;">${gvo.states}</span>
		<span style="display:inline-block;width:150px;">
		<c:if test="${gvo.state==0}"> <!-- 구매자가 결제했을 때 -->
		<input type="button" value="배송준비" onclick="location='stateUp?no=${gvo.no}&state=1'">
		<input type="button" value="주문불가" onclick="location='stateUp?no=${gvo.no}&state=10'">
		</c:if>
		<c:if test="${gvo.state==1}"> <!-- 배송준비 클릭시 -->
		<input type="button" value="배송중" onclick="location='stateUp?no=${gvo.no}&state=2'">
		<input type="button" value="주문불가" onclick="location='stateUp?no=${gvo.no}&state=10'">
		</c:if>
		<c:if test="${gvo.state==2 }"> <!-- 배송중 클릭시 -->
		<input type="button" value="배송완료" onclick="location='stateUp?no=${gvo.no}&state=3'">
		</c:if>
		<c:if test="${gvo.state==4 }"> <!-- 구매자가 취소신청 했을 때 -->
		<input type="button" value="취소완료" onclick="location='stateUp?no=${gvo.no}&state=5'">
		</c:if>
		<c:if test="${gvo.state==6 }"> <!-- 교구매자가 교환신청 했을 때 -->
		<input type="button" value="교환완료" onclick="location='stateUp?no=${gvo.no}&state=7'">
		</c:if>
		<c:if test="${gvo.state==8 }"> <!-- 구매자가 반품신청 했을 때 -->
		<input type="button" value="반품완료" onclick="location='stateUp?no=${gvo.no}&state=9'">
		</c:if>
		<c:if test="${gvo.state==10}"> <!--  주문불가 클릭 -->
		<input type="button" value="고객상담" onclick="location='stateUp?no=${gvo.no}&state=11'">
		</c:if>
		<c:if test="${gvo.state==11}"> <!--  고객상담 클릭 -->
		<span>처리완료</span>
		</c:if>
		<c:if test="${gvo.state==12}"> <!-- 고객이 구매확정 클릭 -->
		<span>구매확정</span>
		</c:if>
		
		</span>
		</div>
		</c:forEach>
		</div>
		<div style="height:200px;"></div>
</section>

</body>
</html>