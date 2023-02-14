package com.shilla.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shilla.booking.service.BookingService;
import com.shilla.booking.vo.BookingVO;
import com.shilla.booking.vo.RoomInfoVO;

@RestController
public class restBookingController {	
	
	@Resource(name="bookingService")
	private BookingService bookingService;
	
	@RequestMapping(value="/restBooking/calendar.do")
	public List<RoomInfoVO> calendar(HttpServletRequest request) {
		return bookingService.calendar(request.getParameter("sDate"),request.getParameter("count"));
	}
		
	@RequestMapping(value="/restBooking/insertReservation.do")
	public HashMap<String, Object> insertReservation(HttpServletRequest request) {
		String payNumber=request.getParameter("payNumber");
		String userID=request.getParameter("userID");
		String userName=request.getParameter("userName");
		String userTel=request.getParameter("userTel");
		String checkIn=request.getParameter("checkIn");
		String checkOut=request.getParameter("checkOut");
		String schedule=request.getParameter("schedule");
		int payAmount=Integer.parseInt(request.getParameter("payAmount"));
		String roomType=request.getParameter("roomType");
		checkIn = checkIn.replace("-", "");
		checkOut = checkOut.replace("-", "");
								
		bookingService.insertReservation(payNumber, userID, userName, userTel, checkIn, checkOut, schedule, payAmount, roomType);
		bookingService.reserveRoom(checkIn, checkOut, roomType);
		HashMap<String,Object> map = new HashMap<String,Object>();
		  
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping(value="/restBooking/reservation.do")
	public List<BookingVO> reservation(HttpServletRequest request) {
		if(request.getParameter("userTel").equals("null")) {
			return bookingService.getBookingMem(request.getParameter("userID"));
		}else {
			return bookingService.getBookingNonmem(request.getParameter("userName"),request.getParameter("userTel"));
		}
	}
	
	@RequestMapping(value="/restBooking/reservationAdmin.do")
	public List<BookingVO> reservationAdmin(HttpServletRequest request) {
		return bookingService.getAllBooking();
	}
}
