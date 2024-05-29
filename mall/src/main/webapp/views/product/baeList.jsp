<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
opener.location.reload();
function toParent(n)
{
	opener.document.getElementById("name").innerText=document.getElementsByClassName("name")[n].innerText;
	opener.document.getElementById("phone").innerText=document.getElementsByClassName("phone")[n].innerText;
	opener.document.getElementById("juso").innerText=document.getElementsByClassName("juso")[n].innerText;
	opener.document.getElementById("no").value=document.getElementsByClassName("no")[n].value;
	
	opener.document.getElementById("baeform").style.display="inline";
		
	close();
}

function baeWrite()
{
	location="/product/baeWrite?no=${no}";
}
</script>
</head>
<body>
	<h3 align="center">배송지 목록</h3>
 	  <div align="center" onclick="baeWrite()" style="border:1px solid black;height:40px;line-height:40px;cursor:pointer;box-shadow:1px 1px 2px 0px">배송지 신규입력</div>
	    <c:forEach items="${blist}" var="bvo" varStatus="num">
	    <c:if test="${no==bvo.no}">
	    <div style="border:2px solid black;margin-top:20px;">
	    </c:if>
	    <c:if test="${no!=bvo.no }">
	    <div style="margin-top:20px;">
	    </c:if>
			<input type="hidden" class="no" value="${bvo.no}">
			<div style="display:flex;justify-content:space-between;">
			<c:if test="${bvo.gibon==1}">
			<div class="name" style="font-weight:900;">${bvo.name}&nbsp&nbsp<span style="font-size:12px;border:1px solid #f3f5f7;background:#e3e5e8;color:#929294;font-weight:100;">기본배송지</span></div>
			</c:if>
			<c:if test="${bvo.gibon!=1}">
			<div class="name" style="font-weight:900;">${bvo.name}</div>
			</c:if>
			
			<div onclick="toParent(${num.index})" style="margin-top:5px;"><span style="border:1px solid black;font-size:14px;font-weight:900;background:black;color:white;display:inline-block;height:25px;line-height:25px;cursor:pointer;">&nbsp선택&nbsp</span>&nbsp</div>
			</div> <!-- flex 끝-->
			<div class="phone" style="margin-top:5px;">${bvo.phone}</div>
			<div class="juso" style="margin-top:5px;">${bvo.juso} (${bvo.jusoEtc}) ${bvo.zip}</div>
			<div style="margin-top:10px;border-bottom:1px solid #e3e5e8;padding-bottom:10px;">
			<input type="button" value="수정" style="background:white;border:1px solid #888888;height:25px;border-radius:5px;">
			<input type="button" value="삭제" style="background:white;border:1px solid #888888;height:25px;border-radius:5px;" onclick="location='baeDel?no=${bvo.no}'">
			</div>
			</div>
	    </c:forEach>

</body>
</html>