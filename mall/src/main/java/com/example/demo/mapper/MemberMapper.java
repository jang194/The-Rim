package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CartVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JjimVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Mapper
public interface MemberMapper {
	
	public void memberOk(MemberVo mvo);
	public int useridChk(String userid);
	public MemberVo loginOk(MemberVo mvo);
	public ArrayList<GumaeVo> jumunList(String userid);
	public int jcodeCnt(String jumuncide);
	public void jlistDel(String userid,String jumuncode);
	public void stateUp(String state,String no);
	public ArrayList<GumaeVo> jlist(String jumuncode);
	public MemberVo getInfo(String userid);
	public void chgEmail(String userid,String email);
	public void chgPhone(String userid,String phone);
	public void reviewWriteOk(ReviewVo rvo);
	public double getReviewAvg(String pcode);
	public void setProStar(double avg,String pcode);
	public void isReview(int no);
	public int chkReview(int no);
	public GumaeVo jumunQuestWrite(String no);
	public String getProTitle(String pcode);
	public String getProPimg(String pcode);
	public void jumunQuestWriteOk(QuestVo qvo);
	public void proQuestWriteOk(QuestVo qvo);
	public void reviewUpdateOk(ReviewVo rvo);
	public void proQuestDel(String ref);
	public QuestVo getproQuest(int no);
	public void proQuestUpdateOk(QuestVo qvo);
	public int getMaxRef();
	public ArrayList<GumaeVo> getGumae(String userid,int gindex);
	public ArrayList<ProductVo> getCart(String userid);
	public ArrayList<ProductVo> getJjim(String userid,int index);
	public ArrayList<QuestVo> getProQuest(String userid);
	public ArrayList<QuestVo> getJumunQuest(String userid);
	public ArrayList<ReviewVo> getReview(String userid);
	public int getGumaeChong(String userid);
	public void MycartUp(String no,String su);
	public int getPrice(String pcode);
	public QuestVo getAnswer(String ref);
	public QuestVo getQuest1(String ref);
	public int getMaxJRef();
	public QuestVo getAnswer1(String ref);
	public QuestVo getQuest2(String ref);
	public int getJjimChong(String userid);
	public ArrayList<GumaeVo> viewList(String jumuncode);
	public void reviewDel(String no);
	public MemberVo getReview1(String userid);
	public ReviewVo getReview2(String no);
	public GumaeVo getJumunQuest1(String no);
	public void jumunQuestUpdateOk(QuestVo qvo);
	public void jumunQuestDel(String ref);
	public void plusjuk(String useid);
	public void pwdChg(String userid,String pwd);
}
