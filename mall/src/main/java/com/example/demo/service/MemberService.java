package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.MemberVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

public interface MemberService {

	public String member();

	public String memberOk(MemberVo mvo);

	public int useridChk(HttpServletRequest request);

	public String login(HttpServletRequest request,Model model);

	public String loginOk(HttpSession session,MemberVo mvo,HttpServletRequest request);

	public String logout(HttpSession session);

	public String jumunList(HttpSession session, Model model);

	public String jlistDel(HttpSession session, HttpServletRequest request);

	public String stateUp(HttpServletRequest request);

	public String userModify(HttpSession session,Model model);

	public String chgEmail(HttpSession session,HttpServletRequest request);

	public String chgPhone(HttpSession session, HttpServletRequest request);

	public String reviewWrite(HttpSession session, HttpServletRequest request,Model model);

	public String reviewWriteOk(ReviewVo rvo, HttpSession session);

	public String jumunQuestWrite(HttpSession session, HttpServletRequest request, Model model);

	public String jumunQuestWriteOk(QuestVo qvo, HttpSession session,HttpServletRequest request);

	public String proQuestWrite(HttpSession session, HttpServletRequest request, Model model);

	public String proQuestWriteOk(QuestVo qvo,HttpServletRequest request, HttpSession session);

	public String reviewUpdate(HttpSession session, HttpServletRequest request, Model model);

	public String reviewUpdateOk(ReviewVo rvo, HttpSession session);

	public String proQuestDel(HttpSession session, HttpServletRequest request);

	public String proQuestUpdate(QuestVo qvo, HttpSession session,Model model,HttpServletRequest request);

	public String proQuestUpdateOk(QuestVo qvo, HttpSession session);

	public String mypage(HttpSession session,Model model,HttpServletRequest request);

	public String Gpage(HttpServletRequest request, HttpSession session);

	public String MycartUp(HttpServletRequest request);

	public String getAnswer(HttpServletRequest request);

	public String getAnswer1(HttpServletRequest request);

	public String viewList(HttpServletRequest request);

	public String customList(HttpSession session, HttpServletRequest request, Model model);

	public String reviewDel(HttpServletRequest request);

	public String jumunQuestUpdate(QuestVo qvo, HttpSession session, Model model, HttpServletRequest request);

	public String jumunQuestUpdateOk(QuestVo qvo);

	public String jumunQuestDel(HttpServletRequest request);

	public String pwdChg(HttpServletRequest request,HttpSession session);
}
