package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String home()
	{
		return "redirect:/main/main";
	}
	
	@RequestMapping("/main/main")
	public String main()
	{
		return "main/main";
	}
	
}
