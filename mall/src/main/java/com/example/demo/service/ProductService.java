package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.BaeVo;
import com.example.demo.vo.GumaeVo;

public interface ProductService {

 public	String productList(HttpServletRequest request, Model model);

 public	String proContent(HttpServletRequest request, Model model,HttpSession session);

 public String proGumae(HttpServletRequest request, HttpSession session, Model model);

 public String baeWrite(HttpServletRequest request,Model model);

 public String baeWriteOk(BaeVo bvo, HttpSession session);
 
 public String baeList(HttpSession session, Model model,HttpServletRequest request);

public String proGumaeOk(HttpSession session, GumaeVo gvo,HttpServletRequest request);

public String jumunView(HttpServletRequest request, Model model,HttpSession session);

public String jjimAdd(HttpServletRequest request, HttpSession session);

public String addCart(HttpServletRequest request, HttpSession session);

public String addCart1(HttpServletRequest request, HttpSession session);

public String jjimList(HttpSession session, Model model);

public String addCart2(HttpSession session, HttpServletRequest request);

public String jjimListDel(HttpServletRequest request);

public String cartList(HttpSession session,Model model);

public String cartDel(HttpSession session, HttpServletRequest request);

public String upCartSu(HttpServletRequest request);

public String reviewDel(HttpSession session, HttpServletRequest request);

public String getAnswer(HttpServletRequest request,HttpSession session);

public String chgTop();

public String chgReq(HttpServletRequest request);

public String chgGreq(HttpServletRequest request);

public String baeDel(HttpServletRequest request);


}
