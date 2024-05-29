<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #page2{    
   width:400; 
   visibility:hidden;
 }  
  
  section{
  width:400;
  margin-left:20px;
  margin-right:10px;
  }
  
  #name1{ 
  display:none; 
  }   
  #name2{ 
  display:none; 
  }   
  
  input[type=button]{
  cursor:pointer;
  }
  
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
  {
	  document.getElementById("title1").innerText="주소를 선택해주세요";
    new daum.Postcode({
        oncomplete: function(data) 
         {
          if (data.userSelectedType === 'R') 
          { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } 
          else 
          { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }
		  document.getElementById("page1").style.display="none";
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.pkc.zip.value = data.zonecode; // 우편번호
          document.pkc.juso.value = addr;  // 주소
          
		  document.getElementById("page2").style.visibility="visible";
          // 커서를 상세주소 필드로 이동한다.
          document.pkc.jusoEtc.focus();
      }
    }).open();
  }
  
  function viewform()
  {
	  document.getElementById("title2").innerText="정보를 입력해주세요";
	  document.getElementById("submit").style.display="table-row";
	  document.getElementById("name1").style.display="table-row";
	  document.getElementById("name2").style.display="table-row";
	  document.getElementById("btn").style.display="none";
	  document.getElementById("comment").style.display="none";
  }
 </script> 
</head>
<body>
<section>
	<form method="post" action="baeWriteOk" name="pkc">
		<div id="page1">
		<c:if test="${not empty no}">
		<input type="hidden" name="no" value="${no}">
		</c:if>
		<div style="font-size:40px;text-align:right;height:40px;line-height:20px;"><span onclick="location='baeList?no=${no}'">×</span></div>
		<div id="title1" style="font-size:20px;font-weight:900;" align="left"> 주소를 검색해주세요</div>
		<div style="display:flex;justify-content:space-between;margin-top:20px;">
		<input type="text" readonly placeholder="도로명,지번,건물명 검색" onclick="juso_search()" style="background:#f3f5f7;border:1px solid black;width:270px;">
		<input type="button" value="검색" style="margin-right:10px;background:black;color:white;font-weight:bold;border:1px solid black;width:50px;height:30px;border-radius:3px;cursor:pointer;">
		</div>
		<div style="margin-top:20px;font-weight:bold;">이렇게 검색해보세요</div>
		<div style="font-size:14px;margin-top:10px;">
		<div>ㆍ도로명＋건물번호>
		<div style="color:#aaaaa7">예) 정자일로 95,불정로 6</div>
		<div>ㆍ동/읍/면/리 ＋ 번지 </div>
		<div style="color:#aaaaa7">예)정자동 178-4,동면 만천리 1000</div>
		</div>
		</div> 
		</div>
		
		<!-- page1끝 -->
		
		
		<div id="page2" >
		<div style="font-size:40px;text-align:right;height:40px;line-height:20px;">×</div>
		<div id="title2" style="font-size:20px;font-weight:900;" align="left">상세주소를 알려주세요</div>
		<div id="name1" style="color:#767678;font-size:14px;">
		<div style="margin-top:20px;">받는이</div>
		<div><input type="text" name="name" style="border:none;border-bottom:1px solid black;outline:none;width:270px;"></div>
		</div>
		<div id="name2" style="margin-top:20px;">
		<div style="color:#767678;font-size:14px;padding-top:10px;">연락처</div>
		<input type="text" name="phone" style="border:none;border-bottom:1px solid black;outline:none;width:270px;">
		</div>
		<div style="display:flex;justify-content:space-between;margin-top:25px;">
		<div style="color:#767678;font-size:14px;">주소</div><div onclick="juso_search()"><input style="margin-right:10px;font-weight:900;background:black;color:white;border:1px solid black;border-radius:3px;height:25px;" type="button" value="주소 재검색"></div>
		</div>
		<div style="margin-top:5px;"><input style="width:200px;height:20px;" type="text" name="juso" readonly></div>
		<div style="margin-top:0px;"><input style="width:200px;height:20px;" type="text" name="zip" placeholder="우편번호"></div>
		<div style="margin-top:5px;"><input style="width:200px;height:20px;" type="text" name="jusoEtc" placeholder="상세주소를 입력해주세요"></div>
		<div id="comment" style="color:#aaaaa7;margin-top:5px;font-size:14px;">상세주소는 도로명 주소에 맞게 입력해주세요</div>
		<div style="font-size:14px;margin-top:10px;"><input type="checkbox" name="gibon" value="1">기본 배송지로 설정 </div>
		<div style="margin-top:10px;margin-right:20px;" align="center">
		<input style="width:330px;height:40px;background:black;color:white;font-weight:bold;border:1px solid black;border-radius:3px;" id="btn" type="button" value="확인" onclick="viewform()"></div>
		<div><input type="submit" value="저장하기" id="submit" style="display:none;width:330px;height:40px;background:black;color:white;font-weight:bold;border:1px solid black;border-radius:3px;"></div>
		</div><!-- page2끝 -->
	</form>
	</section>

</body>
</html>