package com.shilla.aboutUs.benefits.dao;

import java.util.ArrayList;

import com.shilla.aboutUs.benefits.vo.AboutUsBenefitsVO;

public interface AboutUsBenefitsDAO {
	
	ArrayList<AboutUsBenefitsVO> getBenefits();
	
	void UpdateBenefits(AboutUsBenefitsVO aboutUsBenefitsVO);

}
