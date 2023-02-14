package com.shilla.aboutUs.dao;

import com.shilla.aboutUs.vo.AboutUsVO;

public interface AboutUsDAO {
	
	AboutUsVO getAboutUs();
	
	void Update(AboutUsVO aboutUsVO);
	
}
