package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.JegoVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;

public interface AdminService {

	String productAdd(Model model);

	String getJung(HttpServletRequest request);

	String getPcode(HttpServletRequest request);

	String productAddOk(HttpServletRequest request) throws Exception;

	String productList(Model model,HttpServletRequest request);

	String ListDel(HttpServletRequest request);

	String ListUp(HttpServletRequest request, Model model);

	String ListUpOk(HttpServletRequest request) throws Exception;

	String jego(ProductVo pvo, Model model);

	String jegoOk(HttpServletRequest request, JegoVo jvo) throws Exception;

	String jegoList(Model model);

	String gumaeList(Model model);

	String stateUp(HttpServletRequest request);

	String proQuest(Model model);

	String proQuestOk(QuestVo qvo);

	String getAnswer(HttpServletRequest request);

	String jegoFirst(HttpServletRequest request);

	String main(HttpSession session);

	String member(HttpSession session, Model model);

	String jegoSet(HttpServletRequest request);

	String answerDel(HttpServletRequest request);

	String getAnswer1(HttpServletRequest request);

	String jumunQuestOk(QuestVo qvo);

	String answerDel2(HttpServletRequest request);

	String jegoDel(HttpServletRequest request);


}
