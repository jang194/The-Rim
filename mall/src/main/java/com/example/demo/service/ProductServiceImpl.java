package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.demo.mapper.ProductMapper;
import com.example.demo.util.Util;
import com.example.demo.vo.BaeVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JegoVo;
import com.example.demo.vo.JjimVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper mapper;

	@Override
	public String productList(HttpServletRequest request, Model model) {
		String pcode = request.getParameter("pcode");
		int order = 1;
		if(request.getParameter("order")!=null)
		{
			order = Integer.parseInt(request.getParameter("order"));
		}
		String field="";
		switch(order)
		{
		case 1 : field="no desc";break; 
		case 2 : field="price asc";break; 
		case 3 : field="price desc";break; 
		case 4 : field="pansu desc";break; 
		case 5 : field="star desc";break; 
		}
		
		model.addAttribute("order", order);
		
		int page=1;
		if(request.getParameter("page")!=null)
		{
			page = Integer.parseInt(request.getParameter("page"));
		}
		int pstart = page/10;
		if(page%10==0)
			pstart--;
		pstart = (pstart*10)+1;
		int index = (page-1)*20;
		int pend = pstart+9;
		int chong = mapper.getChong(pcode);
		if(pend>chong)
			pend=chong;
		model.addAttribute("page", page);		
		model.addAttribute("pstart", pstart);		
		model.addAttribute("pend", pend);		
		model.addAttribute("chong", chong);		
		
		
		ArrayList<ProductVo> plist = mapper.productList(pcode,field,index);
		model.addAttribute("pcode",pcode);
		model.addAttribute("plist", plist);
		
		return "/product/productList";
	}

	@Override
	public String proContent(HttpServletRequest request, Model model,HttpSession session) {
		String pcode= request.getParameter("pcode");
		ProductVo pvo = mapper.proContent(pcode);
		
		ArrayList<QuestVo> qlist = mapper.getQuest(pcode);
		for(int i=0;i<qlist.size();i++)
		{
			String userid = qlist.get(i).getUserid();
			double imsi = (double)(userid.length());
			int len = (int)Math.floor(imsi/2.0);			
			int len1 = (int)Math.ceil(imsi/2.0);			
			
			int imsi2 = qlist.get(i).getRef();
		    int ref = mapper.getRef(imsi2);
			
			qlist.get(i).setRef(ref);
			
			
			userid = userid.substring(0,len);	
			for(int j=0;j<len1;j++)
			{
				userid = userid+"*";
			}
			qlist.get(i).setUserid2(userid);		
		}
		model.addAttribute("qlist", qlist);
		
		ArrayList<ReviewVo> rlist = mapper.getReview(pcode);
		for(int i=0;i<rlist.size();i++)
		{
			String userid2 = rlist.get(i).getUserid();
			double imsi = (double)(userid2.length());
			int len = (int)Math.floor(imsi/2.0);			
			int len1 = (int)Math.ceil(imsi/2.0);			
			
			userid2 = userid2.substring(0,len);	
			for(int j=0;j<len1;j++)
			{
				userid2 = userid2+"*";
			}
			rlist.get(i).setUserid2(userid2);	
			
			String color = Util.getColor(rlist.get(i).getColor());
			String size = Util.getSize(rlist.get(i).getSize());
			int color_1 = Integer.parseInt(rlist.get(i).getColor());
			int size_1 = Integer.parseInt(rlist.get(i).getSize());
			
			
			rlist.get(i).setColor(color);
			rlist.get(i).setSize(size);
			rlist.get(i).setColor_1(color_1);
			rlist.get(i).setSize_1(size_1);
			
		}
		model.addAttribute("rlist", rlist);
		
		int cnt = mapper.getReviewCnt(pcode);
		model.addAttribute("cnt", cnt);
		
		int qcnt = mapper.getProQcnt(pcode);
		model.addAttribute("qcnt", qcnt);
		
		
		
		if(session.getAttribute("userid")!=null)  /* 아이디 로그인 했을때 */
		{
			String userid = session.getAttribute("userid").toString(); //if문 밖에 있으면 request userid값이 없어서 오류뜸
			if(mapper.jjimChk(pcode,userid))
			{
				model.addAttribute("img", "onheart.png");
			}
			else
			{
				model.addAttribute("img", "offheart.png");
			}
			
			if(mapper.isCart(userid, pcode))
			{
				model.addAttribute("cartimg", "cart.png");
				model.addAttribute("color", "#e52528");	
				}
			else
			{
				model.addAttribute("cartimg", "cart2.png");
				model.addAttribute("color", "black");	
			}
			
			
		} //로그인 성공 끝
		
		else  //로그인 안했을시 빈하트 표시 
		{
			model.addAttribute("img", "offheart.png");
			model.addAttribute("cartimg", "cart2.png");
			
		}
			
		
		

		//String[] color = pvo.getColor().split(",");
		//model.addAttribute("color", color);		
		
		
		model.addAttribute("pvo", pvo);
		return "/product/proContent";
	}

	@Override
	public String proGumae(HttpServletRequest request, HttpSession session, Model model) {
		String pcodes = request.getParameter("pcodes");		String sus = request.getParameter("sus");
		String sizes = request.getParameter("sizes");
		String colors = request.getParameter("colors");
		String nos = request.getParameter("nos"); //장바구니에서 구매시 장바구니의 기존 목록 삭제위해서 변수 nos값 cartList에서 가져옴 
		//ProductVo pvo = new ProductVo();
		
		if(session.getAttribute("userid")==null)
		{
			int index = pcodes.indexOf(",");
			if(index>0)
			{
				return "redirect:/main/main";
			}
				
			return "redirect:/member/login?pcode="+pcodes+"&su="+sus;
		}
		else
		{
			String userid = session.getAttribute("userid").toString();
//			ProductVo pvo = mapper.proContent(pcodes);
//			pvo.setSu(Integer.parseInt(sus)); //    
//			pvo.setSize(sizes); //   su size color 값은 따로 가져와야됨
//			pvo.setColor(colors); //
			
			String[] pcode = pcodes.split(",");
			String[] su = sus.split(",");
			String[] color = request.getParameter("colors").split(",");
			String[] size = request.getParameter("sizes").split(",");		
			String[] no = request.getParameter("nos").split(",");		
			int price=0;
			int bprice=0;
			int juk=0;
			int halin=0;
		    int cprice = 0;

			ArrayList<ProductVo> plist = new ArrayList<ProductVo>();
			
			for(int i=0;i<pcode.length;i++)
			{
				ProductVo pvo = mapper.proContent(pcode[i]);
				pvo.setColor(color[i]);
				pvo.setSize(size[i]);
				pvo.setSu(Integer.parseInt(su[i]));
				pvo.setColor(color[i]);
				pvo.setNo(Integer.parseInt(no[i]));
				
				cprice = cprice + pvo.getPrice()*pvo.getSu();
				price = price+(pvo.getPrice()-(int)(pvo.getPrice()*pvo.getHalin()/100.0))*pvo.getSu();
				
				bprice = pvo.getBprice();
				
				halin = halin + (int)(pvo.getPrice()*pvo.getHalin()/100.0);
				
				juk = juk + (int)((pvo.getPrice()-(int)(pvo.getPrice()*pvo.getHalin()/100.0))*pvo.getJuk()/100.0);
				plist.add(pvo);
			}
			
			
			
		
			
				//cprice값 계산후 set
//			int price=0;
//			price = price+(pvo.getPrice()-(int)(pvo.getPrice()*(pvo.getHalin()/100.0) ))*pvo.getSu(); 
//			
//			model.addAttribute("price", price);			
//			model.addAttribute("pcodes", pcodes);
//			model.addAttribute("sus", sus);
			
			
			model.addAttribute("plist", plist);
			model.addAttribute("cnt", plist.size());
			//model.addAttribute("pvo", pvo);
			model.addAttribute("cprice", cprice);
			model.addAttribute("price", price);
			model.addAttribute("bprice", bprice);
			model.addAttribute("juk", juk);
			model.addAttribute("halin", halin);
			
			
			MemberVo mvo = mapper.getInfo(userid); //구매자/주문자 정보
			model.addAttribute("mvo", mvo);
			
			BaeVo bvo = mapper.getBaesong(userid);
			model.addAttribute("bvo", bvo);
			
			model.addAttribute("pcodes", pcodes);		
			model.addAttribute("colors", colors);		
			model.addAttribute("sizes", sizes);		
			model.addAttribute("sus", sus);		
			model.addAttribute("nos", nos);		
			
			return "/product/proGumae";
		}
	}
	
	
	/*@Override
	public String proGumae(HttpServletRequest request, HttpSession session, Model model) {
		String pcode = request.getParameter("pcode");
		int su = Integer.parseInt(request.getParameter("su"));
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		//ProductVo pvo = new ProductVo();
		
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/member/login?pcode="+pcode+"&su="+su;
		}
		else
		{
			String userid = session.getAttribute("userid").toString();
		
			ProductVo pvo = mapper.proContent(pcode);
			pvo.setSu(su); //    
			pvo.setSize(size); //   su size color 값은 따로 가져와야됨
			pvo.setColor(color); //
			
			//cprice값 계산후 set
		
			
//			int price=0;
//			price = price+(pvo.getPrice()-(int)(pvo.getPrice()*(pvo.getHalin()/100.0) ))*pvo.getSu(); 
//			
//			model.addAttribute("price", price);			
			
			
			
			model.addAttribute("pvo", pvo);
			
			MemberVo mvo = mapper.getInfo(userid); //구매자/주문자 정보
			model.addAttribute("mvo", mvo);
			
			BaeVo bvo = mapper.getBaesong(userid);
			model.addAttribute("bvo", bvo);
			
			
			return "/product/proGumae";
		}
	}
	*/

	@Override
	public String baeWrite(HttpServletRequest request,Model model) {
		if(request.getParameter("no")!=null)
		{
		String no = request.getParameter("no");		
		model.addAttribute("no", no);
		
		return "/product/baeWrite";
		}
		else
		{
			return "/product/baeWrite";
		}
	}

	@Override
	public String baeWriteOk(BaeVo bvo, HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		bvo.setUserid(userid);
		
		if(bvo.getGibon()==1)
		{
			//기본값 1이 들어올때 default 0 이었던 기본값 업데이트 && 1이었던 기본값 업데이트 mapper실행
			mapper.SetGibon(userid);
		}
			
		
		
		
		mapper.baeWriteOk(bvo);
		return "redirect:/product/baeList";
	}
	
	@Override
	public String baeList(HttpSession session, Model model,HttpServletRequest request) {
		String userid = session.getAttribute("userid").toString();
		String no = request.getParameter("no");
		ArrayList<BaeVo> blist = mapper.baeList(userid);
		for(int i=0;i<blist.size();i++)
		{
			String phone = blist.get(i).getPhone();
			phone = phone.substring(0, 3)+"-"+phone.substring(3,7)+"-"+phone.substring(7,11);
			blist.get(i).setPhone(phone);
		}
		
		
		model.addAttribute("blist", blist);
		model.addAttribute("no", no);
		return "/product/baeList";
	}

/*	@Override
	public String proGumaeOk(HttpSession session, GumaeVo gvo,HttpServletRequest request) {
		String userid = session.getAttribute("userid").toString();
		gvo.setUserid(userid);
		
		String pcode = gvo.getPcode();
		String color = request.getParameter("color"); // ppcode 제작용으로 가져옴
		String size = request.getParameter("size");	 //
		
		String ppcode = pcode+color+size;
		gvo.setPpcode(ppcode);
		
		LocalDate today = LocalDate.now();
		int y = today.getYear();
		int m = today.getMonthValue();
		int d = today.getDayOfMonth();
		String m2 = String.format("%02d", m);
		String d2 = String.format("%02d", d);
		String jumuncode = "j"+y+m2+d2;
		int num = mapper.getNumber(jumuncode);
		String num2 = String.format("%03d", num);
		jumuncode = jumuncode+num2;
		gvo.setJumuncode(jumuncode);
		
		mapper.proGumaeOk(gvo);
		
		return "redirect:/product/jumunView?jumuncode="+jumuncode;
	} */
	
	@Override
	public String proGumaeOk(HttpSession session, GumaeVo gvo,HttpServletRequest request) {
		if(session.getAttribute("userid")!=null)
		{
		String userid = session.getAttribute("userid").toString();
		gvo.setUserid(userid);
		String[] pcode = request.getParameter("pcodes").split(",");
		String[] color = request.getParameter("colors").split(","); // ppcode 제작용으로 가져옴
		String[] size = request.getParameter("sizes").split(",");	 //
		String[] su = request.getParameter("sus").split(",");	
		String[] no = request.getParameter("nos").split(",");	 //cartList에서 구매시 장바구니 목록 삭제용
		
		LocalDate today = LocalDate.now();
		int y = today.getYear();
		int m = today.getMonthValue();
		int d = today.getDayOfMonth();
		String m2 = String.format("%02d", m);
		String d2 = String.format("%02d", d);
		String jumuncode = "j"+y+m2+d2;
		int num = mapper.getNumber(jumuncode);
		String num2 = String.format("%03d", num);
		jumuncode = jumuncode+num2;
		gvo.setJumuncode(jumuncode);
		
		ArrayList<GumaeVo> glist = new ArrayList<GumaeVo>();
		for(int i=0;i<pcode.length;i++)
		{
			gvo.setPpcode(pcode[i]+color[i]+size[i]);
			gvo.setPcode(pcode[i]);
			gvo.setColor(color[i]);
			gvo.setSize(size[i]);
			gvo.setSu(Integer.parseInt(su[i]));		
			mapper.proGumaeOk(gvo);
			mapper.proGumaeOkDel(no[i]);
			mapper.plusPansu(pcode[i],su[i]);
			mapper.UpJego(gvo.getPpcode(),su[i]);
		}
		mapper.getJuk(userid,gvo.getJuk()); //상품 구입으로 저장되는 적립금
		String juk2 = request.getParameter("juk2");
		mapper.minusJuk(userid,juk2);
		
		
		
		return "redirect:/product/jumunView?jumuncode="+jumuncode+"&juk2="+juk2;
		}
		else
		{
			return "redirect:/member/login";
		}
	}

	@Override
	public String jumunView(HttpServletRequest request, Model model,HttpSession session) {
		String jumuncode = request.getParameter("jumuncode");
		String userid = session.getAttribute("userid").toString();
		String useJuk = request.getParameter("juk2");
		
//		String color[] = request.getParameter("color").split(",");		
//		String size[] = request.getParameter("size").split(",");
		
//		int su = Integer.parseInt(request.getParameter("su"));		
		
		
		ArrayList<GumaeVo> glist = mapper.jumunView(jumuncode);
		
		model.addAttribute("jumuncode", jumuncode);
		
		BaeVo bvo = mapper.getBaesong2(glist.get(0).getBaeNo());
		model.addAttribute("bvo", bvo);
		
		ArrayList<ProductVo> plist = new ArrayList<ProductVo>();
		
		int price = 0;
		int bprice = 0;
		int cprice = 0;
		int halin = 0;
		int juk = 0;
		int cnt =0;
		for(int i=0;i<glist.size();i++)
		{
			ProductVo pvo = mapper.proContent(glist.get(i).getPcode());
			pvo.setSu(glist.get(i).getSu());
			
			String ppcode = glist.get(i).getPpcode();
			String color = ppcode.substring(ppcode.length()-2, ppcode.length()-1);
			String size = ppcode.substring(ppcode.length()-1, ppcode.length());
			
			pvo.setColor(color);
			pvo.setSize(size);			
			
			price = price + (pvo.getPrice()-(int)(pvo.getPrice()*pvo.getHalin()/100.0))*pvo.getSu();		
			bprice = pvo.getBprice();
			
			cprice = cprice + pvo.getPrice()*pvo.getSu();
			halin = halin + (int)(pvo.getPrice()*pvo.getHalin()/100.0);
			juk = juk + (int)((pvo.getPrice()-(int)(pvo.getPrice()*pvo.getHalin()/100.0))*pvo.getJuk()/100.0);
			
			cnt=glist.get(i).getCnt();
			
			plist.add(pvo);
		}
		model.addAttribute("glist", glist);
		model.addAttribute("plist", plist);
		model.addAttribute("price", price);		
		model.addAttribute("bprice", bprice);		
		model.addAttribute("cprice", cprice);		
		model.addAttribute("halin", halin);		
		model.addAttribute("juk", juk);		
		model.addAttribute("cnt", cnt);
		model.addAttribute("useJuk", useJuk);
		
		
//		pvo.setColor(color);
//		pvo.setSize(size);
//		pvo.setSu(su);		
		//model.addAttribute("pvo", pvo);
		
		
		MemberVo mvo = mapper.getInfo(userid);
		model.addAttribute("mvo", mvo);
	
		
		
		return "/product/jumunView";
	}

	@Override
	public String jjimAdd(HttpServletRequest request, HttpSession session) {
		
		if(session.getAttribute("userid")!=null)
		{
			try 
			{
				String pcode=request.getParameter("pcode");
				String userid = session.getAttribute("userid").toString();
				//int msg = Integer.parseInt(request.getParameter("msg"));
				String msg = request.getParameter("msg");
				//if(msg==-1)
				if(msg.equals("-1"))//빈하트 클릭한 경우 //String일경우는 equals사용 잊지않도록
				{
				mapper.jjimAdd(pcode,userid);
				mapper.upProHeart(pcode);
				}
				else // 빨간하트 클릭한 경우
				{
				mapper.jjimDel(pcode, userid);		
				mapper.downProHeart(pcode);
				}
				return "1";
				
			}
			catch(Exception e)
			{
				return "2";
			}
			
		} 
		else  //로그인 안했을경우
		{
			return "0";
		}
		
		
		
	}

	@Override
	public String addCart(HttpServletRequest request, HttpSession session) {
		
		if(session.getAttribute("userid")!=null)
		{
			try
			{
				String userid = session.getAttribute("userid").toString();
				String pcode = request.getParameter("pcode");
				String color = request.getParameter("color");
				String size = request.getParameter("size");
				//String su=request.getParameter("su");//vo에 있는 자료형과 일치시켜야 오류 발생하지않음
				int su = Integer.parseInt(request.getParameter("su"));
				String ppcode = pcode+color+size;
				if(mapper.isCart(userid, pcode)) // 장바구니에 해당 상품이 이미 존재했을뗴
				{
					return "3";
				}
				else//장바구니에 해당 상품이 없을때 
				{
					mapper.addCart(userid,pcode,color,size,su,ppcode);
				}
				return "1";
				
			}
			catch(Exception e)
			{
				return "2";
			}
		}
		else //로그인 안했을시
		{
			return "0";
		}
		
	}

	@Override //장바구니에 해당상품이 존재하는데 또 장바구니 추가 버튼을 클릭했을때
	public String addCart1(HttpServletRequest request, HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		String pcode = request.getParameter("pcode");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		int su = Integer.parseInt(request.getParameter("su"));
		String ppcode = pcode+color+size;
		mapper.addCart(userid,pcode,color,size,su,ppcode);


		return "redirect:/product/proContent?pcode="+pcode;
	}

	@Override
	public String jjimList(HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		ArrayList<ProductVo> plist = mapper.jjimList(userid);
		model.addAttribute("plist", plist);
		
		return "/product/jjimList";
	}

	@Override //찜리스트에서 컬러,사이즈 없을때 장바구니 추가시 재고 테이블에서 select된 제일 처음값으로 추가
	public String addCart2(HttpSession session, HttpServletRequest request) {
		String userid=session.getAttribute("userid").toString();
		String pcode = request.getParameter("pcode");
		
		if(mapper.getJego(pcode)!=null) //재고에 제품 존재할시
		{
			try
			{
			JegoVo jvo = mapper.getJego(pcode);
			jvo.setUserid(userid);
			mapper.addCart2(jvo);
			return  "1";
			}
			catch(Exception e)
			{
				return "2";
			}
	
		}
		else //재고에 제품 없을시 = 매진시
		{
			return "0";
		}
	}

	@Override
	public String jjimListDel(HttpServletRequest request) {
		
		String[] nos = request.getParameter("no").split(",");
		for(int i=0;i<nos.length;i++)
		{
			mapper.jjimListDel(nos[i]);
		}
		
		return "redirect:/product/jjimList";
	}

	@Override
	public String cartList(HttpSession session,Model model) {
		if(session.getAttribute("userid")!=null)
		{
		String userid = session.getAttribute("userid").toString();
		ArrayList<ProductVo> plist = mapper.cartList(userid);
		
		String color="";
		String size="";
		for(int i=0;i<plist.size();i++)
		{
		color = plist.get(i).getColor();
		color = Util.getColor(color);		plist.get(i).setColor_1(color); //컬러 한글화 변수		
		size = plist.get(i).getSize();
		size = Util.getSize(size);
	    plist.get(i).setSize_1(size); //사이즈 한글화 변수
    	}
		
		
		model.addAttribute("plist", plist);
		return "/product/cartList";
		}
		else
		{
			return "redirect:/member/login";
		}
	}

	@Override
	public String cartDel(HttpSession session, HttpServletRequest request) {
		String userid = session.getAttribute("userid").toString();
		String[] nos = request.getParameter("no").split(",");
		//String no = request.getParameter("no");
		for(int i=0;i<nos.length;i++)
		{
			mapper.cartDel(userid,nos[i]);
		}
		return "redirect:/product/cartList";
	}

	@Override
	public String upCartSu(HttpServletRequest request) {
		String no = request.getParameter("no");
		String su = request.getParameter("su");
		mapper.upCartSu(no,su);
		
		
		return "redirect:/product/cartList";
	}

	@Override
	public String reviewDel(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("userid")!=null)
		{
			String pcode = request.getParameter("pcode");
			String no = request.getParameter("no");
			mapper.reviewDel(no);
			double avg = mapper.getReviewAvg(pcode);
			mapper.setProStar(avg,pcode);
			return "redirect:/product/proContent?pcode="+pcode;
		}
		else
		{
			return "redirect:/member/login";
		}
		
	}

	@Override
	public String getAnswer(HttpServletRequest request,HttpSession session) {
		String ref = request.getParameter("ref");
		QuestVo qvo1 = mapper.getQuest1(ref); //qa0인 테이블값 찾는 mapper
		QuestVo qvo = mapper.getAnswer(ref);
		String str ="<div style=\"width:1100px;background:#f7f8fa;font-size:14px;\">";
		str = str + "<div style=\"margin-left:115px;padding-bottom:10px;padding-top:10px;\">";
		str = str + "<div style=\"width:640px;color:#5f5f5f;\">"+qvo1.getContent()+"</div>";
		if(session.getAttribute("userid")!=null && session.getAttribute("userid").equals(qvo1.getUserid()))
				{
			str = str + "<div style=\"margin-top:20px;border-bottom:1px solid #eaeced;padding-bottom:30px;;color:#a3a3a3\"><span style=\"cursor:pointer\" onclick=\"proQuestUpdate('"+qvo1.getContent()+"',"+qvo1.getNo()+","+qvo1.getView()+","+qvo1.getQtype()+")\">수정</span> | <span style=\"cursor:pointer\" onclick=\"proQuestDel("+qvo1.getRef()+")\">삭제</span></div>";
				}
		else if(session.getAttribute("userid")==null)
		{
			str = str + "<div style=\"margin-top:20px;border-bottom:1px solid #eaeced;padding-bottom:30px;color:#a3a3a3\"></div>";
			
		}
		if(qvo!=null)
		{
		str = str + "<div style='display:flex;justify-content:space-between;padding-bottom:40px;'>";
		str = str + "<div style='margin-top:20px;width:500px;'>└<span style='color:#888888;border:1px solid #e1e3e5'>답변</span>&nbsp&nbsp"+qvo.getContent()+"</div>";
		str = str + "<div style='padding-top:20px;margin-left:220px;'>운영자</div>";
		str = str + "<div style=\"padding-top:20px;margin-right:30px;\">"+qvo.getWriteday_date()+"</div>";
		str = str + "</div>";
		str = str + "</div>";
		str = str + "</div>";
		}		
		
				
		return str;
	}

	@Override
	public String chgTop() {
		
		String top = "150px";
		return top;
	}

	@Override
	public String chgReq(HttpServletRequest request) {
		String no= request.getParameter("no");
		String req = request .getParameter("req");
		String greq = request.getParameter("greq");
				
				
	try {
			mapper.chgReq(no,req,greq);
			return "0";
			
		}
		catch(Exception e)
		{
			return "1";
		}
	}

	@Override
	public String chgGreq(HttpServletRequest request) {
		String greq = request.getParameter("greq");
		String no = request.getParameter("no");
		try{
			mapper.chgGreq(no,greq);
			return"0";
			}
		catch(Exception e)
		{
			return "1";
		}
		
	}

	@Override
	public String baeDel(HttpServletRequest request) {
		String no = request.getParameter("no");
		mapper.baeDel(no);
		return "redirect:/product/baeList";
	}

	

}
