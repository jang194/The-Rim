package com.example.demo.admin;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.AdminService;
import com.example.demo.util.Util;
import com.example.demo.vo.DaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JegoVo;
import com.example.demo.vo.JungVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
@Qualifier("as")
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin/productAdd")
	public String productAdd(Model model)
	{
		return service.productAdd(model);
	}
	
	@RequestMapping("/admin/getJung")
	public @ResponseBody String getJung(HttpServletRequest request)
	{
		return service.getJung(request);
	}
	
	@RequestMapping("/admin/getPcode")
	public @ResponseBody String getPcode(HttpServletRequest request)
	{
		return service.getPcode(request);
	}
	
	@RequestMapping("/admin/productAddOk")
	public String productAddOk(HttpServletRequest request) throws Exception
	{
		
		return service.productAddOk(request);
		
	}
	
	@RequestMapping("/admin/productList")
	public String productList(Model model,HttpServletRequest request)
	{
		
		return service.productList(model,request);
	}
	
	@RequestMapping("/admin/ListDel") //  admin/productList 삭제 location
	public String ListDel(HttpServletRequest request)
	{
		return service.ListDel(request);
	}
	
	@RequestMapping("/admin/ListUp")
	public String ListUp(HttpServletRequest request,Model model)
	{
		return service.ListUp(request,model);
	}
	
	@RequestMapping("/admin/ListUpOk")
	public String ListUpOk(HttpServletRequest request) throws Exception
	{
		return service.ListUpOk(request);
	}
	
	@RequestMapping("/admin/jego")
	public String jego(ProductVo pvo,Model model)
	{
		return service.jego(pvo,model);
	}
	
	@RequestMapping("/admin/jegoOk")
	public @ResponseBody  String jegoOk(HttpServletRequest request,JegoVo jvo) throws Exception
	{
		return service.jegoOk(request,jvo);
	}
	
	@RequestMapping("/admin/jegoList")
	public String jegoList(Model model)
	{
		return service.jegoList(model);
	}
	
	@RequestMapping("/admin/gumaeList")
	public String gumaeList(Model model)
	{
		return service.gumaeList(model);
	}
	
	@RequestMapping("/admin/stateUp")
	public String stateUp(HttpServletRequest request)
	{
		return service.stateUp(request);
	}
	
	@RequestMapping("/admin/test")
	public String test()
	{
		return "/admin/test";
	}
	
	@RequestMapping("/admin/proQuest")
	public String proQuest(Model model)
	{
		return service.proQuest(model);
	}
	
	@RequestMapping("/admin/proQuestOk")
	public String proQuestOk(QuestVo qvo)
	{
		return service.proQuestOk(qvo);
	}
	
	@RequestMapping("/admin/getAnswer")
	public @ResponseBody String getAnswer(HttpServletRequest request)
	{
		return service.getAnswer(request);
	}
	
	@RequestMapping("/admin/jegoFirst")
	public String jegoFirst(HttpServletRequest request)
	{
		return service.jegoFirst(request);
	}
	
	@RequestMapping("/admin/main")
	public String main(HttpSession session)
	{
		return service.main(session);
	}
	
	@RequestMapping("/admin/member")
	public String member(HttpSession session,Model model)
	{
		return service.member(session,model);
	}
	
	@RequestMapping("/admin/jegoSet")
	public @ResponseBody String jegoSet(HttpServletRequest request)
	{
		return service.jegoSet(request);
	}
	
	@RequestMapping("/admin/answerDel")
	public String answerDel(HttpServletRequest request)
	{
		return service.answerDel(request);
	}
	@RequestMapping("/admin/answerDel2")
	public String answerDel2(HttpServletRequest request)
	{
		return service.answerDel2(request);
	}
	
	@RequestMapping("/admin/getAnswer1")
	public @ResponseBody String getAnswer1(HttpServletRequest request)
	{
		return service.getAnswer1(request);
	}
	@RequestMapping("/admin/jumunQuestOk")
	public String jumunQuestOk(QuestVo qvo)
	{
		return service.jumunQuestOk(qvo);
	}
	
	@RequestMapping("/admin/jegoDel")
	public String jegoDel(HttpServletRequest request)
	{
		return service.jegoDel(request);
	}
	
	
}
