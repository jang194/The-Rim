package com.example.demo.vo;

import lombok.Data;

@Data
public class GumaeVo {
	 								//계좌이체은행	  //통신사//무통장입금은행  
	private int no,baeNo,su,cprice,juk,pay,bank,card,tong,bank2,state,gigan;
	private String pcode,userid,coupon,jumuncode,writeday,ppcode,writeday_time;
	
	private String color,size;
	
	private String pimg,title; //jumunList inner join때 저장할 변수

	private int cnt; // jumunList에서 주문별 갯수 확인위해
	
	private String states; // admin/gumaeList에서 state 문자값 받을 변수
	
	private int isReview; //jumunList에서 리뷰작성시 표시값
	
	private int halin,price;
	
	
}
