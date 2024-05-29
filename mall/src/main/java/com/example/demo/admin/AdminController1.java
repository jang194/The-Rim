package com.example.demo.admin;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.util.Util;
import com.example.demo.vo.DaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JegoVo;
import com.example.demo.vo.JungVo;
import com.example.demo.vo.ProductVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AdminController {

	@Autowired
	private AdminMapper mapper;
	
	@RequestMapping("/admin/productAdd")
	public String productAdd(Model model)
	{
		ArrayList<DaeVo> dlist = mapper.getDae();
		model.addAttribute("dlist", dlist);
		
		return "/admin/productAdd";
	}
	
	@RequestMapping("/admin/getJung")
	public @ResponseBody String getJung(HttpServletRequest request)
	{
		String daecode = request.getParameter("daecode");
		ArrayList<JungVo> jlist = mapper.getJung(daecode);
		String jung = "<option value=''>선택</option>";
		for(int i=0;i<jlist.size();i++)
		{
			JungVo jvo = jlist.get(i);
			jung = jung+"<option value='"+jvo.getCode()+"'>"+jvo.getName()+"</option>";
		}
		return jung;
		
	}
	
	@RequestMapping("/admin/getPcode")
	public @ResponseBody String getPcode(HttpServletRequest request)
	{
		String pcode = request.getParameter("pcode");
		int val = mapper.getPcode(pcode);
		String imsi = String.format("%03d", val); //val값을 3자리수로 만들고 부족한거 0으로 채워라
		
		return imsi;
	}
	
	@RequestMapping("/admin/productAddOk")
	public String productAddOk(HttpServletRequest request) throws Exception
	{
		String path = ResourceUtils.getFile("classpath:static/product").toPath().toString();
		int sizes=1024*1024*100;
		MultipartRequest multi=new MultipartRequest(request,path,sizes,"utf-8",new DefaultFileRenamePolicy());
		
		String[] imsi = multi.getParameterValues("size");
    	String size = "";
		for(int i=0;i<imsi.length;i++)
		{
			size = size+imsi[i]+",";
		}
		//0,1,2 
		String[] imsi2 = multi.getParameterValues("color");
		String color = "";
		for(int i=0;i<imsi2.length;i++)
		{
			color = color+imsi2[i]+",";
		}
		
		
		ProductVo pvo = new ProductVo();
		pvo.setSize(size);
		pvo.setColor(color);
		pvo.setPcode(multi.getParameter("pcode"));
		pvo.setPimg(multi.getFilesystemName("pimg"));
		pvo.setCimg(multi.getFilesystemName("cimg"));
		pvo.setTitle(multi.getParameter("title"));
		//pvo.setSize(size);
		//pvo.setColor(color);
		pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
		//pvo.setSu(Integer.parseInt(multi.getParameter("su")));
		pvo.setBprice(Integer.parseInt(multi.getParameter("bprice")));
		pvo.setBtime(Integer.parseInt(multi.getParameter("btime")));
		pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
//		pvo.setPansu(Integer.parseInt(multi.getParameter("pansu")));
//		pvo.setNo(Integer.parseInt(multi.getParameter("no")));
		
		mapper.productAddOk(pvo);
		return "redirect:/admin/productList";
		
	}
	
	@RequestMapping("/admin/productList")
	public String productList(Model model,HttpServletRequest request)
	{
		int page=1;
		if(request.getParameter("page")!=null)
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		int index=(page-1)*10;
		
		int pstart = page/10;
		if(page%10==0)
		pstart--;
		
		pstart = pstart*10+1;
		int pend=pstart+9;
		
		int chong = mapper.getChong();
		
		if(pend>chong)
		pend=chong;
		
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		ArrayList<ProductVo> plist = mapper.productList(index);
		//ArrayList<JegoVo> jlist = new ArrayList<JegoVo>();
		//ProductVo pvo = new ProductVo();
			
		
		for(int i=0;i<plist.size();i++)
			{
				String pcode = plist.get(i).getPcode();
				//jlist = mapper.getPpcode(pcode);
				String ppcode = mapper.getPpcode(pcode).toString();
				//String ppcode = imsi.toString();
				//String su = mapper.getPpcode(ppcode).toString();
				//String[] ppcode = imsi.split(",");
				//pvo.setPpcode(ppcode);
				plist.get(i).setPpcode(ppcode);
				//ppcode = plist.get(i).setPpcode(ppcode);			
				}
		//model.addAttribute("pvo", pvo);
		//model.addAttribute("ppcode", ppcode);
		
		model.addAttribute("plist", plist);
		
		
		return "/admin/productList";
	}
	
	@RequestMapping("/admin/ListDel") //  admin/productList 삭제 location
	public String ListDel(HttpServletRequest request)
	{
		
		String no = request.getParameter("no");
		mapper.ListDel(no);
		return "redirect:/admin/productList";
	}
	
	@RequestMapping("/admin/ListUp")
	public String ListUp(HttpServletRequest request,Model model)
	{
		String no = request.getParameter("no");
		ProductVo pvo = mapper.ListUp(no);
		
		model.addAttribute("pvo", pvo);
		
		return "/admin/ListUp";
	}
	
	@RequestMapping("/admin/ListUpOk")
	public String ListUpOk(HttpServletRequest request) throws Exception
	{
		String path = ResourceUtils.getFile("classpath:static/product").toPath().toString();
		int sizes=1024*1024*100;
		MultipartRequest multi=new MultipartRequest(request,path,sizes,"utf-8",new DefaultFileRenamePolicy());
		

		String[] imsi = multi.getParameterValues("size");
    	String size = "";
		for(int i=0;i<imsi.length;i++)
		{
			size = size+imsi[i]+",";
		}
		//0,1,2 
		String[] imsi2 = multi.getParameterValues("color");
		String color = "";
		for(int i=0;i<imsi2.length;i++)
		{
			color = color+imsi2[i]+",";
		}
		
		
		ProductVo pvo = new ProductVo();
		pvo.setSize(size);
		pvo.setColor(color);
		//pvo.setPcode(multi.getParameter("pcode"));
		pvo.setPimg(multi.getFilesystemName("pimg"));
		pvo.setCimg(multi.getFilesystemName("cimg"));
		pvo.setTitle(multi.getParameter("title"));
		//pvo.setSize(size);
		//pvo.setColor(color);
		pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
		pvo.setSu(Integer.parseInt(multi.getParameter("su")));
		pvo.setBprice(Integer.parseInt(multi.getParameter("bprice")));
		pvo.setBtime(Integer.parseInt(multi.getParameter("btime")));
		pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
//		pvo.setPansu(Integer.parseInt(multi.getParameter("pansu")));
		pvo.setNo(Integer.parseInt(multi.getParameter("no")));   //     !!!!!!!!!!!!!!!!!!!!!!!!!!no값 그냥 request로 추가해서 없데이트 안되는거 조심
		
		
		
		mapper.ListUpOk(pvo);
		return "redirect:/admin/productList";
		
	}
	
	@RequestMapping("/admin/jego")
	public String jego(ProductVo pvo,Model model)
	{
		pvo = mapper.jego(pvo);
		model.addAttribute("pvo", pvo);
		
		
		return "/admin/jego";
	}
	
	@RequestMapping("/admin/jegoOk")
	public String jegoOk(HttpServletRequest request,JegoVo jvo) throws Exception
	{
		String path=ResourceUtils.getFile("classpath:static/product").toPath().toString();
    	int sizes=1024*1024*100;
    	MultipartRequest multi=new MultipartRequest(request,path,sizes,"utf-8",new DefaultFileRenamePolicy());
		
    
		String pcode = multi.getParameter("pcode");
		String color = multi.getParameter("color");
		String size = multi.getParameter("size");
		String ppcode = pcode+color+size;
		
		String pimg=multi.getParameter("pimg"); // null or 파일명
    	String cimg=multi.getParameter("cimg");
    	if(pimg==null)
    	{
    		pimg=multi.getParameter("pimg");
    	}
    	if(cimg==null)
    	{
    		cimg=multi.getParameter("cimg");
    	}
    	
		//jvo.setPpcode(ppcode);
		
		jvo = new JegoVo();
		jvo.setPimg(pimg);
		jvo.setCimg(cimg);
		jvo.setTitle(multi.getParameter("title"));
		jvo.setPpcode(ppcode);
		jvo.setColor(color);
		jvo.setSize(size);
		jvo.setSu(Integer.parseInt(multi.getParameter("su")));
		//pvo.setSize(size);
		jvo.setPcode(pcode);
		//pvo.setColor(color);
		//jvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		//jvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
		//jvo.setBprice(Integer.parseInt(multi.getParameter("bprice")));
		//jvo.setBtime(Integer.parseInt(multi.getParameter("btime")));
		//jvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
//		pvo.setPansu(Integer.parseInt(multi.getParameter("pansu")));
		//jvo.setNo(Integer.parseInt(multi.getParameter("no")));
		
		
		
		mapper.jegoOk(jvo);
		
		
		
		return "redirect:/admin/productList";
		
	}
	
	@RequestMapping("/admin/jegoList")
	public String jegoList(Model model)
	{
		ArrayList<JegoVo> jlist = mapper.jegoList();
		model.addAttribute("jlist", jlist);
	
		return "/admin/jegoList";
	}
	
	@RequestMapping("/admin/gumaeList")
	public String gumaeList(Model model)
	{
		ArrayList<GumaeVo> glist = mapper.gumaeList();
		String color = "";
		String size = "";
		String states = "";
		for(int i=0;i<glist.size();i++)
		{
			String ppcode = glist.get(i).getPpcode();
			int len = ppcode.length();
			color = Util.getColor(ppcode.substring(len-2,len-1));
			glist.get(i).setColor(color);
			
			size = Util.getSize(ppcode.substring(len-1,len));
			glist.get(i).setSize(size);
			
			states = Util.getState(glist.get(i).getState());
			glist.get(i).setStates(states);	
			
		}
		
		model.addAttribute("glist", glist);
		return "/admin/gumaeList";
	}
	
	@RequestMapping("/admin/stateUp")
	public String stateUp(HttpServletRequest request)
	{
		String state = request.getParameter("state");
		String no = request.getParameter("no");
		mapper.stateUp(state,no);
		
		return "redirect:/admin/gumaeList";
	}
	
	@RequestMapping("/admin/test")
	public String test()
	{
		return "/admin/test";
	}
	
	
	
	
	
	
}
