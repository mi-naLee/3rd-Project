package com.shilla.event.comment.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shilla.event.comment.dao.EventCommentDAO;
import com.shilla.event.comment.vo.EventCommentVO;
import com.shilla.event.vo.EventVO;

@Service("eventCommentService")
public class EventCommentServiceImpl implements EventCommentService {

	@Autowired
	private EventCommentDAO ecdao;
	
	@Override
	public ArrayList<EventCommentVO> getEventComment(EventVO evnetVO){
		
		return ecdao.getEventComment(evnetVO);
		
	}

	@Override
	public void insertComment(EventVO eventVO, EventCommentVO eventCommentVO){
		// TODO Auto-generated method stub
		
		eventCommentVO.setEvent_id(eventVO.getEvent_id());
		
		if(eventCommentVO.getComment_writer_img() == null) {
			eventCommentVO.setComment_writer_img("../resources\\img\\blog\\img\\icon_default_person.png");
		}
		
		ecdao.insertComment(eventCommentVO);
		
	}

	@Override
	public void insertCommentComment(EventVO eventVO, EventCommentVO eventCommentVO) {
		
		eventCommentVO.setEvent_id(eventVO.getEvent_id());
		
		if(eventCommentVO.getComment_writer_img() == null) {
			eventCommentVO.setComment_writer_img("../resources\\img\\blog\\img\\icon_default_person.png");
		}
		
		ecdao.insertCommentComment(eventCommentVO);
		
	}
	
	@Override
	public void deleteCommentParent(EventCommentVO eventCommentVO){

		ecdao.deleteCommentParent(eventCommentVO);
		
	}

	@Override
	public void deleteComment(EventCommentVO eventCommentVO){

		ecdao.deleteComment(eventCommentVO);
	}

	@Override
	public void deleteAllEventComment(EventVO eventVO) {
		
		ecdao.deleteAllEventComment(eventVO);
		
	}

}
