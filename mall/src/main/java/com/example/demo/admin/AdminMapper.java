package com.example.demo.admin;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.DaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JegoVo;
import com.example.demo.vo.JungVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;

@Mapper
public interface AdminMapper {
	
	public ArrayList<DaeVo> getDae();
	public ArrayList<JungVo> getJung(String daecode);
	public int getPcode(String pcode); 
	public void productAddOk(ProductVo pvo);
	public ArrayList<ProductVo> productList(int index);
	public void ListDel(String no);
	public ProductVo ListUp(String no);
	public void ListUpOk(ProductVo pvo);
	public ProductVo jego(ProductVo pvo);
	public void jegoOk(JegoVo jvo);
	public ArrayList<ProductVo> getPpcode(String pcode);
	public int getChong();
	public ArrayList<JegoVo> jegoList();
	public ArrayList<GumaeVo> gumaeList();
	public void stateUp(String state,String no);
	public ArrayList<QuestVo> getAllQuest();
	public String getTitle(String pcode);
	public void proQuestOk(QuestVo qvo);
	public QuestVo getAnswer(String ref);
	public void jegoAdd(String ppcode,String color,String size,String pimg,String cimg,String title,String pcode);
	public void jegoSet(String ppcode,String su);
	public ArrayList<MemberVo> getInfo();
	public void answerDel(String ref);
	public void answerDel2(String ref);
	public ArrayList<QuestVo> getJumunQuest();
	public QuestVo getAnswer1(String ref);
	public void jumunQuestOk(QuestVo qvo);
	public int Chkjego(String ppcode);
	public void jegoDel(String no);

}
