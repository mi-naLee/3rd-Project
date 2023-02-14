package com.shilla.event.comment.dao;

import java.util.ArrayList;

import com.shilla.event.comment.vo.EventCommentVO;
import com.shilla.event.vo.EventVO;

public interface EventCommentDAO {
	
	public void insertComment(EventCommentVO eventCommentVO);
	
	public void insertCommentComment(EventCommentVO eventCommentVO);

	public ArrayList<EventCommentVO> getEventComment(EventVO eventVO);

	public void deleteCommentParent(EventCommentVO eventCommentVO);
	
	public void deleteComment(EventCommentVO eventCommentVO);

	public void deleteAllEventComment(EventVO eventVO);
	
}
