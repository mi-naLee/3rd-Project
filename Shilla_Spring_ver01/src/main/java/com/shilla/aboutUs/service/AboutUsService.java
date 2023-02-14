package com.shilla.aboutUs.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.shilla.aboutUs.vo.AboutUsVO;

public interface AboutUsService {
	
	public AboutUsVO getAboutUs() throws SQLException, ClassNotFoundException;
	
	public void UpdateAboutUs(AboutUsVO aboutUsVO, HttpServletRequest request) throws IOException, SQLException, ClassNotFoundException;

}
