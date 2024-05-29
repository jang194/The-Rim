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
width:1250px;
margin:auto;
margin-top:100px;
}

#qcontent{
border-top:1px solid #e6e6e6;
}

#qcontent:last-child{
border-bottom:1px solid black;

}
</style>
</head>
<body>
<section>
<div><h3>구매상품 문의</h3></div>
<div style="display:flex;justify-content:space-between;height:50px;line-height:50px;border-top:2px solid black;">
<div style="width:125px;text-align:center;">상품정보</div>
<div style="width:125px;text-align:center;">문의유형</div>
<div style="width:700px;text-align:center;">내용</div>
<div style="width:130px;text-align:center;">작성일</div>
<div style="width:110px;text-align:center;">답변유무</div>
<div style="width:60px;text-align:center;">그림</div>
</div>
<c:forEach items="${qlist}" var="qvo">
<div id="qcontent">
<div style="display:flex;justify-content:space-between;height:100px;">
<div style="width:125px;text-align:center;height:100px;"><img style="margin-top:10px;" src="/static/product/${qvo.pimg}" width="65" height="80"></div>
<div style="width:125px;text-align:center;line-height:100px;">${qvo.qtype}</div>
<div style="width:700px;line-height:100px;">&nbsp&nbsp&nbsp${qvo.content}</div>
<div style="width:130px;text-align:center;line-height:100px;">${qvo.writeday_date}</div>
<div style="width:110px;text-align:center;line-height:100px;">${qvo.qa}</div>
<div style="width:60px;text-align:center;line-height:100px;">그림</div>
</div>
</div>
</c:forEach>
</section>
</body>
</html>