<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

section{
width:980px;
margin:auto;
margin-top:100px;
}
</style>
<script>
	function baeList()
	{
		open("../product/baeList","","width=400,height=400");
	}
	
	function viewId()
	{
		if(document.getElementById("idChg").style.display==='block')
			{
			document.getElementById("idChg").style.display='none';
			document.getElementById("idChgbtn").value="이메일 변경";
			document.getElementById("id").style.lineHeight="55px";
			}
		else
		{
		document.getElementById("id").style.lineHeight="110px";
		document.getElementById("idChgbtn").value="이메일 변경취소";
		document.getElementById("idChg").style.display="block";
		}
	}
	
	function viewPhone()
	{
		if(document.getElementById("phoneChg").style.display==='block')
		{
		document.getElementById("phoneChg").style.display='none';
		document.getElementById("phoneChgbtn").value="연락처 변경";
		document.getElementById("phone").style.lineHeight="55px";
		}
		else
		{
		document.getElementById("phone").style.lineHeight="110px";
		document.getElementById("phoneChgbtn").value="연락처 변경취소";
		document.getElementById("phoneChg").style.display="block";
		}
	}
	
	function chgEmail()
	{
		//var email = document.getElementById("email").value;
		//location = "chgEmail?email="+email;  //이메일 변경 성공시 알림뜨도록 제이쿼리 사용
		
		var chk = new XMLHttpRequest();
		var email = document.getElementById("email").value;
		if(confirm("이메일을 변경하시겠습니까?"))
			{
		chk.onload=function()
		{
			if(chk.responseText=="0")
				{
				alert("이메일이 성공적을 변경되었습니다.");
				location.reload();
				}
			else
				{
				alert("오류발생");
				}
		}
		chk.open("get","chgEmail?email="+email);
		chk.send();
			}
	}
	
	function chgPhone()
	{
		var chk = new XMLHttpRequest();
		var phone = document.getElementById("phone1").value;
		if(phone.length==0)
			{
			alert("연락처를 작성해주세요.")
			return false;
			}
		else
			{
		if(confirm("연락처를 변경하시겠습니까?"))
			{
		chk.onload=function()
		{
			if(chk.responseText=="0")
			{
			alert("연락처가 성공적을 변경되었습니다.");
			location.reload();
			}
		else
			{
			alert("오류발생");
			}
		}
		chk.open("get","chgPhone?phone="+phone);
		chk.send();
			}
	}
	}
	var pchk=-1;
	function pwdChk()
	{
		//alert(pwd.length);
// 		if(pwd.length)
// 			{
// 			document.getElementById("pmsg1").innerText="현재 비밀번호를 입력해주세요";
// 			document.getElementById("pmsg1").style.color="red";
			
// 			}
		pwd  = document.getElementById("pwd").value;
		pwd2 = document.getElementById("pwd2").value;
		pwd3 = document.getElementById("pwd3").value;
		if(pwd2.length>7) //비번 8자 이상 이면 작동
			{
				document.getElementById("pmsg2").innerText="사용가능한 비밀번호입니다.";
				document.getElementById("pmsg2").style.color="blue";
				if(pwd2==pwd3) //비번 일치
					{
						document.getElementById("pmsg3").innerText="비밀번호가 일치합니다.";
						document.getElementById("pmsg3").style.color="blue";
						pchk=1;
					}
				else //비번 불일치
					{
						if(pwd3.length>0)
							{
						document.getElementById("pmsg3").innerText="비밀번호가 일치하지 않습니다.";					
						document.getElementById("pmsg3").style.color="red";
						}
					}
			}
		else//7자 이하일 경우
		{
			document.getElementById("pmsg3").innerText="비밀번호는 8~16자의 영문 대/소문자,숫자,특수문자를 사용해 주세요.";
			document.getElementById("pmsg3").style.color="red";
		}
	}
	
	
	function pformChk()
	{
		pwd  = document.getElementById("pwd").value;
		if(pchk==-1) //비밀번호 이상
			{
			alert("비밀번호를 확인해주세요.");
			return false;
			}
		else if(pwd=="") //현재 비밀번호 누락시
			{
			alert("현재 비밀번호를 입력해주세요.");
			document.getElementById("pmsg1").innerText="현재 비밀번호를 입력해주세요.";
			document.getElementById("pmsg1").style.color="red";
			return false;
			}
 		else if(pwd!=${mvo.pwd}) //현재비밀번호가 일치하지 않을때
 			{
 			alert("현재 비밀번호가 일치하지 않습니다.");
 			document.getElementById("pmsg1").innerText="현재 비밀번호가 일치하지 않습니다.";
			document.getElementById("pmsg1").style.color="red";
 			return false;
 			}
		else
		{
		alert("비밀번호가 성공적으로 변경되었습니다.");
		return true;
		}
	}
	
	
	
</script>
</head>
<body>
<section>
<div style="font-weight:900;font-size:20px;padding-bottom:10px;border-bottom:2px solid black;">회원정보 수정</div>
<div style="font-size:14px;">
<div style="display:flex;justify-content:start;width:880px;"> <!-- 아이디 -->
<div id="id" style="width:140px;padding-left:20px;line-height:55px;">이메일</div>
<div>
<div style="margin-left:25px;width:650px;height:55px;line-height:55px;">${mvo.email} <input type="button" id="idChgbtn" value="이메일 변경" onclick="viewId()"></div>
<div id="idChg" style="margin-left:25px;width:650px;height:55px;line-height:55px;display:none;">
<input type="text" id="email" name="email" placeholder="${mvo.email}">&nbsp&nbsp<input type="button" value="이메일 변경" onclick="chgEmail()"></div>
</div>
</div>
<div style="display:flex;justify-content:start;height:55px;line-height:55px;border-top:1px solid #dddddd;">
	<div style="width:140px;padding-left:20px;">이름</div>
	<div style="margin-left:25px;width:650px;">${mvo.name}</div>
</div>
<div style="display:flex;justify-content:start;border-top:1px solid #dddddd;">
	<div id="phone" style="width:140px;padding-left:20px;line-height:55px;">휴대폰 번호</div> <!-- 휴대폰번호 -->
	<div>
	<div style="margin-left:25px;width:650px;height:55px;line-height:55px;">${mvo.phone}&nbsp&nbsp<input id="phoneChgbtn" type="button" value="연락처 변경" onclick="viewPhone()"></div>
	<div id="phoneChg" style="margin-left:25px;width:650px;height:55px;line-height:55px;display:none;">
	<input id="phone1" style="width:120px;" type="text" placeholder="${mvo.phone}">&nbsp&nbsp<input type="button" value="연락처 변경" onclick="chgPhone()"></div>
	</div>
</div>
<div style="display:flex;justify-content:start;height:280px;border-top:1px solid #dddddd;">
	<div style="width:140px;padding-left:20px;line-height:270px;">비밀번호 변경</div>
	<div style="margin-left:25px;width:650px;margin-top:5px;">
	<!-- pform시작 -->
		<form method="post" action="pwdChg" name="pform"  onsubmit="return pformChk()">
		<div style="height:70px;line-height:40px;"> <!-- 현재 비밀번호 --> <!-- 40>>70 -->
		<div style="float:left;width:150px;">현재 비밀번호</div>
		<div style="float:left;width:300px;height:40px;">
		<input id="pwd" style="height:25px;" type="password" name="pwd"> <!-- 현재비번 input -->
		<div id="pmsg1" style="font-size:12px;height:20px;line-height:20px;"></div>
		</div>
		</div>
		<div style="height:70px;line-height:40px;">
		<span style="float:left;display:inline-block;width:150px;">새 비밀번호</span>
		 <input style="height:25px;" type="password" name="pwd2" id="pwd2" onblur="pwdChk()"> <!-- 새비밀번호 input -->
		 <div id="pmsg2" style="font-size:12px;height:20px;line-height:20px;margin-left:150px;"></div>
		 </div>
		<div style="height:70px;line-height:40px;">
		<span style="float:left;display:inline-block;width:150px;">비밀번호 확인</span> 
		<input style="height:25px;" type="password" name="pwd3" id="pwd3"  onkeyup="pwdChk()">
		<div id="pmsg3" style="font-size:12px;border;height:20px;line-height:20px;margin-left:150px;"></div>   <!-- 확인 input -->
		</div>
		<div style="margin-left:150px;margin-top:20px;"><input style="width:150px;" type="submit" value="비밀번호 변경"></div>
		 </form>
	</div>
</div>
<div style="display:flex;justify-content:start;height:50px;line-height:50px;border-top:1px solid #dddddd;border-bottom:1px solid black;padding-bottom:10px;">
	<div style="width:140px;padding-left:20px;">배송지</div>
	<div style="margin-left:25px;">배송지 주소 관리는 <a href="javascript:baeList()">[배송지 관리]</a>에서 수정,등록 해주세요.</div>
</div>
</div>
<div align="center" style="margin-top:20px;" onclick="location='../main/main'"><input type="button" value="메인으로"></div>

<div style="height:300px;"></div>

</section>
</body>
</html>