package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JegoVo;
import com.example.demo.vo.JjimVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Mapper
public interface ProductMapper {
	
	public ArrayList<ProductVo> productList(String pcode,String field,int index);
	
	public ProductVo proContent(String pcode);
	
	public MemberVo getInfo(String userid);
	
	public void baeWriteOk(BaeVo bvo);
	
	public ArrayList<BaeVo> baeList(String userid);
	
	public BaeVo getBaesong(String userid);
	
	public void SetGibon(String userid);
	
	public void proGumaeOk(GumaeVo gvo);
	
	public void proGumaeOkDel(String no);
	
	public int getNumber(String jumuncode);
	
	public ArrayList<GumaeVo> jumunView(String jumuncode);
	
	public BaeVo getBaesong2(int baeNo);
	
	public void jjimAdd(String pcode,String userid);
	
	public void jjimDel(String pcode,String userid);
	
	public boolean jjimChk(String pcode,String userid);
	//찜테이블에 찜 존재하는지
	public void addCart(String userid,String pcode,String color,String size,int su,String ppcode);
	
	public boolean isCart(String userid,String pcode);
	
	public ArrayList<ProductVo> jjimList(String userid);
	
	public JegoVo getJego(String pcode);
	
	public void addCart2(JegoVo jvo);
	
	public void jjimListDel(String no);
	
	public ArrayList<ProductVo> cartList(String userid);
	
	public void cartDel(String userid,String no);
	
	public void upCartSu(String no,String su);
	
	public ArrayList<QuestVo> getQuest(String pcode);
	
	public ArrayList<ReviewVo> getReview(String pcode);
	public int getReviewCnt(String pcode);
	public int getProQcnt(String pcode);
	public void reviewDel(String no);
	
	public QuestVo getAnswer(String ref);
	public QuestVo getQuest1(String ref);
	public double getReviewAvg(String pcode);
	public void setProStar(double avg,String pcode);
	public void plusPansu(String pcode,String su);
	public void upProHeart(String pcode);
	public void downProHeart(String pcode);
	public void chgReq(String no,String req,String greq);
	public int getChong(String pcode);
	public void chgGreq(String no,String greq);
	public void getJuk(String userid,int juk);
	public void UpJego(String ppcode,String su);
	public void minusJuk(String userid,String juk2);
	public int getRef(int ref);
	public void baeDel(String no);
}
