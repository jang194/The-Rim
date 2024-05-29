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
width:1100px;
height:500px;
margin:auto;
margin-top:100px;
}

section div{
margin:auto;
margin-top:10px;
}

section div input[type=text]{
width:360px;
height:50px;

}
section div input[type=password]{
width:360px;
height:50px;
}
section div input[type=submit]{
width:367px;
height:50px;
}
</style>
</head>
<body>
<section>
<caption><h3 align="center">로그인</h3></caption>
	<form align="center" method="post" action="loginOk">
	  <c:if test="${pcode!=null}"> <!-- if문 안넣으면 빈칸값으로 넘어가서 redirect ==null 이 실행안됨 -->
	  <input type="hidden" name="pcode" value="${pcode}"> <!-- proContent에서 바로구매 눌렀는데 로그인 안했을떄 받는값 -->
	  <input type="hidden" name="err" value="${err}">
	  <input type="hidden" name="cart" value="${cart}">
	<!--   <input type="hidden" name="color" value="${color}">
	  <input type="hidden" name="size" value="${size}">  -->
	  </c:if>
	  
		<div><input type="text" name="userid" placeholder="아이디"></div>
		<div><input type="password" name="pwd" placeholder="비밀번호"></div>
		<c:if test="${err!=null}">
		<div style="color:red">아이디 또는 비밀번호를 확인해주세요</div>
		</c:if>
		<div><input style="background:black;color:white;font-weight:900;font-size:17px;cursor:pointer" type="submit" value="로그인"></div>
		<div><input type="button" style="background:black;color:white;font-weight:900;font-size:17px;width:367px;height:50px;text-align:center;cursor:pointer" onclick="location='member'" value="회원가입"></div>
		
	</form>
</section>
</body>
</html>