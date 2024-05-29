package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CalendarService {

	String gumaeCal(HttpServletRequest request, Model model, HttpSession session);

}
