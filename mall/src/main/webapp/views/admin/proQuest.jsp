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
	width:1000px;
	margin:auto;
	margin-top:100px;
	}
	
	section .aform{
	display:none;
	}
	
	#adminbtn input[type=button]{
	background:white;
	width:150px;
	height:40px;
	cursor:pointer;
	}
	
	section .aform2{
	display:none;
	}
</style>
<script>
  function viewform(n,qa,ref)
  {
	  var aform = document.getElementsByClassName("aform");
	  if(qa==0)
		  {
		  if(aform[n].style.display==='block')
			{
	  		aform[n].style.display="none";
	  		}
		  else
		   {
		  aform[n].style.display="block";
		   }
		  }
	  else
		  {
		  var answer = document.getElementsByClassName("answer");
		  if(answer[n].style.display==='block')
		  {
			 answer[n].style.display="none";
		  }
		  else
			  {
			  var chk = new  XMLHttpRequest();
				  chk.onload=function()
				  {
					  document.getElementsByClassName("answer")[n].innerHTML=chk.responseText;
					  document.getElementsByClassName("answer")[n].style.display="block"
				  }
				  chk.open("get","getAnswer?ref="+ref);
				  chk.send();
			  }
		  }
	  
  }
  
  
  function viewform2(n,qa,ref)
  {
	  var aform = document.getElementsByClassName("aform2");
	  if(qa==1)
		  {
		  if(aform[n].style.display==='block')
			{
	  		aform[n].style.display="none";
	  		}
		  else
		   {
		  aform[n].style.display="block";
		   }
		  }
	  else
		  {
		  var answer = document.getElementsByClassName("answer1");
		  if(answer[n].style.display==='block')
		  {
			 answer[n].style.display="none";
		  }
		  else
			  {
			  var chk = new  XMLHttpRequest();
				  chk.onload=function()
				  {
					  document.getElementsByClassName("answer1")[n].innerHTML=chk.responseText;
					  document.getElementsByClassName("answer1")[n].style.display="block"
				  }
				  chk.open("get","getAnswer1?ref="+ref);
				  chk.send();
			  }
		  }
	  
  }
  
  function answerDel(ref)
  {
	  confirm("답변을 삭제하시겠습니끼?")
	  {
	  location="answerDel?ref="+ref;
	  }
  }
  function answerDel2(ref)
  {
	  confirm("답변을 삭제하시겠습니까?")
	  {
	  location="answerDel2?ref="+ref;
	  }
  }
</script>
</head>
<body>
<section>
<div style="border-bottom:2px solid black">
<div id="adminbtn" style="display:flex;justify-content:space-between;margin-top:100px;width:1000px;">
<input type="button" value="회원 관리" onclick="location='member'">
<input type="button" value="구매 관리" onclick="location='gumaeList'">
<input type="button" value="상품 관리" onclick="location='productList'">
<input type="button" value="재고 관리" onclick="location='jegoList'">
<input type="button" value="문의 답변" onclick="location='proQuest'" style="background:black;color:white;font-weight:900;">
</div>
<div align="center" style="font-size:20px;font-weight:900;margin-top:100px;padding-bottom:20px;">고객 관리</div>
<div style="padding-bottom:10px;font-size:20px;font-weight:bold;">상품 문의</div>
<div align="center" style="display:flex;justify-content:start;margin-bottom:5px;border-top:2px solid black;width:1000px;padding-top:5px;font-size:15px;">
<div style="width:100px;">상품코드</div>
<div style="width:100px;">문의유형</div>
<div style="width:400px;">문의내용</div>
<div style="width:100px;">질문자</div>
<div style="width:150px;">상태</div>
<div style="width:150px;">등록일자</div>
</div>

<c:forEach items="${qlist }" var="qvo" varStatus="my">
<%-- <c:if test="${qvo.qa==0}"> <!-- 질문만 보여라 --> --%>
<div style="display:flex;justify-content:space-between;border-top:1px solid #747474;font-size:16px;cursor:pointer;" onclick="viewform(${my.index},${qvo.chk},${qvo.ref })">
<div style="width:100px;overflow:hidden;" align="center">${qvo.pcode }</div>
<div align="center">
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
	  	</div>
<div style="width:400px;">&nbsp&nbsp&nbsp${qvo.content }</div>
<div style="width:100px;" align="center">${qvo.userid }</div>
<c:if test="${qvo.chk==0}">
<div style="width:150px;color:red;font-weight:bold;" align="center">답변대기</div>
</c:if>
<c:if test="${qvo.chk!=0}">
<div style="width:150px;color:blue;font-weight:bold;" align="center">답변완료</div>
</c:if>
<div style="width:150px;" align="center">${qvo.writeday }</div>
</div>

<div class="answer" style="display:none;"></div>

<form class="aform" method="post" action="proQuestOk" name="aform">
<input type="hidden" name="userid" value="admin">
<input type="hidden" name="qtype" value="${qvo.qtype}">
<input type="hidden" name="ref" value="${qvo.ref}">
<input type="hidden" name="pcode" value="${qvo.pcode}">
<div style="display:flex;justify-content:space-between;font-size:14px;">
<div style="width:250px;overflow:hidden;"></div>
<div style="width:500px;">
<textarea style="width:400px;height:100px;" name="content"></textarea>
<input type="submit" value="답글작성" style="width:100px;margin-top:20px;">
</div>
<div style="width:100px;"></div>
<div style="width:150px;"></div>
<div style="width:150px;"></div>
</div>
</form>

<%-- </c:if> --%>
</c:forEach>
</div>

<div style="padding-bottom:10px;font-size:20px;font-weight:bold;margin-top:50px;">1:1 문의</div>
<div style="width:1000px;height:35px;display:flex;justify-content:space-between;text-align:center;line-height:35px;border-top:2px solid black;">
	  	<div style="width:100px;">주문코드</div>
	  	<div style="width:100px;">문의유형</div>
	  	<div style="width:400px;">내용</div>
	  	<div style="width:100px;">질문자</div>
	  	<div style="width:150px;">답변여부</div>
	  	<div style="width:150px;">등록일</div>
</div>
<c:forEach items="${jqlist}" var="jqvo" varStatus="my">
  	<div style="border-bottom:1px solid #e3e5e8;"> <!-- Q&A전체 스타일 적용 -->
	  	<div style="width:1000px;display:flex;justify-content:space-between;text-align:center;border-top:1px solid #747474;">
	  	<div style="width:100px;">${jqvo.jumuncode}</div>
	  	<c:if test="${jqvo.qtype==0}">
	  	<div style="width:100px;">상품</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==1}">
	  	<div style="width:100px;">배송</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==2}">
	  	<div style="width:100px;">반품</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==3}">
	  	<div style="width:100px;">교환</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==4}">
	  	<div style="width:100px;">환불</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==5}">
	  	<div style="width:100px;">기타</div>
	  	</c:if>
	  	<div style="width:400px;text-align:left;overflow:hidden;font-weight:900;">
	  	<span style="display:inline-block;vertical-align:top;cursor:pointer;" onclick="viewform2(${my.index},${jqvo.chk},${jqvo.ref })">&nbsp&nbsp&nbsp${jqvo.content}</span>
	  	</div>
	  	<div style="width:100px;" align="center">${jqvo.userid }</div>
	  	<c:if test="${jqvo.chk==1}">
	  	<div style="width:150px;color:red;font-weight:bold;">답변대기</div>
	  	</c:if>
	  	<c:if test="${jqvo.chk==2}">
	  	<div style="width:150px;font-weight:900;color:blue">답변완료</div>
	  	</c:if>
	  	<div style="width:150px;">${jqvo.writeday_date}</div>
	  	</div>
	  	</div>
 	  	<div class="answer1" style="display:none;"></div>	
 	  	
 	  	<form class="aform2" method="post" action="jumunQuestOk" name="aform2">
		<input type="hidden" name="userid" value="admin">
		<input type="hidden" name="qtype" value="${jqvo.qtype}">
		<input type="hidden" name="ref" value="${jqvo.ref}">
		<input type="hidden" name="jumuncode" value="${jqvo.jumuncode}">
		<input type="hidden" name="pcode" value="${jqvo.pcode}">
		<div style="display:flex;justify-content:space-between;font-size:14px;">
		<div style="width:250px;overflow:hidden;"></div>
		<div style="width:500px;">
		<textarea style="width:400px;height:100px;" name="content"></textarea>
		<input type="submit" value="답글작성" style="width:100px;margin-top:20px;">
		</div>
		<div style="width:100px;"></div>
		<div style="width:150px;"></div>
		<div style="width:150px;"></div>
		</div>
		</form>
  		</c:forEach>

</section>

<div style="height:200px;"></div>

</body>
</html>