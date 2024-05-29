package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/member")
	public String member()
	{
		return service.member();
	}
	
	@RequestMapping("/member/memberOk")
	public String memberOk(MemberVo mvo)
	{
		return service.memberOk(mvo);
	}
	
	@RequestMapping("/member/useridChk")
	public @ResponseBody int useridChk(HttpServletRequest request)
	{
		return service.useridChk(request);
	}
	
	@RequestMapping("/member/login")
	public String login(HttpServletRequest request,Model model) 
	{
		return service.login(request,model);
	}
	
	@RequestMapping("/member/loginOk")
	public String loginOk(HttpSession session,MemberVo mvo,HttpServletRequest request)
	{
		return service.loginOk(session,mvo,request);
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}
	
	@RequestMapping("/member/jumunList")
	public String jumunList(HttpSession session,Model model)
	{
		return service.jumunList(session,model);
	}
	
	@RequestMapping("/member/jlistDel")
	public String jlistDel(HttpSession session,HttpServletRequest request)
	{
		return service.jlistDel(session,request);
	}
	
	@RequestMapping("/member/stateUp")
	public String stateUp(HttpServletRequest request)
	{
		return service.stateUp(request);
	}
	
	@RequestMapping("/member/userModify")
	public String userModify(HttpSession session,Model model)
	{
		return service.userModify(session,model);
	}
	
	@RequestMapping("/member/chgEmail")
	public @ResponseBody String chgEmail(HttpSession session,HttpServletRequest request)
	{
		return service.chgEmail(session,request);
	}
	
	@RequestMapping("/member/chgPhone")
	public @ResponseBody String chgPhone(HttpSession session,HttpServletRequest request)
	{
		return service.chgPhone(session,request);
	}
	
	@RequestMapping("member/reviewWrite")
	public String reviewWrite(HttpSession session,HttpServletRequest request,Model model)
	{
		return service.reviewWrite(session,request,model);
	}
	
	@RequestMapping("/member/reviewWriteOk")
	public String reviewWriteOk(ReviewVo rvo,HttpSession session)
	{
		return service.reviewWriteOk(rvo,session);
	}
	
	@RequestMapping("/member/jumunQuestWrite")
	public String jumunQuestWrite(HttpSession session,HttpServletRequest request,Model model)
	{
		return service.jumunQuestWrite(session,request,model);
	}
	
	@RequestMapping("/member/jumunQuestWriteOk")
	public  String jumunQuestWriteOk(QuestVo qvo,HttpSession session,HttpServletRequest request)
	{
		return service.jumunQuestWriteOk(qvo,session,request);
	}
	
	
	@RequestMapping("/member/proQuestWrite")
	public String proQuestWrite(HttpSession session,HttpServletRequest request,Model model)
	{
		return service.proQuestWrite(session,request,model);
	}
	
	@RequestMapping("member/proQuestWriteOk")
	public String proQuestWriteOk(QuestVo qvo,HttpServletRequest request,HttpSession session)
	{
		return service.proQuestWriteOk(qvo,request,session);
	}
	
	@RequestMapping("/member/reviewUpdate")
	public String reviewUpdate(HttpSession session,HttpServletRequest request,Model model)
	{
		return service.reviewUpdate(session,request,model);
	}
	
	@RequestMapping("/member/reviewUpdateOk")
	public String reviewUpdateOk(ReviewVo rvo,HttpSession session)
	{
		return service.reviewUpdateOk(rvo,session);
	}
	
	@RequestMapping("/member/proQuestDel")
	public String proQuestDel(HttpSession session,HttpServletRequest request)
	{
		return service.proQuestDel(session,request);
	}
	
	@RequestMapping("/member/proQuestUpdate")
	public String proQuestUpdate(QuestVo qvo,HttpSession session,Model model,HttpServletRequest request)
	{
		return service.proQuestUpdate(qvo,session,model,request);
	}
	
	@RequestMapping("/member/proQuestUpdateOk")
	public String proQuestUpdateOk(QuestVo qvo,HttpSession session)
	{
		return service.proQuestUpdateOk(qvo,session);
	}
	
	@RequestMapping("/member/mypage")
	public String mypage(HttpSession session,Model model,HttpServletRequest request)
	{
		return service.mypage(session,model,request);
	}
	
	@RequestMapping("/member/Gpage")
	public @ResponseBody String Gpage(HttpServletRequest request,HttpSession session)
	{
		return service.Gpage(request,session);
	}
	
	@RequestMapping("/member/MycartUp")
	public @ResponseBody String MycartUp(HttpServletRequest request)
	{
		return service.MycartUp(request);
	}
	
	@RequestMapping("/member/getAnswer")
	public @ResponseBody String getAnswer(HttpServletRequest request)
	{
		return service.getAnswer(request);
	}
	
	@RequestMapping("/member/getAnswer1")
	public @ResponseBody String getAnswer1(HttpServletRequest request)
	{
		return service.getAnswer1(request);
	}
	
	@RequestMapping("/member/viewList")
	public @ResponseBody String viewList(HttpServletRequest request)
	{
		return service.viewList(request);
	}
	
	@RequestMapping("/member/customList")
	public String customList(HttpSession session,HttpServletRequest request,Model model)
	{
		return service.customList(session,request,model);
	}
	
	@RequestMapping("/member/reviewDel")
	public String reviewDel(HttpServletRequest request)
	{
		return service.reviewDel(request);
	}
	
	@RequestMapping("/member/jumunQuestUpdate")
	public String jumunQuestUpdate(QuestVo qvo,HttpSession session,Model model,HttpServletRequest request)
	{
		return service.jumunQuestUpdate(qvo,session,model,request);
	}
	
	@RequestMapping("/member/jumunQuestUpdateOk")
	public String jumunQuestUpdateOk(QuestVo qvo)
	{
		return service.jumunQuestUpdateOk(qvo);
	}
	
	@RequestMapping("/member/jumunQuestDel")
	public String jumunQuestDel(HttpServletRequest request)
	{
		return service.jumunQuestDel(request);
	}
	
	@RequestMapping("/member/pwdChg")
	public String pwdChg(HttpServletRequest request,HttpSession session)
	{
		return service.pwdChg(request,session);
	}
	

}
