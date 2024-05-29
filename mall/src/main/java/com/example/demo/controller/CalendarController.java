package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired
	@Qualifier("cc")
	private CalendarService service;
	
	@GetMapping("/calendar/gumaeCal")
	public String gumaeCal(HttpServletRequest request,Model model,HttpSession session)
	{
		return service.gumaeCal(request,model,session);
	}

}
