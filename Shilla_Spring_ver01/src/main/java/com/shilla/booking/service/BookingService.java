package com.shilla.booking.service;



import java.text.ParseException;
import java.util.List;

import com.shilla.booking.vo.BookingVO;
import com.shilla.booking.vo.RoomInfoVO;


public interface BookingService {
	public abstract List<RoomInfoVO> calendar(String date, String n);
	
	public abstract int checkAvailability(String dateIn, String dateOut, String roomType) throws ParseException;
	
	public abstract void insertReservation(String payNumber, String userID, String userName, String userTel, String checkIn, String checkOut, String schedule, int payAmount, String roomType);

	public abstract void reserveRoom(String dateIn, String dateOut, String roomType);
	
	public abstract List<BookingVO> getBookingMem(String userID);
	
	public abstract List<BookingVO> getBookingNonmem(String userName, String userTel);
	
	public abstract List<BookingVO> getAllBooking();
}
