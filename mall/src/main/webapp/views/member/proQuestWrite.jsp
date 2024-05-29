<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
margin:0;
}
section{
margin:0px;
width:100%;
height:100vh;
background:#e9ecef;
}

input[type=button]{
cursor:pointer;
}
</style>
<script>
  function proQuestWriteOk()
  {
	  var pcode = document.qform.pcode.value;
	  var qtype = document.qform.qtype.value;
	  var content = document.qform.content.value;
	  var view = document.qform.view.value;
	  
	  if(qtype.length==0)
		  {
		  alert("문의 유형을 선택해주세요.");
		  return false;
		  }
	  else if(content.length==0)
		  {
		  alert("내용을 입력해주세요.")
		  return false;
		  }
	  else
		  {
		  var chk = new XMLHttpRequest();
		  
		  chk.onload=function()
		  {
			  
		   alert("상품문의가 등록되었습니다.")
		   window.close();
		   opener.location.reload();
		   
		  }
		  chk.open("get","proQuestWriteOk?pcode="+pcode+"&qtype="+qtype+"&content="+content+"&view="+view);
		  chk.send();
		  }
	  
	  
  }
</script>
</head>
<body>
<section>
<form name="qform">
<input type="hidden" name="pcode" value="${pcode}">
<div style="display:flex;justify-content:space-between;height:60px;line-height:60px;background:white;">
		<div style="margin-left:30px;line-height:75px;"><img src="/static/main/gumaelogo.png" onclick="location='../main/main'" style="cursor:pointer;"></div><div style="font-weight:900;font-size:20px;">상품문의</div><div style="line-height:70px;margin-right:15px;cursor:pointer;" onclick="window.close()"><img src="/static/main/close.png"></div>
	</div>

<div style="display:flex;justify-content:start;
padding-top:10px;
padding-bottom:10px;border-bottom:1px solid #cfcfcf;font-size:14px;">
<div style="width:100px;padding-left:10px;white-space:nowrap;">문의상품</div>
<div><img src="/static/product/${pimg}" width="60px" height="75px"></div>
<div style="margin-left:10px;font-weight:900;">${title}
</div>
</div>



<div style="display:flex;justify-content:start;margin-top:10px;margin-left:15px;font-size:14px;">
<div style="width:100px;">문의유형</div>
<div>
	<select name="qtype"> <!-- qtype -->
	  	<option value="">문의유형 선택</option>  
	  	<option value="0">사이즈</option>  
	  	<option value="1">배송</option>  
	  	<option value="2">재입고</option>  
	  	<option value="3">기타</option>  
	 </select>
</div>
</div>

<div style="display:flex;justify-content:start;margin-top:10px;">
<div style="width:100px;height:165px;line-height:50px;padding-left:15px;font-size:14px;">내용</div>
<div style="margin-left:10px;width:100%;margin-right:10px;">
  <div style="margin-left:10px;margin-right:10px;margin-top:10px;">
    <textarea style="width:100%;height:110px;" name="content"></textarea>  <!-- content -->
  </div>
  <div style="font-size:14px;">
  &nbsp
<input type="radio" name="view" value="0" checked>비공개
<input type="radio" name="view" value="1">공개		<!-- view -->
</div>
</div>
</div>
	<div style="margin-top:20px;padding-left:15px;font-size:13px;color:#959692;">ㆍ문의하신 내용에 대한 답변은 <span style="font-weight:900;color:#626262;cursor:pointer;text-decoration-line:underline;" onclick="location='customList'">문의내역>상품문의</span>에서 확인하실 수있습니다.</div>
	<div align="center" style="margin-top:15px;">
	<input style="width:50px;height:25px;background:#8a909d;color:white;border:1px solid #656975;border-radius:3px;" type="button" value="확인" onclick="proQuestWriteOk()">
	<input style="width:50px;height:25px;background:white;border:1px solid #cbcccc;color:#565960;border-radius:3px;" type="button" value="취소" onclick="window.close()">
	</div>

</form>
</section>

</body>
</html>