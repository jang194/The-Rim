package com.example.demo.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ProductVo {
	private int no,price,halin,su,bprice,btime,juk,pansu;
	private String pcode,pimg,cimg,title,color,size,writeday;
	
	private String ppcode; //jego에서 가져온 ppcode를 통해 admin/productList에서  색상 사이즈별 수량 확인
	 						// ppcode = pcode + color + size로 구성 ex) 0101001 + 0 + 0;

	private String color_1,size_1; //cartList에서 color size값 	
	
	private int star;
	
	private int heart;
	
	
}
