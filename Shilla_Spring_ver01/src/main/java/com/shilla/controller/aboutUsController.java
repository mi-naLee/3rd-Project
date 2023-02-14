package com.shilla.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shilla.aboutUs.benefits.service.AboutUsBenefitsService;
import com.shilla.aboutUs.benefits.vo.AboutUsBenefitsVO;
import com.shilla.aboutUs.service.AboutUsService;
import com.shilla.aboutUs.vo.AboutUsVO;

@Controller
public class aboutUsController{
	
	@Resource(name = "aboutUsService")
	private AboutUsService aboutUsService;
	
	@Resource(name = "aboutUsBenefitsService")
	private AboutUsBenefitsService aboutUsBenefitsService;
	
	@RequestMapping(value = "/aboutUs/getAboutUs.do") // 일반 aboutUs 페이지
	public String getAboutUs(Model model, HttpSession session) throws ClassNotFoundException, SQLException {
		
		model.addAttribute("AUvo1", aboutUsService.getAboutUs());
		
		ArrayList<AboutUsBenefitsVO> aboutBenefitsList = aboutUsBenefitsService.getBenefits();
		model.addAttribute("AUBlist1",aboutBenefitsList);
		
		if(session.getAttribute("userID") == null) {
			return "/aboutUs/aboutUs.jsp";
		}else if(session.getAttribute("userID").equals("admin")) {
			return "/aboutUs/aboutUs-Admin.jsp";
		}else {
			return "/aboutUs/aboutUs.jsp";
		}
	}
	
	@RequestMapping(value = "/aboutUs/AboutUsUpdateFrom.do") // aboutUs-Admin.jsp에서 이동
	public String aboutUsUpdateFrom(Model model, HttpSession session) throws ClassNotFoundException, SQLException {
		
		model.addAttribute("AUvo1", aboutUsService.getAboutUs());
		model.addAttribute("AUBlist1", aboutUsBenefitsService.getBenefits());
		return "/aboutUs/aboutUs-AdminUpdateFrom.jsp";
	}
	
	@RequestMapping(value = "/aboutUs/AboutUsBenefitsUpdateFrom.do")
	public String aboutUsBenefitsUpdateFrom(Model model, HttpSession session) throws ClassNotFoundException, SQLException {
		model.addAttribute("AUvo1",aboutUsService.getAboutUs());
		
		ArrayList<AboutUsBenefitsVO> aboutBenefitsList = aboutUsBenefitsService.getBenefits();
		model.addAttribute("AUBlist1", aboutBenefitsList);
		return "/aboutUs/aboutUs-AdminBenefitsFrom.jsp";
	}
	
	// =================== update ======================
	// 1. aboutUs 내용 update
	@RequestMapping(value = "/aboutUs/aboutUsUpdate.do")
	public String aboutUsUpdate(@ModelAttribute("aboutUsVO")AboutUsVO aboutUsVO, Model model, HttpServletRequest request) throws ClassNotFoundException, IOException, SQLException {
		System.out.println("***aboutUsUpdate***");
		aboutUsService.UpdateAboutUs(aboutUsVO, request);
		return "redirect:/aboutUs/getAboutUs.do";
	}
	
	// 2. benefits 업데이트
	@RequestMapping(value = "/aboutUs/benefitsUpdate.do")
	public String aboutBenefitsUpdate
	(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		AboutUsBenefitsVO aboutUsBenefitsVO = new AboutUsBenefitsVO();
		
		for(int i=1; i<=5; i++) { // benefitsVO set + update 작업 반복
			aboutUsBenefitsVO.setBenefits(i);
			aboutUsBenefitsVO.setContext(request.getParameter("context"+i)); 
			// context1, context2....
			aboutUsBenefitsService.UpdateBenefits(aboutUsBenefitsVO, request);
		}
		return "redirect:/aboutUs/getAboutUs.do";
	}
	
	// =================== rooms ======================
	@RequestMapping(value = "/rooms/rooms.do")
	public String goRooms(Model model, HttpSession session) {
		// System.out.println("룸 페이지 이동");
		return "/aboutUs/rooms.jsp";
	}
	
	@RequestMapping(value = "/rooms/standard.do")
	public String goStandard(Model model, HttpSession session) {
		// System.out.println("스탠다드 룸");
		return "/aboutUs/room-standard.jsp";
	}
	
	@RequestMapping(value = "/rooms/suite.do")
	public String goSuite(Model model, HttpSession session) {
		// System.out.println("스위트 룸");
		return "/aboutUs/room-suite.jsp";
	}
	
	@RequestMapping(value = "/rooms/executive.do")
	public String goExecutive(Model model, HttpSession session) {
		// System.out.println("이그제큐티브 룸");
		return "/aboutUs/room-executive.jsp";
	}
	
	@RequestMapping(value = "/rooms/korean.do")
	public String goKorean(Model model, HttpSession session) {
		// System.out.println("코리안 룸");
		return "/aboutUs/room-korean.jsp";
	}
}