<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{
overflow-x:hidden;
margin:0;
}

section{
width:100%;
height:100vh;
background:#e9ecef;
}


/*#modal{
position:absolute;
background-color:rgb(0,0,0,0.4);
display:none;
top:0px;
left:0ox;
width:100%;
height:100%;

}

#modal_body{
position:absolute;
background:white;
width:400px;
height:200px;
text-align:center;
top:50%;
left:50%;
transform: translateX(-50%) translateY(-50%);
}
</style>

<script>
	function jumunQuestUpdateOk()
	{
//		document.getElementById("modal").style.display="block";
//		var chk = new XMLHttpRequest();
		
		var title = document.qform.title.value;
		var content = document.qform.content.value;
		var qtype = document.qform.qtype.value;
 		var jumuncode = document.qform.jumuncode.value;
 		var pcode = document.qform.pcode.value;
//		chk.onload=function()
//		{
			
//		}
//		chk.open("get","jumunQuestWriteOk?jumuncode=${gvo.jumuncode}&pcode=${gvo.pcode}&pimg=${pimg}&title="+title+"&content="+content+"&qtype="+qtype);
			
		
		if(qtype.length==0)
			{
			alert("문의 유형을 선택해주세요.");
			return false;
			}
		else if(title.length==0)
			{
			alert("제목을 작성해주세요.")
			return false;
			}
		else if(content.length==0)
			{
			alert("내용을 입력해주세요.");
			return false;
			}
		else
			{
			location="jumunQuestUpdateOk?no=${gvo.no}&title="+title+"&content="+content+"&qtype="+qtype;
			alert("문의가 성공적으로 등록되었습니다.");
			self.close();
			opener.location.reload();
			return true;
			}
//		chk.send();
	}
	
// 	function reloadParent()
// 	{
// 		window.close();
// 		
// 	}

window.onload=function()
  	{
	  document.qform.qtype.options[${qtype}+1].selected=true;
  	}
</script>
</head>
<body>
<section>
  <form name="qform">
  	<input type="hidden" name="jumuncode" value="${gvo.jumuncode}">
  	<input type="hidden" name="no" value="${gvo.no}">
  	<input type="hidden" name="pcode" value="${gvo.pcode}">
	<div style="display:flex;justify-content:space-between;height:60px;line-height:60px;background:white;">
		<div style="margin-left:30px;line-height:75px;"><img src="/static/main/gumaelogo.png" onclick="location='../main/main'" style="cursor:pointer;"></div><div style="font-weight:900;font-size:20px;">구매상품 문의</div><div style="line-height:70px;margin-right:15px;cursor:pointer;" onclick="window.close()"><img src="/static/main/close.png"></div>
	</div>
	<div style="margin-top:15px;font-size:13px;color:#565960">
	<div style="float:left;padding-right:15px;padding-left:15px;"><img src="/static/product/${pimg}" width="130px"height="150px"></div>
	<div><span style="display:inline-block;width:70px;">주문번호</span>  ${gvo.jumuncode }</div>
	<div><span style="display:inline-block;width:70px;margin-top:10px;">상품</span>  <span style="font-weight:bold;color:black;">${protitle }</span></div>
	</div>
	
	
	<div style="display:flex;justify-content:start;margin-top:150px;padding-left:15px;font-size:13px;">
	<div>문의유형</div>
	<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	  <select name="qtype">
	  	<option value="">문의유형 선택</option>  
	  	<option value="0">상품</option>  
	  	<option value="1">배송</option>  
	  	<option value="2">반품</option>  
	  	<option value="3">교환</option>  
	  	<option value="4">환불</option>  
	  	<option value="5">기타</option>  
	  </select>
	</div>
	</div>
	
	<div style="display:flex;justify-content:start;padding-left:15px;margin-top:15px;">
	<div style="width:100px;height:70px;white-space:nowrap;line-height:45px;font-size:13px">제목</div>
	<div style="background:white;margin-left:10px;width:100%;margin-right:10px;border:1px solid #a7a8ad;">
	<div style="margin-left:5px;margin-right:10px;margin-top:6px;">
	<textarea name="title" style="width:100%;height:50px;border:none;">${gvo.title }</textarea>
	</div>
	</div>
	</div>
	
	<div style="display:flex;justify-content:start;padding-left:15px;margin-top:10px;">
	<div style="width:100px;height:80px;white-space:nowrap;line-height:45px;font-size:13px;">내용</div>
	<div style="margin-left:10px;width:100%;margin-right:10px;background:white;border:1px solid #a7a8ad;">
	<div style="margin-left:5px;margin-right:10px;margin-top:7px;">
	<textarea name="content" style="width:100%;height:60px;border:none;">${content }</textarea>
	</div>
	</div>
	</div>
	
	<div style="margin-top:20px;padding-left:15px;font-size:13px;color:#959692;">·문의하신 내용에 대한 답변은 <span style="font-weight:900;color:#626262;cursor:pointer;text-decoration-line:underline;">문의내역>1:1문의</span>에서 확인하실 수있습니다.</div>
	<div align="center" style="margin-top:15px;">
	<input style="width:50px;height:25px;background:#8a909d;color:white;border:1px solid #656975;border-radius:3px;" type="button" value="확인" onclick="jumunQuestUpdateOk()">
	<input style="width:50px;height:25px;background:white;border:1px solid #cbcccc;color:#565960;border-radius:3px;" type="button" value="취소" onclick="window.close()">
	</div>
  </form>	
</section>

<!-- <div id="modal">
	<div id="modal_body">
	<div style="font-size:20px;font-weight:900;">문의가 성공적으로 저장되었습니다.</div>
	<div><input type="button" value="확인" style="width:150px;height:40px;margin-top:80px;" onclick="reloadParent()"></div>
</div>
</div> -->
</body>
</html>