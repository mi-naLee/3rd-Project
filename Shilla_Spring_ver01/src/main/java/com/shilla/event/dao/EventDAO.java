package com.shilla.event.dao;

import java.util.ArrayList;

import com.shilla.event.criteria.Criteria;
import com.shilla.event.vo.EventVO;

public interface EventDAO {

	
	public ArrayList<EventVO> getAllEvent(Criteria cri);

	public EventVO getEvent(EventVO eventVO);

	public int getTotalCount(Criteria cri);

	public void EventInsert(EventVO eventVO);

	public void EventDelete(EventVO eventVO);

	public EventVO getEventForUpdate(EventVO eventVO);

	public void EventUpdate(EventVO eventVO);

}
