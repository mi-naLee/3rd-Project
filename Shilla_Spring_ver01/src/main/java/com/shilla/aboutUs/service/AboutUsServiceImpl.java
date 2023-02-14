package com.shilla.aboutUs.service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shilla.aboutUs.dao.AboutUsDAO;
import com.shilla.aboutUs.vo.AboutUsVO;

@Service("aboutUsService")
public class AboutUsServiceImpl implements AboutUsService {
	
	@Autowired
	private AboutUsDAO aboutDAO;

	@Override
	public AboutUsVO getAboutUs() throws SQLException, ClassNotFoundException {
		return aboutDAO.getAboutUs();
	}

	@Override
	public void UpdateAboutUs(AboutUsVO aboutUsVO, HttpServletRequest request) throws IOException {
		
		String rPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println("rPath : "+rPath);
		String LoadPath = "resources\\img\\about";
		String UploadPath_meta = rPath+LoadPath;
		System.out.println("resources가 붙은 경로 : "+UploadPath_meta);
		
		MultipartRequest mr 
		= new MultipartRequest(request, UploadPath_meta, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		String welcome_title = mr.getParameter("welcome_title");
		String welcome_context = mr.getParameter("welcome_context");		
		String img_one = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_one")).replace("\\", "/");
		String img_one_title = mr.getParameter("img_one_title");
		String img_two = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_two")).replace("\\", "/");
		String img_two_title = mr.getParameter("img_two_title");
		String img_three = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_three")).replace("\\", "/");
		String img_three_title = mr.getParameter("img_three_title");
		String video_title = mr.getParameter("video_title");
		String video_context = mr.getParameter("video_context");
		String video_href_address = mr.getParameter("video_href_address");
		String img_four = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_four")).replace("\\", "/");
		String img_four_title = mr.getParameter("img_four_title");
		String img_five = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_five")).replace("\\", "/");
		String img_five_title = mr.getParameter("img_five_title");
		String img_six = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_six")).replace("\\", "/");
		String img_six_title = mr.getParameter("img_six_title");
		String img_seven = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_seven")).replace("\\", "/");
		String img_seven_title = mr.getParameter("img_seven_title");
		
		aboutUsVO.setWelcome_title(welcome_title);
		aboutUsVO.setWelcome_context(welcome_context);
		aboutUsVO.setImg_one(img_one);
		aboutUsVO.setImg_one_title(img_one_title);
		aboutUsVO.setImg_two(img_two);
		aboutUsVO.setImg_two_title(img_two_title);
		aboutUsVO.setImg_three(img_three);
		aboutUsVO.setImg_three_title(img_three_title);
		aboutUsVO.setVideo_title(video_title);
		aboutUsVO.setVideo_context(video_context);
		aboutUsVO.setVideo_href_address(video_href_address);
		aboutUsVO.setImg_four(img_four);
		aboutUsVO.setImg_four_title(img_four_title);
		aboutUsVO.setImg_five(img_five);
		aboutUsVO.setImg_five_title(img_five_title);
		aboutUsVO.setImg_six(img_six);
		aboutUsVO.setImg_six_title(img_six_title);
		aboutUsVO.setImg_seven(img_seven);
		aboutUsVO.setImg_seven_title(img_seven_title);
		
		aboutDAO.Update(aboutUsVO);
	}
}
