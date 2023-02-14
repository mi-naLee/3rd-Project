package com.shilla.aboutUs.benefits.service;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shilla.aboutUs.benefits.dao.AboutUsBenefitsDAO;
import com.shilla.aboutUs.benefits.vo.AboutUsBenefitsVO;

@Service("aboutUsBenefitsService")
public class AboutUsBenefitsServiceImpl implements AboutUsBenefitsService{
	
	@Autowired
	private AboutUsBenefitsDAO aboutBenefitsDAO;

	@Override
	public ArrayList<AboutUsBenefitsVO> getBenefits() throws ClassNotFoundException, SQLException {
		return aboutBenefitsDAO.getBenefits();
	}

	@Override
	public void UpdateBenefits(AboutUsBenefitsVO aboutUsBenefitsVO, HttpServletRequest request)
			throws ClassNotFoundException, SQLException {
		aboutBenefitsDAO.UpdateBenefits(aboutUsBenefitsVO);
	}
	
}
