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
margin:auto;
margin-top:100px;
}

section table{
border-spacing:30px;
}

section table tr td{
 	width:300px;
    height:300px;
    vertical-align:top;
    border:2px solid white;
    cursor:pointer;
}

section table tr td:hover {
        border:2px solid #e3e5e8;
        background:#fafafa;
    }
    
    .order{
    cursor:pointer;
    }

</style>
 <script>
 	window.onload=function()
 	{
 		var n = ${order};
 		switch(n)
 		{
 		case 1 : document.getElementsByClassName("order")[n-1].style.fontWeight="900";
 				 document.getElementsByClassName("order")[n-1].style.color="black";break;
 		case 2 : document.getElementsByClassName("order")[n-1].style.fontWeight="900";
 				 document.getElementsByClassName("order")[n-1].style.color="black";break;
 		case 3 : document.getElementsByClassName("order")[n-1].style.fontWeight="900";
 				 document.getElementsByClassName("order")[n-1].style.color="black";break;
 		case 4 : document.getElementsByClassName("order")[n-1].style.fontWeight="900";
 				 document.getElementsByClassName("order")[n-1].style.color="black";break;
 		case 5 : document.getElementsByClassName("order")[n-1].style.fontWeight="900";
 				 document.getElementsByClassName("order")[n-1].style.color="black";break;
 	
 		}
 	}
 </script>
</head>
<body>

<section>
<div align="center">
<div style="font-size:13px;padding-bottom:10px;color:#888888;text-align:left;width:1230px;">
<span class="order" onclick="location='productList?pcode=${pcode}&order=1'">최신등록순 &nbsp</span>|
<span class="order" onclick="location='productList?pcode=${pcode}&order=2'"> &nbsp낮은가격순 &nbsp</span>|
<span class="order" onclick="location='productList?pcode=${pcode}&order=3'">&nbsp높은가격순 &nbsp</span>|
<span class="order" onclick="location='productList?pcode=${pcode}&order=4'">&nbsp누적판매순 &nbsp</span>|
<span class="order" onclick="location='productList?pcode=${pcode}&order=5'">&nbsp평점높은순</span>
</div>
</div>
	<table width="1100" align="center">
		<tr>
		<c:forEach items="${plist}" var="pvo" varStatus="aa"><!-- 1행에 4열 생성되도록 varStatus 만들어서 사용-->
		  <td onclick="location='proContent?pcode=${pvo.pcode}'">
			<div><img src="/static/product/${pvo.pimg}" width="280" height="350"></div>
			<div>${pvo.title}</div>
			<c:if test="${pvo.halin>0}">
			<div style="font-weight:bold;" align="left"><fmt:formatNumber type="number" value="${pvo.price-(pvo.price*pvo.halin/100)}" />원
			<span style="text-decoration:line-through;font-size:15px;color:#888888"><fmt:formatNumber type="number" value="${pvo.price}" /></span>
			<span style="color:#ff0000;font-size:18px;">${pvo.halin}%</span></div>
			</c:if>
			<c:if test="${pvo.halin==0}">
			<div style="font-weight:bold;"align="left"><fmt:formatNumber type="number" value="${pvo.price}" />원</div>
			</c:if>
		  </td>
		  <c:if test="${aa.count%4==0}">
		  </tr>
		  <tr>
		  </c:if>
		  <c:if test="${aa.last}">
		  </tr>
		  </c:if>
		</c:forEach>
	</table>
	<div align="center" style="padding-bottom:50px;">
	<c:forEach begin="${pstart}" end="${pend}" var="i">
	<c:if test="${page==i}">
	<span onclick="location='productList?pcode=${pcode}&page=${i}&order=${order}'" style="cursor:pointer;border:1px solid black;display:inline-block;width:20px;text-align:center;font-weight:900;background:black;color:white;margin-right:5px;">${i}</span>
	</c:if>
	<c:if test="${page!=i}">
	<span onclick="location='productList?pcode=${pcode}&page=${i}&order=${order}'" style="cursor:pointer;border:1px solid black;display:inline-block;width:20px;text-align:center;font-weight:900;background:white;color:black;margin-right:5px;">${i}</span>
	</c:if>
	
	</c:forEach>
	</div>
	
</section>
</body>
</html>