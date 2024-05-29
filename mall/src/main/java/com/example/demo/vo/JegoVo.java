package com.example.demo.vo;

import lombok.Data;

@Data
public class JegoVo {
	
	private int no,su;
	private String pcode,ppcode,size,color,pimg,cimg,title;
	
	private String userid; //addCart2 // 컬러 사이즈값 없을떄 장바구니 저장할떄
	//재고 테이블에 userid컬럼이 없어서 임시로 만듬
	

}
