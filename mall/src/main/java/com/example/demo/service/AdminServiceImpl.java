package com.example.demo.service;

import java.io.FileNotFoundException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;

import com.example.demo.admin.AdminMapper;
import com.example.demo.util.Util;
import com.example.demo.vo.DaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JegoVo;
import com.example.demo.vo.JungVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper mapper;

	@Override
	public String productAdd(Model model) {
		ArrayList<DaeVo> dlist = mapper.getDae();
		model.addAttribute("dlist", dlist);
		return "/admin/productAdd";
	}

	@Override
	public String getJung(HttpServletRequest request) {
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

	@Override
	public String getPcode(HttpServletRequest request) {
		String pcode = request.getParameter("pcode");
		int val = mapper.getPcode(pcode);
		String imsi = String.format("%03d", val); //val값을 3자리수로 만들고 부족한거 0으로 채워라
		return imsi;
	}

	@Override
	public String productAddOk(HttpServletRequest request) throws Exception {
		String path = ResourceUtils.getFile("classpath:static/product").toPath().toString();
		int sizes=1024*1024*100;
		MultipartRequest multi=new MultipartRequest(request,path,sizes,"utf-8",new DefaultFileRenamePolicy());
		
		String[] imsi = multi.getParameterValues("size");
    	String size = "";
		for(int i=0;i<imsi.length;i++)
		{
			size = size+imsi[i]+",";
		}
		//System.out.println(size);
		String[] imsi2 = multi.getParameterValues("color");
		String color = "";
		for(int i=0;i<imsi2.length;i++)
		{
			color = color+imsi2[i]+",";
		}
		//System.out.println("사이즈 = "+size);
		//System.out.println("컬러 = "+color);
		
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
		
		
		String ppcode1 =pvo.getPcode();
		String pcode = pvo.getPcode();
		for(int i=0;i<imsi2.length;i++)
		{
			for(int j=0;j<imsi.length;j++)  
			{
				ppcode1 =ppcode1+imsi2[i]+imsi[j]+","+pcode;
			}
		}
		
		String[] ppcode = ppcode1.split(",");
		for(int i=0;i<ppcode.length-1;i++)
		{
			int len = ppcode[i].length();
			String color_1 = ppcode[i].substring(len-2,len-1); 
			String size_1 = ppcode[i].substring(len-1,len);
			mapper.jegoAdd(ppcode[i],color_1,size_1,pvo.getPimg(),pvo.getCimg(),pvo.getTitle(),pvo.getPcode());
		}
		return "redirect:/admin/productList";
	}
	
	@Override
	public String jegoFirst(HttpServletRequest request) {
		String pimg=request.getParameter("pimg");
		String cimg=request.getParameter("cimg");
		String title=request.getParameter("title");
		String pcode = request.getParameter("pcode");
		
		String[] imsi = request.getParameter("size").split(",");
		String size = "";
		for(int i=0;i<imsi.length;i++)
		{
			size = size+imsi[i]+",";
		}
		String[] imsi2 = request.getParameter("color").split(",");
		String color = "";
		for(int i=0;i<imsi2.length;i++)
		{
			color = color+imsi2[i]+",";
		}
		
		String ppcode1 = pcode;
		
		for(int i=0;i<imsi2.length;i++)
		{
			for(int j=0;j<imsi.length;j++)  
			{
				ppcode1 =ppcode1+imsi2[i]+imsi[j]+","+pcode; 
			}
		}
		
		String[] ppcode = ppcode1.split(",");
		for(int i=0;i<ppcode.length-1;i++)
		{
			int len = ppcode[i].length();
			String color_1 = ppcode[i].substring(len-2,len-1); 
			String size_1 = ppcode[i].substring(len-1,len);
			mapper.jegoAdd(ppcode[i],color_1,size_1,pimg,cimg,title,pcode);
		}
		return "redirect:/admin/productList";
		
	}
	
	@Override
	public String productList(Model model,HttpServletRequest request) {
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
	
	@Override
	public String ListDel(HttpServletRequest request) {
		String no = request.getParameter("no");
		mapper.ListDel(no);
		return "redirect:/admin/productList";
	}

	@Override
	public String ListUp(HttpServletRequest request, Model model) {
		String no = request.getParameter("no");
		ProductVo pvo = mapper.ListUp(no);
		
		model.addAttribute("pvo", pvo);
		
		return "/admin/ListUp";
	}

	@Override
	public String ListUpOk(HttpServletRequest request) throws Exception {
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
		
		
		String pimg=multi.getFilesystemName("pimg"); 
    	String cimg=multi.getFilesystemName("cimg");
    	if(pimg==null)
    	{
    		pimg = multi.getParameter("delpimg");
    	}
    	if(cimg==null)
    	{
    	    cimg = multi.getParameter("delcimg");
    	}
		
		ProductVo pvo = new ProductVo();
		pvo.setNo(Integer.parseInt(multi.getParameter("no")));   //     !!!!!!!!!!!!!!!!!!!!!!!!!!no값 그냥 request로 추가해서 없데이트 안되는거 조심
		pvo.setPimg(pimg);
		pvo.setCimg(cimg);
		pvo.setTitle(multi.getParameter("title"));
		pvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		pvo.setSize(size);
		pvo.setColor(color);
		pvo.setHalin(Integer.parseInt(multi.getParameter("halin")));
		pvo.setJuk(Integer.parseInt(multi.getParameter("juk")));
		pvo.setBtime(Integer.parseInt(multi.getParameter("btime")));
		pvo.setBprice(Integer.parseInt(multi.getParameter("bprice")));
		
		
		
		mapper.ListUpOk(pvo);
		return "redirect:/admin/productList";
	}

	@Override
	public String jego(ProductVo pvo, Model model) {
		pvo = mapper.jego(pvo);
		model.addAttribute("pvo", pvo);
		
		
		return "/admin/jego";
	}

	@Override
	public String jegoOk(HttpServletRequest request, JegoVo jvo) throws Exception {

		String pcode = request.getParameter("pcode");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		String ppcode = pcode+color+size;
		String pimg=request.getParameter("pimg"); // null or 파일명
    	String cimg=request.getParameter("cimg");
    	String title=request.getParameter("title");
    	String su=request.getParameter("su");
    	
    	int chk = mapper.Chkjego(ppcode);
    	if(chk==0)
    	{
    		jvo = new JegoVo();
    		jvo.setPimg(pimg);
    		jvo.setCimg(cimg);
    		jvo.setTitle(title);
    		jvo.setPpcode(ppcode);
    		jvo.setColor(color);
    		jvo.setSize(size);
    		jvo.setSu(Integer.parseInt(su));
    		jvo.setPcode(pcode);
    		
    		mapper.jegoOk(jvo);
    		return "0";
    	}
    	else
    	{
    		return "1";
    	}
		
	}

	@Override
	public String jegoList(Model model) {
		ArrayList<JegoVo> jlist = mapper.jegoList();
		model.addAttribute("jlist", jlist);
	
		return "/admin/jegoList";
	}

	@Override
	public String gumaeList(Model model) {
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

	@Override
	public String stateUp(HttpServletRequest request) {
		String state = request.getParameter("state");
		String no = request.getParameter("no");
		mapper.stateUp(state,no);
		
		return "redirect:/admin/gumaeList";
	}

	@Override
	public String proQuest(Model model) {
		ArrayList<QuestVo> qlist = mapper.getAllQuest();
		
		for(int i=0;i<qlist.size();i++)
		{
			String title = mapper.getTitle(qlist.get(i).getPcode());
			qlist.get(i).setTitle(title);
		}
		model.addAttribute("qlist", qlist);
		
		ArrayList<QuestVo> jqlist = mapper.getJumunQuest(); //1:1문의
		model.addAttribute("jqlist", jqlist);
		
		
		return "/admin/proQuest";
	}

	@Override
	public String proQuestOk(QuestVo qvo) {
		
		mapper.proQuestOk(qvo);
		return "redirect:/admin/proQuest";
	}

	@Override
	public String getAnswer(HttpServletRequest request) {
		String ref= request.getParameter("ref");
		QuestVo qvo = mapper.getAnswer(ref);
		
		String str = "<div style='display:flex;font-size:16px;border-top:1px solid #888888;padding-top:10px;justify-content:space-between;height:50px;'>";
		str = str + "<div style='width:200px;overflow:hidden;'></div>";
		str = str + "<div style='width:400px;'>└<span style='color:blue'> 답변 </span>"+qvo.getContent()+"</div>";
		str = str + "<div style='text-align:center;width:100px;'>"+qvo.getUserid()+"</div>";	
		str = str + "<div style=\"width:150px;\"></div>";
		str = str + "<div style='width:150px;text-align:center'>"+qvo.getWriteday_date()+"</div>";
		str = str + "</div>";
		str = str + "<div style='margin-left:250px;padding-bottom:20px;font-size:14px;'><span style='cursor:pointer;'><span style='cursor:pointer' onclick='answerDel("+qvo.getRef()+")'>삭제</span></div>";
		return str;
	}

	@Override
	public String main(HttpSession session) {
		
		return "/admin/main";
	}

	@Override
	public String member(HttpSession session, Model model) {
		if(session.getAttribute("userid").equals("admin"))
		{
			ArrayList<MemberVo> mlist = mapper.getInfo();
			model.addAttribute("mlist", mlist);			
			return "/admin/member";
		}
		else
		{
			return "redirect:/error/notAdmin";
		}
	}

	@Override
	public String jegoSet(HttpServletRequest request) {
		try {
		String ppcode = request.getParameter("ppcode");
		String su = request.getParameter("su");
		mapper.jegoSet(ppcode,su);
		return "0";
		}
		catch(Exception e)
		{
			return "1";
		}
		
	}

	@Override
	public String answerDel(HttpServletRequest request) {
		String ref = request.getParameter("ref");
		mapper.answerDel(ref);
		
		return "redirect:/admin/proQuest";
	}
	
	@Override
	public String answerDel2(HttpServletRequest request) {
		String ref = request.getParameter("ref");
		mapper.answerDel2(ref);
		
		return "redirect:/admin/proQuest";
	}
	
	@Override
	public String getAnswer1(HttpServletRequest request) {
		String ref = request.getParameter("ref");
		QuestVo qvo = mapper.getAnswer1(ref);
		String str = "<div style='display:flex;font-size:16px;border-top:1px solid #888888;padding-top:10px;justify-content:space-between;height:50px;'>";
		str = str + "<div style='width:200px;overflow:hidden;'></div>";
		str = str + "<div style='width:400px;'>└<span style='color:blue'> 답변 </span>"+qvo.getContent()+"</div>";
		str = str + "<div style='text-align:center;width:100px;'>"+qvo.getUserid()+"</div>";	
		str = str + "<div style=\"width:150px;\"></div>";
		str = str + "<div style='width:150px;text-align:center'>"+qvo.getWriteday_date()+"</div>";
		str = str + "</div>";
		str = str + "<div style='margin-left:250px;padding-bottom:20px;font-size:14px;'><span style='cursor:pointer;'><span style='cursor:pointer' onclick='answerDel2("+qvo.getRef()+")'>삭제</span></div>";
		return str;
		
				
		
	}

	@Override
	public String jumunQuestOk(QuestVo qvo) {
		
		mapper.jumunQuestOk(qvo);
		return "redirect:/admin/proQuest";
	}

	@Override
	public String jegoDel(HttpServletRequest request) {
		String no = request.getParameter("no");
		
		mapper.jegoDel(no);
		
		return "redirect:/admin/jegoList";
	}

	
	
	

}