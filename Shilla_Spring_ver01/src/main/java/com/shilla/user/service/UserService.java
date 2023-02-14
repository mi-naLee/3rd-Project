package com.shilla.user.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shilla.user.vo.UserVO;

public interface UserService {

	UserVO checkUsesrID(String userID);

	String userResgister(HttpServletRequest request);

	String loginAction(UserVO userVO, HttpSession session, HttpServletResponse response) throws IOException;

	String UserDeleteAction(HttpSession session, UserVO userVO, HttpServletRequest request) throws IOException;

	void UserUpdateAction(UserVO userVO, HttpServletRequest request, HttpSession session) throws IOException;

	UserVO realgetUser(UserVO userVO, HttpServletRequest request, HttpSession session);

}
