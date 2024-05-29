package com.example.demo.vo;

import lombok.Data;

@Data
public class QuestVo {
	
	private int no,view,ref;
	private String qa,qtype,jumuncode,pcode,userid,content,title,writeday;

	private String userid2; //*포함된 아이디
	private String pimg;
	private String writeday_date;
	
	private int chk; //admin proquest에서 답변 있는지 체크 변수
}
