package com.shilla.event.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.shilla.event.criteria.Criteria;
import com.shilla.event.vo.EventVO;

public interface EventService {
	public ArrayList<EventVO> getAllEvent( Criteria cir ) throws ClassNotFoundException, SQLException;

	public EventVO getEvent(EventVO eventVO);

	public int getTotalCount(Criteria cri);

	public void EventInsert(EventVO eventVO, HttpServletRequest request) throws IOException;

	public void EventDelete(EventVO eventVO);

	public EventVO getEventForUpdate(EventVO eventVO);

	public void EventUpdate(EventVO eventVO, HttpServletRequest request) throws IOException;
}
