<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
width:460px;
height:800px;
margin:auto;
margin-top:100px;
}

section form div{
width:460px;
text-align:center;
height:50px;

}


section #umsg{
 font-size:12px;
}

section #pmsg{
font-size:12px;
}
</style>
<script>
	var uchk=0; //사용불가능할떄 0
	function useridChk(userid)
	{
		
		if(userid.length>4)
			{
		var chk =new XMLHttpRequest();
		chk.onload=function()
		{
			if(chk.responseText==0)//중복 count0
				{
				   document.getElementById("umsg").innerText="사용 가능한 아이디입니다.";
				   document.getElementById("umsg").style.color="blue";
				   uchk=1;
				}
			else //중복 count1
				{
				   document.getElementById("umsg").innerText="중복된 아이디입니다. 다른 아이디를 입력해 주세요.";
				   document.getElementById("umsg").style.color="red";
				}
		}
		chk.open("get","useridChk?userid="+userid);
		chk.send();
			}//userid>4
			else
				{
				   document.getElementById("umsg").innerText="아이디는 5~20자의 영문 소문자,숫자,특수문자만 사용 가능합니다.";
				   document.getElementById("umsg").style.color="red";
				   
				}
	}//useridChk
		
	
	var pchk=0;//사용 불가능할때
	function pwdChk()
	{
		pwd = document.mform.pwd.value;
		pwd2 = document.mform.pwd2.value;	
	if(pwd.length>7)
		{
			if(pwd2.length>0)
				{
				if(pwd==pwd2)
					{
						document.getElementById("pmsg").innerText="비밀번호가 일치합니다.";
						document.getElementById("pmsg").style.color="blue";
						pchk=1;
					}
				else
					{
						document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다.";
						document.getElementById("pmsg").style.color="red";
						pchk=0;
					}
				}//pwd2>0
		}
	else
		{
		document.getElementById("pmsg").innerText="비밀번호는 8~16자의 영문 대/소문자,숫자,특수문자를 사용해 주세요.";
		document.getElementById("pmsg").style.color="red";
		pchk=0;
		}
	}
	
	function formChk(my)
	{
		if(uchk==0)
			{
			 alert("아이디를 확인해주세요.")
			 my.userid.focus();
			 return false;
			}
		else if(pchk==0)
			{
			 alert("비밀번호를 확인해주세요.")
			 my.pwd.focus();
			 return false;
			}
		else if(my.name.value.length==0)
			{
			alert("이름을 입력해주세요.")
			my.name.focus();
			return false;
			}
		else if(my.phone.value.length==0)
			{
			alert("전화번호를 입력해주세요.")
			my.phone.focus();
			return false;
			}
		else
			{
			return true;			
			}
	}
</script>
</head>
<body>
<section>
<form method="post" action="memberOk" name="mform" onsubmit="return formChk(this)">
  <div style="border:none;"><h3>회원가입</h3></div>
	<div style="border:none;"><input style="border:1px solid #c6c6c6;width:455px;height:48px;" type="text" name="userid" placeholder="아이디" onblur="useridChk(this.value)"></div>
	<div  style="height:20px;line-height:20px;margin-top:10px;margin-bottom:10px;" id="umsg"></div>
	<div style="border:none;"><input style="border:1px solid #c6c6c6;width:455px;height:48px;"type="password" name="pwd" placeholder="비밀번호" onblur="pwdChk()"></div>
	<div style="border:none;"><input style="border:1px solid #c6c6c6;border-top:none;width:455px;height:48px;margin-top:2px;" type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwdChk()">
	</div>
	<div  style="height:20px;line-height:20px;margin-top:10px;margin-bottom:10px;" id="pmsg"></div>
	
	<div style="border:none;"><input style="border:1px solid #c6c6c6;width:455px;height:48px;" type="text" name="email" placeholder="[선택]이메일주소(비밀번호 찾기 등 본인 확인용)"></div>
	
	<div style="border:none;"><input style="border:1px solid #c6c6c6;width:455px;height:48px;border-top:none;margin-top:2px;" type="text" name="name" placeholder="이름"></div>
	<div style="border:none;"><input style="border:1px solid #c6c6c6;width:455px;height:48px;border-top:none;margin-top:3px;" type="text" name="phone" placeholder="휴대폰 번호"></div>
	
	<div style="border:none;margin-top:50px;"><input style="border:1px solid black;width:460px;height:50px;background:black;color:white;font-size:20px;font-weight:900;border-radius:6px;cursor:pointer;" type="submit" value="가입하기"></div>
</form>
</section>
</body>
</html>