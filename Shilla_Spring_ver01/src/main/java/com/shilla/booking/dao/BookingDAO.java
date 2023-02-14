package com.shilla.booking.dao;

import java.util.List;

import com.shilla.booking.vo.BookingVO;


public interface BookingDAO {
	public abstract void insert(String payNumber, String userID, String userName, String userTel, String checkIn,
			String checkOut, String schedule, int payAmount, String roomType);
	
	public abstract List<BookingVO> getBookingMem(String userID);
	
	public abstract List<BookingVO> getBookingNonmem(String userName, String userTel);
	
	public abstract List<BookingVO> getAllBooking();
}
