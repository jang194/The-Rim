package com.example.demo.vo;

import lombok.Data;

@Data
public class MemberVo {
	
	private int no,state;
	private String userid,name,pwd,phone,email,writeday;
	
	private int cnt,juk;

}
