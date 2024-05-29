package com.example.demo.util;

public class Util {
	
public static String getColor(String n)
{
	String color = "";
	switch(n)
	{
	case "0" : color="흰색";break;
	case "1" : color="검정";break;
	case "2" : color="네이비";break;
	case "3" : color="이미지 참조";break;
	}
	return color;
}

public static String getSize(String n)
{
	String size = "";
	switch(n)
	{
	case "0" : size="M(95)";break;
	case "1" : size="L(100)";break;
	case "2" : size="XL(105)";break;
	case "3" : size="2XL(110)";break;
	case "4" : size="3XL(115)";break;
	case "5" : size="4XL(120)";break;
	}
	return size;
}

public static String getState(int n)
{
	String state="";
	switch(n)
	{
		case 0 : state="결제완료";break;
		case 1 : state="배송준비";break;
		case 2 : state="배송중";break;
		case 3 : state="배송완료";break;
		case 4 : state="취소신청";break;
		case 5 : state="취소완료";break;
		case 6 : state="교환신청";break;
		case 7 : state="교환완료";break;
		case 8 : state="반품신청";break;
		case 9 : state="반품완료";break;
		case 10 : state="주문불가";break;
		case 11 : state="고객상담";break;
		case 12 : state="구매확정";break;
	}
	return state;
}

public static String getQtype(int n)
{
	String qtype="";
	switch(n)
	{
	case 0 : qtype="상품";break;
	case 1 : qtype="배송";break;
	case 2 : qtype="반품";break;
	case 3 : qtype="교환";break;
	case 4 : qtype="환불";break;
	case 5 : qtype="기타";break;
	}
	return qtype;
}

}

