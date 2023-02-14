package com.shilla.booking.dao;

import java.util.List;



import com.shilla.booking.vo.RoomInfoVO;


public interface RoomInfoDAO {
	public abstract List<RoomInfoVO> getCallenderInfo(String rdate,int n);
	
	public abstract List<RoomInfoVO> roomCheck(String dateIn, String dateOut);
	
	public abstract int getPrice();
	
	public abstract void standardReserve(String dateIn, String dateOut);
	
	public abstract void suiteReserve(String dateIn, String dateOut);
	
	public abstract void executiveReserve(String dateIn, String dateOut);
	
	public abstract void koreanReserve(String dateIn, String dateOut);
}
