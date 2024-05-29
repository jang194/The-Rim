<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
margin-left:20px;
margin-top:100px;
border:1px solid blue;
background:#e9ecef;
}
</style>
</head>
<body>
<section>
	<div style="display:flex;justify-content:space-between;border:1px solid red;height:40px;line-height:40px">
		<div></div><div style="margin left">문의하기</div><div style="margin-right:100px;">X</div>
	</div>
	<div style="float:left;"><img src="/static/product/${pimg}" width="150px"height="150px"></div>
	<div>주문번호 : ${gvo.jumuncode }</div>
	<div>상품이름 : ${gvo.title}</div>
	<div style="display:flex;justify-content:start;">
	<div>상품/옵션</div>
	<div>
	<div>
		컬러: ${gvo.color} 사이즈: ${gvo.size} 수량: ${gvo.su}
	</div>
	</div>
	</div>
	
	<div style="display:flex;justify-content:start;margin-top:100px;">
	<div>문의유형</div>
	<div>
	  <select>
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
	
	<div style="display:flex;justify-content:start;border:1px solid black;">
	<div style="border:1px solid blue;width:100px;height:70px;white-space:nowrap;line-height:45px;">제목</div>
	<div style="border:1px solid green;margin-left:10px;width:100%;margin-right:10px;">
	<div style="margin-left:10px;margin-right:10px;margin-top:10px;">
	<textarea style="width:100%;height:50px;"></textarea>
	</div>
	</div>
	</div>
	
	<div style="display:flex;justify-content:start;border:1px solid black;">
	<div style="border:1px solid blue;width:100px;height:80px;white-space:nowrap;line-height:45px;">내용</div>
	<div style="border:1px solid green;margin-left:10px;width:100%;margin-right:10px;">
	<div style="margin-left:10px;margin-right:10px;margin-top:10px;">
	<textarea style="width:100%;height:60px;"></textarea>
	</div>
	</div>
	</div>
	
	<div style="margin-top:10px;">문의하신 내용에 대한 답변은 어디서 저기서 확인하실 수있습니다.</div>
	<div align="center">
	<input style="width:55px;height:30px;background:#8a909d;color:white;border:1px solid #656975;border-radius:3px;" type="button" value="확인">
	<input style="width:55px;height:30px;background:white;border:1px solid #cbcccc;color:#565960;border-radius:3px;" type="button" value="취소">
	</div>
</section>
</body>
</html>