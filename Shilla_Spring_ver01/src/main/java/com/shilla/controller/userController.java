package com.shilla.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shilla.user.service.UserService;
import com.shilla.user.vo.UserVO;

@Controller
public class userController {

	@Resource(name = "userService")
	private UserService userservice;

	@RequestMapping(value = "/user/login.do")
	public String gologin() {
		return "/user/login.jsp";
	}

	@RequestMapping(value = "/user/join.do")
	public String gojoin() {
		return "/user/join.jsp";
	}

	/*@RequestMapping(value = "/user/userInfo.do")
	public String gouserinfo() {
		return "/user/userInfo.jsp";
	}*/
	
	/*@RequestMapping(value = "/user/userUpdate.do")
	public String gouserupdate() {
		return "/user/userUpdate.jsp";
	}*/
	
	@RequestMapping(value = "/user/userDelete.do")
	public String gouserdelete() {
		return "/user/userDelete.jsp";
	}
	
	@RequestMapping(value = "/user/userLogoutAction.do")
	public String gouserlogout() {
		return "/user/userLogout.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value = "/user/UserRegisterCheckServlet.do")
	public String idcheck(String userID) {
//		System.out.println(userID);
//		System.out.println("확인");
		UserVO userVO = userservice.checkUsesrID(userID);
		if (userVO == null) {
//			System.out.println("존재 안함!");
			return "0";
		} else {
//			System.out.println("존재!");
		}
		return "1";
	}
	
	@RequestMapping(value = "/user/userRegister.do")
	public String gojoinaction(HttpServletRequest request) {
		String gopage = "";
		gopage = userservice.userResgister(request);
		System.out.println("문제없엉");
		return gopage+".jsp";
		// return "redirect:/"
	}
	
	@RequestMapping(value = "/user/userLoginAction.do")
	public String gologinAction(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		userservice.loginAction(userVO, session, response);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/user/userDeleteAction.do")
	public String goDelete(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		userservice.UserDeleteAction(session, userVO, request);
		return "redirect:/";
	}

	@RequestMapping(value = "/user/userUpdateAction.do")
	public String goUpdate(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		userservice.UserUpdateAction(userVO, request, session);
		return "redirect:/";
	}

	@RequestMapping(value = "/user/userInfo.do")
	public String realgetUser(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");
		System.out.println(userVO);
		userVO.setUserID(userID);
		model.addAttribute("userVO", userservice.realgetUser(userVO, request, session));

		return "/user/userInfo.jsp";
	}
	
	@RequestMapping(value = "/user/userUpdate.do")
	public String goUserUpdate(@ModelAttribute("userVO") UserVO userVO, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");
		System.out.println(userVO);
		userVO.setUserID(userID);
		model.addAttribute("userVO", userservice.realgetUser(userVO, request, session));

		return "/user/userUpdate.jsp";
	}
}
