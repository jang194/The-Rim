package com.example.demo.service;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.util.Util;
import com.example.demo.vo.CartVo;
import com.example.demo.vo.GumaeVo;
import com.example.demo.vo.JjimVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ProductVo;
import com.example.demo.vo.QuestVo;
import com.example.demo.vo.ReviewVo;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String member() {
		
		return "/member/member";
	}

	@Override
	public String memberOk(MemberVo mvo) {
		mapper.memberOk(mvo);
		return "redirect:/member/login";
	}

	@Override
	public int useridChk(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		return mapper.useridChk(userid);
		
	}

	@Override
	public String login(HttpServletRequest request,Model model) {
		String err = request.getParameter("err");
		String pcode = request.getParameter("pcode"); //proContent에서 로그인 안했을시
		String cart = request.getParameter("cart");
		//String size = request.getParameter("size");
		//String color = request.getParameter("color");
		model.addAttribute("cart", cart);
		model.addAttribute("pcode", pcode);
		model.addAttribute("err", err);
		
		
		return "/member/login";
		
	}

	@Override
	public String loginOk(HttpSession session,MemberVo mvo,HttpServletRequest request) {
		
		mvo = mapper.loginOk(mvo);
		if(mvo==null) //아이디 비번 일치하지않음
		{
			if(request.getParameter("pcode")!=null)
			{
				return "redirect:/member/login?err=1&pcode="+request.getParameter("pcode");
			}
//			else if(request.getParameter("cart")!=null)
//			{
//				return "redirect:/member/login?err=1&cart="+request.getParameter("cart");
//			}
			else
			{
				return "redirect:/member/login?err=1";
			}
		}
		else //아이디 비번 일치
		{
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("name", mvo.getName());
			
			if(request.getParameter("pcode")==null)
			{
				return "redirect:/main/main";
			}
			
			else
			{
				return "redirect:/product/proContent?pcode="+request.getParameter("pcode");
			}
		}
	}

	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/main";
	}

	@Override
	public String jumunList(HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		ArrayList<GumaeVo> glist = mapper.jumunList(userid);
		
		int isReview=0;
		String color="";
		String size="";
		for(int i=0;i<glist.size();i++)
		{
			int cnt = mapper.jcodeCnt(glist.get(i).getJumuncode()); //주문코드 당 여러개 상품 구매시 몇건인지 표시하는 변수
			glist.get(i).setCnt(cnt); 
			
			isReview = mapper.chkReview(glist.get(i).getNo());
			
			String ppcode = glist.get(i).getPpcode();
			color = ppcode.substring(ppcode.length()-2,ppcode.length()-1);
			size = ppcode.substring(ppcode.length()-1,ppcode.length());
			color = Util.getColor(color);
			size = Util.getSize(size);
			glist.get(i).setIsReview(isReview);
			glist.get(i).setColor(color);
			glist.get(i).setSize(size);
//			ArrayList<GumaeVo> jlist = mapper.jlist(glist.get(i).getJumuncode());
//			for(int j=0;j<jlist.size();j++)
//			{
//			}
		}
	//	model.addAttribute("jlist", jlist);
		model.addAttribute("glist", glist);		
		return "/member/jumunList";
	}

	@Override
	public String jlistDel(HttpSession session, HttpServletRequest request) {
		String userid = session.getAttribute("userid").toString();
		String jumuncode = request.getParameter("jumuncode");
		mapper.jlistDel(userid, jumuncode);
		return "redirect:/member/jumunList";
	}

	@Override
	public String stateUp(HttpServletRequest request) {
		String no = request.getParameter("no");
		String state = request.getParameter("state");
		mapper.stateUp(state,no);
		return "redirect:/member/jumunList";
	}

	@Override
	public String userModify(HttpSession session,Model model) {
		if(session.getAttribute("userid")!=null)
		{
		String userid = session.getAttribute("userid").toString();
		MemberVo mvo = mapper.getInfo(userid);
		model.addAttribute("mvo", mvo);
		return "/member/userModify";
		}
		else
		{
			return "redirect:/member/login";
		}
	}

	@Override
	public String chgEmail(HttpSession session,HttpServletRequest request) {
		try
		{
		String userid = session.getAttribute("userid").toString();
		String email = request.getParameter("email");
		mapper.chgEmail(userid,email);
		 	return"0";
		}
		catch(Exception e)
		{
			return"1";
		}
	}

	@Override
	public String chgPhone(HttpSession session, HttpServletRequest request) {
		try
		{
		String userid = session.getAttribute("userid").toString();
		String phone = request.getParameter("phone");
		mapper.chgPhone(userid, phone);
		return "0";
		}
		catch(Exception e)
		{
			return "1";
		}
	}

	@Override
	public String reviewWrite(HttpSession session, HttpServletRequest request,Model model) {
		String ppcode = request.getParameter("ppcode");
		String pimg = request.getParameter("pimg");
		String title = request.getParameter("title");
		String color =ppcode.substring(ppcode.length()-2,ppcode.length()-1);
		String size =ppcode.substring(ppcode.length()-1,ppcode.length());
		String pcode =ppcode.substring(0,ppcode.length()-2);
		String no = request.getParameter("no");  //구매테이블의 no값 ,isReview때 사용
		String userid = session.getAttribute("userid").toString();
		MemberVo mvo = mapper.getReview1(userid);
		model.addAttribute("userid", userid);
		
		model.addAttribute("mvo", mvo);
		model.addAttribute("no",no);
		model.addAttribute("ppcode", ppcode);
		model.addAttribute("pcode",pcode );
		model.addAttribute("color",color );
		model.addAttribute("size",size );
		model.addAttribute("pimg", pimg);
		model.addAttribute("title", title);
		return "/member/reviewWrite";
	}

	@Override
	public String reviewWriteOk(ReviewVo rvo, HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		rvo.setUserid(userid);
		//no값은 구매테이블 no값, user가 구매상품에 리뷰 작성시 표시용
		mapper.reviewWriteOk(rvo);
		double avg = mapper.getReviewAvg(rvo.getPcode());
		mapper.setProStar(avg,rvo.getPcode()); //리뷰의 스타값 프로덕트로 옯겨서 평균값 저장
		mapper.isReview(rvo.getNo()); //리뷰 작성했는지 않했는지 표시
		mapper.plusjuk(userid);
		return null;
	}

	@Override
	public String jumunQuestWrite(HttpSession session, HttpServletRequest request, Model model) {
		String no = request.getParameter("no");//구매테이블 no값
		GumaeVo gvo = mapper.jumunQuestWrite(no);
		String title = mapper.getProTitle(gvo.getPcode());
		String pimg = mapper.getProPimg(gvo.getPcode());
		
		String ppcode = gvo.getPpcode();
		String color = ppcode.substring(ppcode.length()-2,ppcode.length()-1);	
		String size = ppcode.substring(ppcode.length()-1,ppcode.length());	
		gvo.setColor(Util.getColor(color));
		gvo.setSize(Util.getSize(size));
		gvo.setTitle(title);
		model.addAttribute("gvo", gvo);
		model.addAttribute("pimg", pimg);
		return "/member/jumunQuestWrite";
	}

	@Override
	public String jumunQuestWriteOk(QuestVo qvo, HttpSession session,HttpServletRequest request) {
		String userid = session.getAttribute("userid").toString();
		qvo.setUserid(userid);
		int ref = mapper.getMaxJRef();
		qvo.setRef(ref);
		mapper.jumunQuestWriteOk(qvo);
		return null;
	}

	

	@Override
	public String proQuestWrite(HttpSession session, HttpServletRequest request, Model model) {
		String userid = session.getAttribute("userid").toString();
		String pimg = request.getParameter("pimg");
		String title = request.getParameter("title");
		String pcode = request.getParameter("pcode");
		model.addAttribute("pimg", pimg);		
		model.addAttribute("title",title);		
		model.addAttribute("pcode",pcode);		
				
				
		return "/member/proQuestWrite";
		
	}

	@Override
	public String proQuestWriteOk(QuestVo qvo,HttpServletRequest request, HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		qvo.setUserid(userid);
		int ref = mapper.getMaxRef();
		qvo.setRef(ref);	
		
		mapper.proQuestWriteOk(qvo);
		
		return null;
	}

	@Override //procontent
	public String reviewUpdate(HttpSession session, HttpServletRequest request, Model model) {
		if(session.getAttribute("userid")!=null)
		{
			String pcode =request.getParameter("pcode");
			String pimg = request.getParameter("pimg");
			String color = request.getParameter("color");
			String size = request.getParameter("size");
			String title = request.getParameter("title");
			String no = request.getParameter("no");
			String ppcode = pcode+color+size;
			
			String userid = session.getAttribute("userid").toString();
			
		    ReviewVo rvo = mapper.getReview2(no);
		    model.addAttribute("rvo", rvo);    		
		    model.addAttribute("pimg", pimg);
			model.addAttribute("color", color);
			model.addAttribute("size", size);
			model.addAttribute("pcode", pcode);
			model.addAttribute("title",title);
			model.addAttribute("ppcode", ppcode);
			model.addAttribute("no", no);
			return "/member/reviewUpdate";
		}
		else
		{
			String pcode = request.getParameter("pcode");
			return "redirect:/member/login?pcode="+pcode;
		}
	}

	@Override
	public String reviewUpdateOk(ReviewVo rvo, HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		rvo.setUserid(userid);
		mapper.reviewUpdateOk(rvo);
		double avg = mapper.getReviewAvg(rvo.getPcode());
		mapper.setProStar(avg,rvo.getPcode()); //리뷰의 스타값 프로덕트로 옯겨서 평균값 저장
		return null;
	}

	@Override
	public String proQuestDel(HttpSession session, HttpServletRequest request) {
		String pcode = request.getParameter("pcode");
		if(session.getAttribute("userid")!=null)
			{
			String no = request.getParameter("no");  //no로 표시했지만 ref값이다 질문글 답글 둘다 지울수 있는 공통변수여서 사용
			mapper.proQuestDel(no);  
			return "redirect:/product/proContent?pcode="+pcode;
			}
		else
		{
			return "redirect:/member/login?pcode="+pcode;
		}
	}

	@Override
	public String proQuestUpdate(QuestVo qvo, HttpSession session,Model model,HttpServletRequest request) {
		if(session.getAttribute("userid")!=null)
		{
			String title = request.getParameter("title");
			String pimg = request.getParameter("pimg");
			
			model.addAttribute("title", title);		
			model.addAttribute("pimg", pimg);		
			
			qvo = mapper.getproQuest(qvo.getNo());
			model.addAttribute("qvo", qvo);
			
			return "/member/proQuestUpdate";
		}
		else
		{
			return "redirect:/member/login?pcode="+qvo.getPcode();
		}
		
	}

	@Override
	public String proQuestUpdateOk(QuestVo qvo, HttpSession session) {
		if(session.getAttribute("userid")!=null)
			{
			mapper.proQuestUpdateOk(qvo);
			return "redirect:/product/proContent?pcode="+qvo.getPcode();
			}
		else
		{
			return "redirect:/member/login?pcode="+qvo.getPcode();
		}
	}

	@Override
	public String mypage(HttpSession session,Model model,HttpServletRequest request) {
		if(session.getAttribute("userid")!=null)
		{
			String userid = session.getAttribute("userid").toString();
			ArrayList<ProductVo> plist = mapper.getCart(userid); //장바구니내역
			model.addAttribute("plist", plist);
			
			
				int page=1;
				if(request.getParameter("page")!=null)
				{
					page = Integer.parseInt(request.getParameter("page"));
				}
				int index = (page-1)*5;
				int pstart = page/10;
				if(page%10==0)
				{
					pstart--;
				}
				pstart = pstart*10+1;
				int pend = pstart+9;
				int chong = mapper.getJjimChong(userid);
				if(pend>chong)
					pend=chong;
				
			model.addAttribute("page", page);
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("chong", chong);
			ArrayList<ProductVo> jlist = mapper.getJjim(userid,index);
			model.addAttribute("jlist", jlist);
			
			
			
			ArrayList<ReviewVo> rlist = mapper.getReview(userid); //리뷰
			model.addAttribute("rlist", rlist);
			
			int gpage=1;
			if(request.getParameter("gpage")!=null)
			{
			gpage = Integer.parseInt(request.getParameter("gpage"));
			}
			int gindex=(gpage-1)*5;
			int gpstart=gpage/10;
			if(gpage%10==0)
				gpstart--;
			gpstart=gpstart*10+1;
			int gpend = gpstart+9;
			int gchong = mapper.getGumaeChong(userid);
			if(gpend>gchong)
				gpend=gchong;
			model.addAttribute("gpage",gpage);		
			model.addAttribute("gpstart",gpstart);		
			model.addAttribute("gpend",gpend);		
			model.addAttribute("gchong",gchong);		
			
			
			
			ArrayList<GumaeVo> glist = mapper.getGumae(userid,gindex); //최근구매내역
			for(int i=0;i<glist.size();i++)
			{
				String ppcode = glist.get(i).getPpcode();
				int len = ppcode.length();
				String color = ppcode.substring(len-2, len-1);
				String size = ppcode.substring(len-1, len);
				color = Util.getColor(color);
				size = Util.getSize(size);
				glist.get(i).setColor(color);		
				glist.get(i).setSize(size);		
				
				
			}
			model.addAttribute("glist", glist);
			
			ArrayList<QuestVo> pqlist = mapper.getProQuest(userid);  //상품문의
			model.addAttribute("pqlist", pqlist);
			
			ArrayList<QuestVo> jqlist = mapper.getJumunQuest(userid); //1:1문의
			model.addAttribute("jqlist", jqlist);
			
			
			return "/member/mypage";
		}
		else
		{
			return "redirect:/member/login";
		}
		
		
	}

	@Override
	public String Gpage(HttpServletRequest request, HttpSession session) {
		int gpage = Integer.parseInt(request.getParameter("gpage"));
		String userid = session.getAttribute("userid").toString();
		int gindex = (gpage-1)*5;
		ArrayList<GumaeVo> glist = mapper.getGumae(userid, gindex);	
		for(int i=0;i<glist.size();i++)
		{
			String ppcode = glist.get(i).getPpcode();
			int len = ppcode.length();
			String color = ppcode.substring(len-2, len-1);
			String size = ppcode.substring(len-1, len);
			color = Util.getColor(color);
			size = Util.getSize(size);
			glist.get(i).setColor(color);		
			glist.get(i).setSize(size);		
			
			String pcode = glist.get(i).getPcode();
			int price = mapper.getPrice(pcode);
			
			glist.get(i).setCprice(price);
		}
		String str="";
		for(int i=0;i<glist.size();i++)
		{
			int price = glist.get(i).getPrice();
			int halin = glist.get(i).getHalin();
			int su = glist.get(i).getSu();			
			int imsi = (price-(int)(price*halin/100.0))*su;
			DecimalFormat df = new DecimalFormat("###,###");
			String cprice = df.format(imsi);
			
			
			str = str+"<div style=\"display:flex;justify-content:start;margin-top:10px;\">";
			str = str+"<div><img width=\"100\"height=\"110\"  src=\"/static/product/"+glist.get(i).getPimg()+"\"></div>";
			str = str+"<div style=\"width:800px;margin-left:10px;font-size:14px;\">";
			str = str+"<div style=\"font-size:14px;color:#aaaaac;\">"+ glist.get(i).getWriteday()+" 결제</div>";
			str = str+"<div style=\"margin-top:4px;font-weight:900;\">"+glist.get(i).getTitle()+"</div>";
			str = str+"<div style=\"font-weight:900;margin-top:3px;\">"+cprice+"원</div>";
			str = str+"<div style=\"margin-top:5px;color:#8f8f8f;font-size:14px;\"><span style=\"border:1px solid #dddde1;\">&nbsp옵션&nbsp</span> 색상: "+glist.get(i).getColor()+" / 사이즈: "+glist.get(i).getSize()+" / 수량: "+glist.get(i).getSu()+"개</div>";
			str = str+"</div>";
			str = str+"</div>";
		}
		
		System.out.println(str);
		return str;
	}

	@Override
	public String MycartUp(HttpServletRequest request) {
		String no = request.getParameter("no");
		String su = request.getParameter("su");
		mapper.MycartUp(no,su);
		
		return null;
	}

	@Override
	public String getAnswer(HttpServletRequest request) {
		String ref = request.getParameter("ref");
		String pimg = request.getParameter("pimg");
		String title = request.getParameter("title");
		String pcode = request.getParameter("pcode");
		QuestVo qvo1 = mapper.getQuest1(ref); //qa0인 테이블값 찾는 mapper
		QuestVo qvo = mapper.getAnswer(ref);
		String str ="<div style=\"width:1200px;background:#f7f8fa;font-size:14px;\">";
		str = str + "<div style=\"margin-left:280px;padding-top:20px;\">";
		str = str + "<div style=\"width:640px;color:#5f5f5f;\">"+qvo1.getContent()+"</div>";
		str = str + "<div style=\"margin-top:20px;border-bottom:1px solid #eaeced;padding-bottom:30px;;color:#a3a3a3\"><span style=\"cursor:pointer\" onclick=\"proQuestUpdate('"+pimg+"',"+"'"+title+"',"+"'"+pcode+"',"+"'"+qvo1.getContent()+"',"+qvo1.getNo()+","+qvo1.getView()+","+qvo1.getQtype()+")\">수정</span> | <span style=\"cursor:pointer\" onclick=\"proQuestDel("+qvo1.getRef()+")\">삭제</span></div>";
		if(qvo!=null)
		{
		str = str + "<div style='display:flex;justify-content:space-between;padding-bottom:40px;'>";
		str = str + "<div style='margin-top:20px;width:370px;'>└<span style='color:#888888;border:1px solid #e3e5e8'>답변</span>&nbsp&nbsp"+qvo.getContent()+"</div>";
		str = str + "<div style='padding-top:20px;margin-left:10px;'>운영자</div>";
		str = str + "<div style=\"padding-top:20px;margin-right:240px;\">"+qvo.getWriteday_date()+"</div>";
		str = str + "</div>";
		str = str + "</div>";
		str = str + "</div>";
		}		
		
				
		return str;
	}

	@Override
	public String getAnswer1(HttpServletRequest request) {
		String ref = request.getParameter("ref");
		String pimg = request.getParameter("pimg");
		String title = request.getParameter("title");
		String pcode = request.getParameter("pcode");
		String no = request.getParameter("no");
		QuestVo qvo1 = mapper.getQuest2(ref); //qa0인 테이블값 찾는 mapper
		QuestVo qvo = mapper.getAnswer1(ref);
		String str ="<div style=\"width:1200px;background:#f7f8fa;font-size:14px;\">";
		str = str + "<div style=\"margin-left:280px;padding-top:20px;\">";
		str = str + "<div style=\"width:640px;color:#5f5f5f;\">"+qvo1.getContent()+"</div>";
		str = str + "<div style=\"margin-top:20px;border-bottom:1px solid #eaeced;padding-bottom:30px;;color:#a3a3a3\"><span style=\"cursor:pointer\" onclick=\"jumunQuestUpdate('"+pimg+"',"+"'"+title+"',"+"'"+pcode+"',"+"'"+qvo1.getContent()+"',"+qvo1.getNo()+","+qvo1.getView()+","+qvo1.getQtype()+","+no+")\">수정</span> | <span style=\"cursor:pointer\" onclick=\"jumunQuestDel("+qvo1.getRef()+")\">삭제</span></div>";
		if(qvo!=null)
		{
		str = str + "<div style='display:flex;justify-content:space-between;padding-bottom:40px;'>";
		str = str + "<div style='margin-top:20px;width:310px;'>└<span style='color:#888888;border:1px solid #e3e5e8'>답변</span>&nbsp&nbsp"+qvo.getContent()+"</div>";
		str = str + "<div style='padding-top:20px;margin-left:90px;'>운영자</div>";
		str = str + "<div style=\"padding-top:20px;margin-right:240px;\">"+qvo.getWriteday_date()+"</div>";
		str = str + "</div>";
		str = str + "</div>";
		str = str + "</div>";
		}		
		
				
		return str;
	}

	@Override
	public String viewList(HttpServletRequest request) {
		String jumuncode = request.getParameter("jumuncode");
		ArrayList<GumaeVo> glist = mapper.viewList(jumuncode);
		
		String str = "";
		for(int i=0;i<glist.size();i++)
		{
			
			String ppcode=glist.get(i).getPpcode();			
			int len = ppcode.length();
			
			String color = ppcode.substring(len-2,len-1);
		    String size = ppcode.substring(len-1, len);
		    
		    color = Util.getColor(color);	    
		    size = Util.getSize(size);
		    
		    
			glist.get(i).setColor(color);
			glist.get(i).setSize(size);
			
			int price = glist.get(i).getPrice();
			int halin = glist.get(i).getHalin();
			int su = glist.get(i).getSu();			
			int imsi = (price-(int)(price*halin/100.0))*su;
			DecimalFormat df = new DecimalFormat("###,###");
			String cprice = df.format(imsi);
			
//			glist.get(i).getPimg()	
//			glist.get(i).getTitle()			
//			glist.get(i).getWriteday()		
//			glist.get(i).getCprice()		
//			glist.get(i).getColor()		
//			glist.get(i).getSize()		
//			glist.get(i).getSu()		
//			glist.get(i).getNo()		
//			glist.get(i).getState()		
			
//			(glist.get(i).getState()==0)
			str = str + "<div style=\"border-bottom:1px dashed #a6a6a6;padding-bottom:20px;\">";
			str = str + "<div style=\"display: flex;justify-content: space-between;margin-top:10px;\">";
			str = str + "<div style=\"color:#929294;font-size:17px;font-weight:900;\">";
			switch(glist.get(i).getState())
			{
			case 12 : str = str + "구매확정완료";break;
			case 0 : str = str + "결제완료";break;
			case 1 : str = str + "결제완료";break;
			case 2 : str = str + "배송중";break;
			case 3 : str = str + "배송완료";break;
			case 4 : str = str + "취소신청";break;
			case 5 : str = str + "취소완료";break;
			case 6 : str = str + "교환신청";break;
			case 7 : str = str + "교환완료";break;
			case 8 : str = str + "반품신청";break;
			case 9 : str = str + "반품완료";break;
			}
			str = str + "</div>";
			str = str + "<div style=\"font-size:25px;margin-right:5px;cursor:pointer;\" onclick=\"jlistDel('"+glist.get(i).getJumuncode()+"',"+glist.get(i).getCnt()+")\"><img src=\"/static/main/close1.png\"></div>";
			str = str + "</div>";
			
			
			str = str + "<div style=\"display:flex;justify-content:start;margin-top:10px;\">";
			str = str + "<div><img width=\"150\" src=\"/static/product/"+glist.get(i).getPimg()+"\"></div>";
			str = str + "<div style=\"width:800px;margin-left:20px;font-size:15px;\">";
			str = str + "<div style=\"font-size:14px;color:#aaaaac;\">"+glist.get(i).getWriteday()+"&nbsp결제</div>";
			str = str + "<div style=\"margin-top:3px;\">"+glist.get(i).getTitle()+"</div>";
			str = str + "<div style=\"font-weight:900;margin-top:3px;\">"+cprice+"원</div>";
			str = str + "<div style=\"margin-top:3px;color:#8f8f8f;font-size:14px;\"><span style=\"border:1px solid #dddde1;\">&nbsp옵션&nbsp</span> 색상: "+glist.get(i).getColor()+" / 사이즈 "+glist.get(i).getSize()+" / 수량: "+glist.get(i).getSu()+"개</div><div>";
			str = str + "<span style=\"float:left;margin-top:3px;\">주문상세></span><span style=\"float:right;margin-right:15px;cursor:pointer;\" onclick=\"jumunQuestWrite("+glist.get(i).getNo()+")\">제품문의 ></span>";
			str = str + "</div></div></div>";
			str = str + "<div  align=\"center\" style=\"margin-top:20px;\">";
			if(glist.get(i).getState()==0)
			{
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;margin-left:30px;height:35px;\" type=\"button\" value=\"취소신청\" onclick=\"location='stateUp?no="+glist.get(i).getNo()+"&state=4'\">";
			}
			else if(glist.get(i).getState()==1 || glist.get(i).getState()==2)
			{
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;margin-left:30px;height:35px;\" type=\"button\" value=\"배송조회\">";
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;margin-left:30px;height:35px;\" type=\"button\" value=\"취소신청\" onclick=\"location='stateUp?no="+glist.get(i).getNo()+"&state=4'\">";
			}
			else if(glist.get(i).getState()==4 || glist.get(i).getState()==5)
			{
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;margin-left:30px;height:35px;\" type=\"button\" value=\"취소내용 확인\">";
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;margin-left:30px;height:35px;\" type=\"button\" value=\"재구매\">";
			}
			else if(glist.get(i).getState()==3)
			{
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;height:35px;\" type=\"button\" value=\"구매확정\" onclick=\"location='stateUp?no="+glist.get(i).getNo()+"&state=12'\">";
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;margin-left:30px;height:35px;\" type=\"button\" value=\"반품신청\" onclick=\"location='stateUp?no="+glist.get(i).getNo()+"&state=8'\">";
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;margin-left:30px;height:35px;\" type=\"button\" value=\"교환신청\" onclick=\"location='stateUp?no="+glist.get(i).getNo()+"&state=6'\">";
			}
			else if(glist.get(i).getState()==12 && glist.get(i).getIsReview()==0)
			{
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;height:35px;\" type=\"button\"type=\"button\" value=\"리뷰쓰기\" onclick=\"reviewWrite('"+glist.get(i).getPpcode()+"','"+glist.get(i).getPimg()+"','"+glist.get(i).getTitle()+"',"+glist.get(i).getSu()+","+glist.get(i).getNo()+")\">";
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;height:35px;\" type=\"button\"type=\"button\" value=\"재구매\">";
			}
			else if(glist.get(i).getState()==12 && glist.get(i).getIsReview()==1)
			{
			str = str + "<input class=\"jumunbtn\"  style=\"width:30%;height:35px;\" type=\"button\"type=\"button\" value=\"재구매\">";
			}
			str = str + "</div></div>";
			str = str + "</div>";
		}
		
		
		return str;
	}

	@Override
	public String customList(HttpSession session, HttpServletRequest request, Model model) {
		if(session.getAttribute("userid")!=null)
		{
			String userid = session.getAttribute("userid").toString();
					
			ArrayList<QuestVo> pqlist = mapper.getProQuest(userid);
			model.addAttribute("pqlist", pqlist);
			
			ArrayList<QuestVo> jqlist = mapper.getJumunQuest(userid);
			model.addAttribute("jqlist", jqlist);
			
			return "member/customList";
		}
		else
		{
			return "redirect:/member/login";
		}
	}

	@Override
	public String reviewDel(HttpServletRequest request) {
		String no = request.getParameter("no");
		mapper.reviewDel(no);
		return "redirect:/member/mypage";
	}

	@Override
	public String jumunQuestUpdate(QuestVo qvo, HttpSession session, Model model, HttpServletRequest request) {
		String userid = session.getAttribute("userid").toString();
		String pimg = request.getParameter("pimg");
		String title = request.getParameter("title");
		String pcode =request.getParameter("pcode");
		String protitle=mapper.getProTitle(pcode);
		String qtype=request.getParameter("qtype");
		String content = request.getParameter("content");
		String no = request.getParameter("no");
		GumaeVo gvo = mapper.getJumunQuest1(no);
		model.addAttribute("gvo", gvo);
		model.addAttribute("qtype", qtype);
		model.addAttribute("content", content);
		
		model.addAttribute("pimg", pimg);
		model.addAttribute("protitle", protitle);
		
		
		return "/member/jumunQuestUpdate";
		
		
	}

	@Override
	public String jumunQuestUpdateOk(QuestVo qvo) {
		
		mapper.jumunQuestUpdateOk(qvo);
		return "redirect:/member/customList";
	}

	@Override
	public String jumunQuestDel(HttpServletRequest request) {
		String ref = request.getParameter("ref");
		mapper.jumunQuestDel(ref);
		return null;
	}

	@Override
	public String pwdChg(HttpServletRequest request,HttpSession session) {
		String userid = session.getAttribute("userid").toString();
		String pwd = request.getParameter("pwd2");
		mapper.pwdChg(userid,pwd);
				return "redirect:/member/userModify";
	}
	

	


}
