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
</style>
<script>
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
	
function getAnswer1(n,ref,pimg,title,pcode,no)
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
		chk.open("get","getAnswer1?ref="+ref+"&pimg="+pimg+"&title="+title+"&pcode="+pcode+"&no="+no);
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

function jumunQuestUpdate(pimg,title,pcode,content,no,view,qtype,gno)
{
	open("../member/jumunQuestUpdate?title="+title+"&pimg="+pimg+"&pcode="+pcode+"&content="+content+"&no="+no+"&view="+view+"&qtype="+qtype+"&gno="+gno,"","width=800,height=600");
	
}

function jumunQuestDel(ref)  //no로 표시했지만 사실 ref값 질문글,답글 둘다 지우기위해
{
	var chk = new XMLHttpRequest();
	
	if(confirm("삭제하시겠습니까?"))
	{
		chk.onload=function()
		{
			alert("삭제되었습니다.");
			location.reload();
		}
		chk.open("get","../member/jumunQuestDel?ref="+ref);
		chk.send();
			
			}
}
</script>
</head>
<body>
<section>


<div style="padding:10px 0px;border-bottom:2px solid black;">
<div style="font-weight:900;font-size:20px;">상품문의</div>
</div>
<c:if test="${empty pqlist}">
	<div style="font-size:13px;color:#888888;margin-top:70px;margin-bottom:70px;text-align:center">상품문의 내역이 없습니다.</div>
	<div style="border-bottom:1px solid black;margin-top:10px;">
	</div>
	</c:if>
<div> 
	<c:if test="${not empty pqlist}">
  	<div style="width:1000px;height:35px;display:flex;justify-content:space-between;text-align:center;line-height:35px;border-bottom:1px solid #dadada;">
	  	<div style="width:100px;">상품</div>
	  	<div style="width:150px;">구분</div>
	  	<div style="width:450px;">내용</div>
	  	<div style="width:150px;">답변여부</div>
	  	<div style="width:150px;">등록일</div>
  	</div>
  	</c:if>
  	<c:forEach items="${pqlist}" var="pqvo" varStatus="my">
  	<div style="font-size:14px;border-bottom:1px solid #e3e5e8;"> <!-- Q&A전체 스타일 적용 -->
	  	<div style="width:1000px;height:100px;line-height:35px;display:flex;justify-content:space-between;text-align:center;border-bottom:1px #eaeced;line-height:100px;">
	  	<div style="width:100px;height:94px;padding-top:6px;"><img src="/static/product/${pqvo.pimg}" width="70"></div>
	  	<c:if test="${pqvo.qtype==0}">
	  	<div style="width:150px;">사이즈</div>
	  	</c:if>
	  	<c:if test="${pqvo.qtype==1}">
	  	<div style="width:150px;">배송</div>
	  	</c:if>
	  	<c:if test="${pqvo.qtype==2}">
	  	<div style="width:150px;">재입고</div>
	  	</c:if>
	  	<c:if test="${pqvo.qtype==3}">
	  	<div style="width:150px;">기타</div>
	  	</c:if>
	  	<div style="width:450px;text-align:left;overflow:hidden;height:100px;font-weight:900;">
	  	<span style="display:inline-block;vertical-align:top;cursor:pointer;" onclick="getAnswer(${my.index},${pqvo.ref},'${pqvo.pimg}','${pqvo.title}','${pqvo.pcode}')">&nbsp&nbsp&nbsp${pqvo.content}</span>
	  	<c:if test="${pqvo.view==0}">
	  	<span style="display:inline-block;margin-top:3px;width:20px;"><img src="/static/main/lock.png"></span>
	  	</c:if>
	  	</div>
	  	<c:if test="${pqvo.chk==1}">
	  	<div style="width:150px;color:#5f5f5f;">답변대기</div>
	  	</c:if>
	  	<c:if test="${pqvo.chk==2}">
	  	<div style="width:150px;font-weight:900;">답변완료</div>
	  	</c:if>
	  	<div style="width:150px;font-size:14px;">${pqvo.writeday_date}</div>
	  	</div>
	  	</div>
	  	
 	  	<div class="answer" style="display:none;"></div>
 	  	
  	</c:forEach>
  	</div>


<div style="padding-bottom:100px;"> 
<div style="font-size:20px;font-weight:900;margin-top:150px;border-bottom:2px solid black;padding-bottom:10px;">1:1문의</div>
  	<c:if test="${empty jqlist}">
	<div style="border-bottom:1px solid black;margin-top:10px;">
	<div style="font-size:13px;color:#888888;margin-top:70px;margin-bottom:70px;text-align:center">1:1 문의 내역이 없습니다.</div>
	</div>
	</c:if>
	
	<div> 
	<c:if test="${not empty jqlist}">
  	<div style="width:1000px;height:35px;display:flex;justify-content:space-between;text-align:center;line-height:35px;border-bottom:1px solid #dadada;">
	  	<div style="width:100px;">상품</div>
	  	<div style="width:150px;">구분</div>
	  	<div style="width:450px;">제목</div>
	  	<div style="width:150px;">답변여부</div>
	  	<div style="width:150px;">등록일</div>
  	</div>
  	</c:if>
  	<c:forEach items="${jqlist}" var="jqvo" varStatus="my">
  	<div style="font-size:14px;border-bottom:1px solid #e3e5e8;"> <!-- Q&A전체 스타일 적용 -->
	  	<div style="width:1000px;height:100px;line-height:35px;display:flex;justify-content:space-between;text-align:center;border-bottom:1px #eaeced;line-height:100px;">
	  	<div style="width:100px;height:94px;padding-top:6px;"><img src="/static/product/${jqvo.pimg}" width="70"></div>
	  	<c:if test="${jqvo.qtype==0}">
	  	<div style="width:150px;">상품</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==1}">
	  	<div style="width:150px;">배송</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==2}">
	  	<div style="width:150px;">반품</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==3}">
	  	<div style="width:150px;">교환</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==4}">
	  	<div style="width:150px;">환불</div>
	  	</c:if>
	  	<c:if test="${jqvo.qtype==5}">
	  	<div style="width:150px;">기타</div>
	  	</c:if>
	  	<div style="width:450px;text-align:left;overflow:hidden;height:100px;font-weight:900;">
	  	<span style="display:inline-block;vertical-align:top;cursor:pointer;" onclick="getAnswer1(${my.index},${jqvo.ref},'${jqvo.pimg}','${jqvo.title}','${jqvo.pcode}','${jqvo.no}')">&nbsp&nbsp&nbsp${jqvo.title}</span>
	  	</div>
	  	<c:if test="${jqvo.chk==1}">
	  	<div style="width:150px;color:#5f5f5f;">답변대기</div>
	  	</c:if>
	  	<c:if test="${jqvo.chk==2}">
	  	<div style="width:150px;font-weight:900;">답변완료</div>
	  	</c:if>
	  	<div style="width:150px;font-size:14px;">${jqvo.writeday_date}</div>
	  	</div>
	  	</div>
	  	
 	  	<div class="answer1" style="display:none;">
 	  		  	</div>	
 	  <!-- 
	  	<div style="width:1200px;background:#f7f8fa;padding-bottom:30px;font-size:14px;">  
	  	<div style="margin-left:280px;padding-top:20px;">
 	  	<div style="width:640px;color:#5f5f5f;">${qvo.content}</div> 
 	  	<div style="margin-top:20px;color:#a3a3a3"><span style="cursor:pointer" onclick="proQuestUpdate('${qvo.content}',${qvo.no},${qvo.view },${qvo.qtype})">수정</span> | <span style="cursor:pointer" onclick="proQuestDel(${qvo.no})">삭제</span></div> 
 	  	
 	  	<div style="display:flex;justify-content:space-between;padding-bottom:40px;"> 
 	  	<div style="margin-top:20px;padding-top:30px;border-top:1px solid #eaeced;width:500px;">└답변 안녕하세요 고객님 어쩌구 저쩌구이시고 어쩌구 입니다 감사합니다 	</div>
 	  	<div style="padding-top:20px;margin-left:90px;">운영자</div>
 	  	<div style="padding-top:20px;margin-right:55px;">2024-02-03</div>
 	  	</div>  
 	  	</div>
 	  	</div> 
 
 	  	 -->
 	  
 	  	
 	  	
 	  	
  	</c:forEach>
  	</div>
	</div>
</section>
</body>
</html>