<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
	margin-top:100px;
	}
</style>
</head>
<body>
<section>
<caption><h3 align="center">재고등록</h3></caption>
<form method="post" action="jegoOk">
	<table width="800" align="center">
		<tr>
			<td>
				<input type="text" name="pcode" value="${pvo.pcode}">
				<select name="color">
					<option value="">색상</option>
					<option value="0">흰색</option>
					<option value="1">검정</option>
					<option value="2">네이비</option>
					<option value="3">그외</option>
				</select>
				<select name="size">
					<option value="">사이즈</option>
					<option value="0">95</option>
					<option value="1">100</option>
					<option value="2">105</option>
					<option value="3">110</option>
					<option value="4">115</option>
					<option value="5">120</option>
				</select>
				<input type="text" name="su">
			<input type="submit" value="재고등록">
			</td>
		</tr>
		<tr>
		</tr>
	</table>
</form>


<form>
	
</form>


</section>
</body>
</html>