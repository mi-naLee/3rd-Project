package com.shilla.aboutUs.benefits.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.shilla.aboutUs.benefits.vo.AboutUsBenefitsVO;

public interface AboutUsBenefitsService {

	public ArrayList<AboutUsBenefitsVO> getBenefits() throws ClassNotFoundException, SQLException;

	public void UpdateBenefits(AboutUsBenefitsVO aboutUsBenefitsVO, HttpServletRequest request) throws ClassNotFoundException, SQLException;

}
