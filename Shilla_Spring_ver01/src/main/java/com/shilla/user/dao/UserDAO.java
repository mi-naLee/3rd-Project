package com.shilla.user.dao;

import java.util.ArrayList;

import com.shilla.user.vo.UserVO;

public interface UserDAO {

	public ArrayList<UserVO> login(UserVO userVO);

	public UserVO registerCheck(String userID);

	public int userinfo(UserVO userVO);

	public UserVO getUser(String userID);

	public boolean updateUser(UserVO user);

	public boolean deleteUser(String userID);

	public UserVO realGetUser(UserVO userVO);



	

}
