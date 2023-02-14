package com.shilla.user.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shilla.user.dao.UserDAO;
import com.shilla.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO udao;

	@Override
	public UserVO checkUsesrID(String userID) {
		String CuserID = userID;
		return udao.registerCheck(CuserID);
	}

	@Override
	public String userResgister(HttpServletRequest request) {
		String userID = request.getParameter("userID");
		String userPassword1 = request.getParameter("userPassword1");
		String userPassword2 = request.getParameter("userPassword2");
		String userName = request.getParameter("userName");
		String userAge1 = request.getParameter("userAge");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		String userTel = request.getParameter("userTel");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		UserVO userVO = new UserVO(userID, userPassword1, userName, userAge, userGender, userEmail, userTel);

		HttpSession session = request.getSession();
		String str = (String) session.getAttribute("language");
		if (userID == null || userID.equals("") || userPassword1 == null || userPassword1.equals("")
				|| userPassword2 == null || userPassword2.equals("") || userName == null || userName.equals("")
				|| userAge1 == null || userAge1.equals("") || userTel == null || userTel.equals("")
				|| userGender == null || userGender.equals("") || userEmail == null || userEmail.equals("")) {
			if (str.equals("en")) {
				request.getSession().setAttribute("messageType", "Error Message");
				request.getSession().setAttribute("messageContent", "Please Enter all details");
				return "/user/join";
			} else if (str.equals("ko")) {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
				return "/user/join";
			}
		}
		if (!userPassword1.equals(userPassword2)) {
			if (str.equals("en")) {
				System.out.println("영어로");
				request.getSession().setAttribute("messageType", "Error Message");
				request.getSession().setAttribute("messageContent", " Invalid password. Please try again.");
				return "/user/join";
			} else if (str.equals("ko")) {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
				return "/user/join";
			}
		}
		int result = udao.userinfo(userVO);
		if (result == 1) {
			if (str.equals("en")) {
				System.out.println("영어로");
				request.getSession().setAttribute("messageType", "Success Message");
				request.getSession().setAttribute("messageContent", " Join Complete");
				return "/user/login";
			} else if (str.equals("ko")) {
				request.getSession().setAttribute("messageType", "성공 메세지");
				request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
				return "user/login";
			}
		} else {
			if (str.equals("en")) {
				System.out.println("영어로");
				request.getSession().setAttribute("messageType", "Error Message");
				request.getSession().setAttribute("messageContent", "Duplicate Member");
				return "/user/join";
			} else if (str.equals("ko")) {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
				return "/user/join";
			}
		}
		return "/user/join";
	}

	@Override
	public String loginAction(UserVO userVO, HttpSession session, HttpServletResponse response) throws IOException {
		String userID = null;
		String lang = (String) session.getAttribute("language");
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		int result = udao.login(userVO).size();

		if (result == 1) {
			userVO = udao.getUser(userVO.getUserID());
			session.setAttribute("userID", userVO.getUserID());
			session.setAttribute("userName", userVO.getUserName());
			session.setAttribute("userTel", userVO.getUserTel());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			if (lang.equals("en")) {
				script.println("alert('Successful Login')");
			} else if (lang.equals("ko")) {
				script.println("alert('로그인에 성공하였습니다.')");
			}
			script.println("location.href = '../index.jsp'");
			script.println("</script>");
			System.out.println("로그인 성공");
		} else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			if (lang.equals("en")) {
				script.println("alert('Invalid password. Please try again.')");
			} else if (lang.equals("ko")) {
				script.println("alert('비밀번호가 틀립니다.')");
			}
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			System.out.println("로그인 실패");
		}

		return null;
	}

	@Override
	public String UserDeleteAction(HttpSession session, UserVO userVO, HttpServletRequest request) throws IOException {
		String userID = (String) session.getAttribute("userID");
		userVO.setUserID(userID);

		int check = udao.login(userVO).size();
		if (check == 1) {
			udao.deleteUser(userID);
			session.invalidate();

		} else {

		}
		return "redirect:/";
	}

	@Override
	public void UserUpdateAction(UserVO userVO, HttpServletRequest request, HttpSession session) throws IOException {
		String userID = (String) session.getAttribute("userID");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		String userTel = request.getParameter("userTel");
		String userGender = request.getParameter("gender");
		String userEmail = request.getParameter("userEmail");

		UserVO user = new UserVO();
		user.setUserID(userID);
		user.setUserPassword(userPassword);
		user.setUserName(userName);
		user.setUserAge(userAge);
		user.setUserTel(userTel);
		user.setUserGender(userGender);
		user.setUserEmail(userEmail);

		boolean check = udao.updateUser(user);
		if (check) {
			session.setAttribute("userID", user.getUserID());

		}

	}

	@Override
	public UserVO realgetUser(UserVO userVO, HttpServletRequest request, HttpSession session) {
		String userID = (String) session.getAttribute("userID");
		userVO.setUserID(userID);
		return udao.realGetUser(userVO);
	}
	
}
