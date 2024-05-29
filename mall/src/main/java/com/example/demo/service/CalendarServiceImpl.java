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

import com.example.demo.mapper.CalendarMapper;
import com.example.demo.util.Util;

@Service
@Qualifier("cc")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarMapper mapper;

	@Override
	public String gumaeCal(HttpServletRequest request, Model model, HttpSession session) {
		int year,month;
		if(request.getParameter("year")==null)
		{
			LocalDate today = LocalDate.now();
			
			year = today.getYear();
			month = today.getMonthValue();
		}
		else
		{
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			
			if(month==0)
			{
				year --;
				month=12;
			}
			if(month==13)
			{
				year++;
				month=1;
			}
		}
		
		LocalDate xday = LocalDate.of(year, month, 1);
		
		int chong = xday.lengthOfMonth();
		int yoil = xday.getDayOfWeek().getValue();
		int ju = (int)Math.ceil((chong+yoil)/7.0);
		
		model.addAttribute("chong", chong);
		model.addAttribute("yoil", yoil);
		model.addAttribute("ju", ju);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		String userid = session.getAttribute("userid").toString();
		
		String y = String.format("%02d",year);
		String m = String.format("%02d",month);
		String ym = y+"-"+m;
		ArrayList<HashMap> mapList = mapper.gumaeCal(userid,ym);
		
		for(int i=0;i<mapList.size();i++)
		{
			int n=Integer.parseInt( mapList.get(i).get("state").toString() );
			String imsi=Util.getState(n);
			mapList.get(i).put("state2", imsi);
		}
		
		model.addAttribute("mapList",mapList);
		//System.out.println(mapList.size());
 		return "/calendar/gumaeCal";
	}
	
	

}
