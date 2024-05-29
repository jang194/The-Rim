package com.example.demo.vo;

import lombok.Data;

@Data
public class ReviewVo {
	private int no,star;
	private String content,pcode,userid,writeday;
	
	private String ppcode; //reviewWriteOk에서 ppcode변수 생성 후 삽입
							//리뷰 읽을때 옵션(컬러,사이즈) 표시용
	
	private String color,size;
	private int color_1,size_1;
	private String pimg,title;
	private int juk;
	private String userid2;

}
