package com.shilla.booking.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shilla.booking.dao.BookingDAO;
import com.shilla.booking.dao.RoomInfoDAO;
import com.shilla.booking.vo.BookingVO;
import com.shilla.booking.vo.RoomInfoVO;

@Service("bookingService")
public class BookingServiceImpl implements BookingService {	
	
	@Autowired
	private RoomInfoDAO rifDAO;
	
	@Autowired
	private BookingDAO bkDAO;
	
	@Override
	public List<RoomInfoVO> calendar(String date1, String sCount) {
		
		int count=Integer.parseInt(sCount);
		date1=date1.replace(" ", "");
		date1=date1.replace(".", "q");

		String[] dateArr=date1.split("q");
		String sYear=dateArr[0];
		String sMonth=dateArr[1];
		String sDate=dateArr[2];
		int intMonth=Integer.parseInt(sMonth);
		int intDate=Integer.parseInt(sDate);
		if(intMonth<10) {
			sMonth="0"+sMonth;
		}
		if(intDate<10) {
			sDate="0"+sDate;
		}
		String sFulldate=sYear+sMonth+sDate;
		List<RoomInfoVO> list = rifDAO.getCallenderInfo(sFulldate, count);
		for(RoomInfoVO vo : list) {
		    vo.setRdate(vo.getRdate().replace("-", ""));
		    vo.setRdate(vo.getRdate().replace(" 00:00:00", ""));
		}	
		return list;
	}

	@Override
	public int checkAvailability(String dateIn, String dateOut, String roomType) throws ParseException {
		
		dateIn = dateIn.replace("-", "");
		dateOut = dateOut.replace("-", "");

		List<RoomInfoVO> list = rifDAO.roomCheck(dateIn, dateOut);
		
		if(list==null) {
			return 0;
				
		}else {
			Date format1 = (Date) new SimpleDateFormat("yyyyMMdd").parse(dateIn);
			Date format2 = (Date) new SimpleDateFormat("yyyyMMdd").parse(dateOut);
			long days = (format2.getTime() - format1.getTime())/(1000*24*60*60);
			long count=0;
			int price=0;
			for(RoomInfoVO vo : list) {
			    switch(roomType) {
			    case "standard":
			    	if(vo.getStandardRoom()>0) {
			    		count++;
			    		price+=vo.getStandardPrice();
			    	}
			    	break;
			    case "suite":
			    	if(vo.getSuiteRoom()>0) {
			    		count++;
			    		price+=vo.getSuitePrice();
			    	}
			    	break;
			    case "executive":
			    	if(vo.getExecutiveRoom()>0) {
			    		count++;
			    		price+=vo.getExecutivePrice();
			    	}
			    	break;
			    case "korean":
			    	if(vo.getKoreanRoom()>0) {
			    		count++;
			    		price+=vo.getKoreanPrice();
			    	}
			    	break;
			    	
			    	default:
			    		break;
			    }			    
			}			
			if(days==count) {
				return price;
			}else {
				return 0;
			}
		}						
	}

	@Override
	public void insertReservation(String payNumber, String userID, String userName, String userTel, String checkIn,
			String checkOut, String schedule, int payAmount, String roomType) {
		
		bkDAO.insert(payNumber, userID, userName, userTel, checkIn,
			 checkOut, schedule, payAmount, roomType);
	}

	@Override
	public void reserveRoom(String dateIn, String dateOut, String roomType) {
		switch(roomType) {
	    case "standard":
	    	rifDAO.standardReserve(dateIn, dateOut);
	    	break;
	    case "suite":
	    	rifDAO.suiteReserve(dateIn, dateOut);
	    	break;
	    case "executive":
	    	rifDAO.executiveReserve(dateIn, dateOut);
	    	break;
	    case "korean":
	    	rifDAO.koreanReserve(dateIn, dateOut);
	    	break;
	    	default:
	    		break;
	    }				
	}

	@Override
	public List<BookingVO> getBookingMem(String userID) {
		return bkDAO.getBookingMem(userID);
	}

	@Override
	public List<BookingVO> getBookingNonmem(String userName, String userTel) {
		return bkDAO.getBookingNonmem(userName, userTel);
	}

	@Override
	public List<BookingVO> getAllBooking() {
		return bkDAO.getAllBooking();
	}					
}
