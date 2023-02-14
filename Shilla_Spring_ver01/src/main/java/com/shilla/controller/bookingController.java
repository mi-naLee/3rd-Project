package com.shilla.controller;

import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shilla.booking.service.BookingService;

@Controller
public class bookingController {

	@Resource(name="bookingService")
	private BookingService bookingService;
	
	@RequestMapping(value="/booking/booking.do")
	public String booking() {
		return "booking/booking.jsp";
	}
	
	@RequestMapping(value="/booking/checkAvailability.do")
	public String checkAvailability(HttpServletRequest request) throws ParseException {
		String dateIn = request.getParameter("date-in");
		String dateOut = request.getParameter("date-out");
		String roomType = request.getParameter("room-type");
		int price = bookingService.checkAvailability(dateIn, dateOut, roomType);
		if(price!=0) {
			request.setAttribute("price",price);
			return "booking/roomChecked.jsp";
		}else {
			return "booking/noRoom.jsp";
		}		
	}
	
	@RequestMapping(value="/booking/reserveRoom.do")
	public String reserveRoom(HttpServletRequest request) throws ParseException {
		String dateIn = request.getParameter("date-in");
		String dateOut = request.getParameter("date-out");
		String roomType = request.getParameter("room-type");
				
		int check = bookingService.checkAvailability(dateIn, dateOut, roomType);
		if(check!=0) {
			
			return "booking/payAction.jsp";
		}else {
			return "booking/noRoom.jsp";
		}		
	}
	
	@RequestMapping(value="/booking/payNonmember.do")
	public String payNonmember() {
		return "booking/payNonmember.jsp";
	}
		
	@RequestMapping(value="/booking/payCompleted.do")
	public String payCompleted() {
		return "booking/payCompleted.jsp";
	}
	
	@RequestMapping(value="/booking/resevationView.do")
	public String resevationView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("userID")==null){
			return "booking/reservationNonmember.jsp";
		}else if(session.getAttribute("userID").equals("admin")){
			return "booking/reservationViewAdmin.jsp";
		}else{
			return "booking/reservationView.jsp";
		}
	}
	
	@RequestMapping(value="/booking/reservationNonmember.do")
	public String reservationNonmember() {
		return "booking/reservationView.jsp";
	}
	
}
