package com.shilla.event.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shilla.event.criteria.Criteria;
import com.shilla.event.dao.EventDAO;
import com.shilla.event.vo.EventVO;

@Service("eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO edao;

	@Override
	public ArrayList<EventVO> getAllEvent(Criteria cri) throws ClassNotFoundException, SQLException {
			return edao.getAllEvent(cri);
	}

	@Override
	public int getTotalCount(Criteria cri){
		return edao.getTotalCount(cri);
	}

	@Override
	public void EventInsert(EventVO eventVO, HttpServletRequest request) throws IOException{
		
		String rPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(rPath);
		String LoadPath ="resources\\img\\blog\\img";
		String UploadPath_meta = rPath+LoadPath;
		System.out.println(UploadPath_meta);
		
		File f1 = new File(UploadPath_meta);
		
		if(!f1.exists()) {
			f1.mkdirs();
		}
		
		MultipartRequest mr = new MultipartRequest(request, UploadPath_meta, 10*1024*1024,"UTF-8", new DefaultFileRenamePolicy());
		
		String kategorieOnEvnet = mr.getParameter("kategorieOnEvnet");
		String title_name = mr.getParameter("title_name");
		String write_date = mr.getParameter("write_date");
		String writerOnEvnet = mr.getParameter("writerOnEvnet");
		String prologOnevnet = mr.getParameter("prologOnevnet");
		
		String img_title=null;
		if(mr.getFilesystemName("img_title") == null) {
			 img_title = ("../resources/img/defaultIMG/t_default.jpg").replace("\\", "/");
		}else {
			 img_title = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_title")).replace("\\", "/");
		}
		
		String img_out=null;
		
		if(mr.getFilesystemName("img_out") == null) {
			img_out = ("../resources/img/defaultIMG/Ot_default.jpg").replace("\\", "/");
		}else{
			img_out = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_out")).replace("\\", "/");
		}
		
		String imgOne = "../"+LoadPath+"\\"+mr.getFilesystemName("imgOne");
		String imgTwo = "../"+LoadPath+"\\"+mr.getFilesystemName("imgTwo");	
		String imgThree = "../"+LoadPath+"\\"+mr.getFilesystemName("imgThree");
		
		String subTitleOnEvnet = mr.getParameter("subTitleOnEvnet");
		String textOnsubTitle = mr.getParameter("textOnsubTitle");
		
		eventVO.setKategorieOnEvnet(kategorieOnEvnet);
		eventVO.setTitle_name(title_name);
		eventVO.setWrite_date(write_date);
		eventVO.setWriterOnEvnet(writerOnEvnet);
		eventVO.setPrologOnevnet(prologOnevnet);
		
		eventVO.setImg_title(img_title);
		eventVO.setImg_out(img_out);
		eventVO.setImgOne(imgOne);
		eventVO.setImgTwo(imgTwo);
		eventVO.setImgThree(imgThree);
		
		eventVO.setSubTitleOnEvnet(subTitleOnEvnet);
		eventVO.setTextOnsubTitle(textOnsubTitle);
		
		edao.EventInsert(eventVO);
	}

	@Override
	public EventVO getEvent(EventVO eventVO){
		return edao.getEvent(eventVO);
	}

	@Override
	public void EventDelete(EventVO eventVO){
		edao.EventDelete(eventVO);
	}

	@Override
	public EventVO getEventForUpdate(EventVO eventVO){
		
		eventVO = edao.getEventForUpdate(eventVO); 
		
		if(eventVO.getImgOne().contains("null")) {
			eventVO.setImgOne("../resources\\img\\uploadIMG\\upLoad.jpg");
		}
		if(eventVO.getImgTwo().contains("null")) {
			eventVO.setImgTwo("../resources\\img\\uploadIMG\\upLoad.jpg");
		}
		if(eventVO.getImgThree().contains("null")) {
			eventVO.setImgThree("../resources\\img\\uploadIMG\\upLoad.jpg");
		}
		return eventVO;
	}

	@Override
	public void EventUpdate(EventVO eventVO, HttpServletRequest request) throws IOException {
		
		String rPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(rPath);
		String LoadPath ="resources\\img\\blog\\img";
		String UploadPath_meta = rPath+LoadPath;
		System.out.println(UploadPath_meta);
		
		File f1 = new File(UploadPath_meta);
		
		if(!f1.exists()) {
			f1.mkdirs();
		}
		
		MultipartRequest mr = new MultipartRequest(request, UploadPath_meta, 10*1024*1024,"UTF-8", new DefaultFileRenamePolicy());
		
		int event_id = Integer.parseInt(mr.getParameter("event_id"));
		String kategorieOnEvnet = mr.getParameter("kategorieOnEvnet");
		String title_name = mr.getParameter("title_name");
		String write_date = mr.getParameter("write_date");
		String writerOnEvnet = mr.getParameter("writerOnEvnet");
		String prologOnevnet = mr.getParameter("prologOnevnet");
		
		String img_title=null;
		if(mr.getFilesystemName("img_title") == null) {
			 img_title = ("../resources/img/defaultIMG/t_default.jpg").replace("\\", "/");
		}else {
			 img_title = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_title")).replace("\\", "/");
		}
		
		String img_out=null;
		if(mr.getFilesystemName("img_out") == null) {
			img_out = ("../resources/img/defaultIMG/Ot_default.jpg").replace("\\", "/");
		}else{
			img_out = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_out")).replace("\\", "/");
		}
		String imgOne = "../"+LoadPath+"\\"+mr.getFilesystemName("imgOne");
		String imgTwo = "../"+LoadPath+"\\"+mr.getFilesystemName("imgTwo");	
		String imgThree = "../"+LoadPath+"\\"+mr.getFilesystemName("imgThree");
		
		String subTitleOnEvnet = mr.getParameter("subTitleOnEvnet");
		String textOnsubTitle = mr.getParameter("textOnsubTitle");
		
		eventVO.setEvent_id(event_id);
		eventVO.setKategorieOnEvnet(kategorieOnEvnet);
		eventVO.setTitle_name(title_name);
		eventVO.setWrite_date(write_date);
		eventVO.setWriterOnEvnet(writerOnEvnet);
		eventVO.setPrologOnevnet(prologOnevnet);
		
		eventVO.setImg_title(img_title);
		eventVO.setImg_out(img_out);
		eventVO.setImgOne(imgOne);
		eventVO.setImgTwo(imgTwo);
		eventVO.setImgThree(imgThree);
		
		eventVO.setSubTitleOnEvnet(subTitleOnEvnet);
		eventVO.setTextOnsubTitle(textOnsubTitle);
		
		//System.out.println(eventVO.toString());
		
		edao.EventUpdate(eventVO);
	}

}
