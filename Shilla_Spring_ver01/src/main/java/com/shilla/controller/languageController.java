package com.shilla.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class languageController{
	
	@RequestMapping(value = "/setKo.do")
	public String setKorean(Model model, HttpSession session) {
		session.setAttribute("language", "ko");
		return "redirect:./";
	}
	
	@RequestMapping(value = "/setEn.do")
	public String setEnglish(Model model, HttpSession session) {
		session.setAttribute("language", "en");
		return "redirect:./";
	}
	
	@RequestMapping(value = "/contactUs.do")
	public String goContactUs(Model model, HttpSession session, HttpServletRequest request) {
		return "/contactUs/contact.jsp";
	}
	
	@RequestMapping(value = "/setLang.do") 
	public String setInq(Model model, HttpSession session) {
		if(session.getAttribute("language").equals("ko")) { 
			if(session.getAttribute("userID") != null){
				return "redirect:/inqLoginKo.do";
			}else {
				return "redirect:/inqKo.do";
			}
		}else {
			if(session.getAttribute("userID") != null) {
				return "redirect:/inqLoginEn.do";
			}else {
				return "redirect:/inqEn.do";
			}
		}
	}
	
	@RequestMapping(value = "/inqKo.do") // 비회원 한국어 문의하기 페이지
	public String goInqKo(Model model, HttpSession session) {
		return "/contactUs/inquiries-ko.html";
	}
	
	@RequestMapping(value = "/inqLoginKo.do") // 회원 한국어 문의하기 페이지
	public String goInqLoginKo(Model model, HttpSession session) {
		return "/contactUs/inquiries-loginKo.html";
	}
	
	@RequestMapping(value = "/inqEn.do") // 비회원 영어 문의하기 페이지
	public String goInqEn(Model model, HttpSession session) {
		return "/contactUs/inquiries-en.html";
	}
	
	@RequestMapping(value = "/inqLoginEn.do") // 회원 영어 문의하기 페이지
	public String goInqLoginEn(Model model, HttpSession session) {
		return "/contactUs/inquiries-loginEn.html";
	}
}