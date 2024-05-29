<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   section {
     width:1100px;
     margin:auto;
     margin-top:60px;
   }
   section table {
     border-spacing:0px;
     border-collapse:collapse;
   }
   section table tr td {
     width:140px;
     height:90px;
     border:1px solid black;
   }
   section table tr:first-child td {
     height:30px;
     text-align:center;
   }
   section table caption span {
     font-size:14px;
     cursor:pointer;
   }
 </style>
</head>
<body>
 <section>
   <table width="1000" align="center" style="margin-top:30px;">
      <caption>
        <h3> 
        <span style="display:inline-block;font-size:20px;font-weight:bold;margin-left:-420px;padding-right:280px;">월별 구매내역</span>
        <span onclick="location='gumaeCal?year=${year}&month=${month-1}'"> 이전 </span>
        ${year}년 ${month}월 
        <span onclick="location='gumaeCal?year=${year}&month=${month+1}'"> 다음 </span>
        </h3>
      </caption>
      <tr>
        <td> 일 </td>
        <td> 월 </td>
        <td> 화 </td>
        <td> 수 </td>
        <td> 목 </td>
        <td> 금 </td>
        <td> 토 </td>
      </tr>
      
    <c:set var="day" value="1"/>
    <c:forEach begin="1" end="${ju}" var="i" varStatus="my"> <!-- 몇주인가에 따라 tr이 동작할 부분 -->
      <tr>
	    <c:forEach begin="0" end="6" var="j"> <!-- 한 행을 출력 -->
	      <c:if test="${ (i==1 && j<ju)  || day>chong }">   
	       <td> </td>
	      </c:if>
	      <c:if test="${ !( (i==1 && j<ju) || day>chong ) }">   
	       <td valign="top" class="calDay"> ${day} <br>
	         <c:forEach items="${mapList}" var="map">
              <c:if test="${map.dday==day}">
              <c:if test="${map.state==4 || map.state==8}">
               <div style="font-size:12px"><span style="font-weight:bold;color:red;">${map.title}</span><span style="font-size:10px;">(${map.state2})</span> </div>
               </c:if>
              <c:if test="${map.state!=4 && map.state!=8 && map.state!=12 }">
               <div style="font-size:12px"><span style="font-weight:bold;">${map.title}</span><span style="font-size:10px;">(${map.state2})</span></div>
               </c:if>
               <c:if test="${map.state==12}">
               <div style="font-size:12px"><span style="font-weight:bold;color:blue">${map.title}</span><span style="font-size:10px;">(${map.state2})</span></div>
               </c:if>
              </c:if>
             </c:forEach>
	       </td>
	       <c:set var="day" value="${day+1}"/>
	      </c:if>
	    </c:forEach>
      </tr>
     </c:forEach>
   </table>
 </section>
 <div style="height:150px;"></div>
</body>
</html>














