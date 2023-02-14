package com.shilla.event.comment.service;

import java.util.ArrayList;

import com.shilla.event.comment.vo.EventCommentVO;
import com.shilla.event.vo.EventVO;

public interface EventCommentService {

	public void insertComment(EventVO eventVO, EventCommentVO eventCommentVO);

	public ArrayList<EventCommentVO> getEventComment(EventVO evnetVO);

	public void insertCommentComment(EventVO eventVO, EventCommentVO eventCommentVO);

	public void deleteCommentParent(EventCommentVO eventCommentVO);

	public void deleteComment(EventCommentVO eventCommentVO);

	public void deleteAllEventComment(EventVO eventVO);

}
