package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ProductService;
import com.example.demo.vo.BaeVo;
import com.example.demo.vo.GumaeVo;

@Controller
@Qualifier("ps")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("/product/productList")
	public String productList(HttpServletRequest request,Model model)
	{
		return service.productList(request,model);
	}
	
	@RequestMapping("product/proContent")
	public String productContent(HttpServletRequest request,Model model,HttpSession session)
	{
		return service.proContent(request,model,session);
	}
	
	@RequestMapping("/product/proGumae")
	public String proGumae(HttpServletRequest request,HttpSession session,Model model)
	{
		return service.proGumae(request,session,model);
	}
	
	@RequestMapping("/product/baeWrite")
	public String baeWrite(HttpServletRequest request,Model model)
	{
		return service.baeWrite(request,model);
	}
	
	@RequestMapping("/product/baeWriteOk")
	public String baeWriteOk(BaeVo bvo,HttpSession session)
	{
		return service.baeWriteOk(bvo,session);
	}
	
	@RequestMapping("/product/baeList")
	public String baeList(HttpSession session,Model model,HttpServletRequest request)
	{
		return service.baeList(session,model,request);
	}
	
	@RequestMapping("/product/proGumaeOk")
	public String proGumaeOk(HttpSession session,GumaeVo gvo,HttpServletRequest request)
	{
		return service.proGumaeOk(session,gvo,request);
	}
	
	@RequestMapping("/product/jumunView")
	public String jumunView(HttpServletRequest request,Model model,HttpSession session)
	{
		return service.jumunView(request,model,session);
	}
	
	@RequestMapping("/product/addjjim")
	public @ResponseBody String jjimAdd(HttpServletRequest request,HttpSession session)
	{
		return service.jjimAdd(request,session);
	}
	
	@RequestMapping("/product/addCart")
	public @ResponseBody String addCart(HttpServletRequest request,HttpSession session)
	{
		return service.addCart(request,session);
	}
	
	@RequestMapping("/product/addCart1") //장바구니에 이미존재할떄 또 추가
	public String addCart1(HttpServletRequest request,HttpSession session)
	{
		return service.addCart1(request,session);
	}
	
	@RequestMapping("/product/addCart2") //찜목록에서 장바구니갈때(사이즈,컬러 값이 없을때)
	public @ResponseBody String addCart2(HttpSession session,HttpServletRequest request)
	{
		return service.addCart2(session,request);
	}
	
	@RequestMapping("/product/jjimList")
	public String jjimList(HttpSession session,Model model)
	{
		return service.jjimList(session,model);
	}
	
	@RequestMapping("/product/jjimListDel")
	public String jjimListDel(HttpServletRequest request)
	{
		return service.jjimListDel(request);
	}
	
	@RequestMapping("/product/cartList")
	public String cartList(HttpSession session,Model model)
	{
		return service.cartList(session,model);
	}
	
	@RequestMapping("/product/cartDel")
	public String cartDel(HttpSession session,HttpServletRequest request)
	{
		return service.cartDel(session,request);
	}
	
	@RequestMapping("/product/cartUp")
	public String upCartSu(HttpServletRequest request)
	{
		return service.upCartSu(request);
	}
	
	@RequestMapping("/product/reviewDel")
	public String reviewDel(HttpSession session,HttpServletRequest request)
	{
		return service.reviewDel(session,request);
	}
	
	@RequestMapping("/product/getAnswer")
	public @ResponseBody String getAnswer(HttpServletRequest request,HttpSession session)
	{
		return service.getAnswer(request,session);
	}
	
	@RequestMapping("/product/chgTop")
	public @ResponseBody String chgTop()
	{
		return service.chgTop();
	}
	
	@RequestMapping("product/chgReq")
	public @ResponseBody String chgReq(HttpServletRequest request)
	{
		return service.chgReq(request);
	}
	
	@RequestMapping("product/chgGreq")
	public @ResponseBody String chgGreq(HttpServletRequest request)
	{
		return service.chgGreq(request);
	}
	
	@RequestMapping("product/baeDel")
	public String baeDel(HttpServletRequest request)
	{
		return service.baeDel(request);
	}


}
