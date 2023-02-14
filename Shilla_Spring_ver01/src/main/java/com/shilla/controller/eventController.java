package com.shilla.controller;


import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shilla.event.comment.service.EventCommentService;
import com.shilla.event.comment.vo.EventCommentVO;
import com.shilla.event.criteria.Criteria;
import com.shilla.event.pageDTO.PageDTO;
import com.shilla.event.service.EventService;
import com.shilla.event.vo.EventVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class eventController{
	
	@Resource(name = "eventService")
	private EventService eventService;
	
	@Resource(name = "eventCommentService")
	private EventCommentService eventCommentService;
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	@RequestMapping(value = "/event/getAllEvent.do")
	public String getAllEvent(Criteria cri, Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		model.addAttribute("eventlist", eventService.getAllEvent(cri)) ;
		int total = eventService.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		String goPage = "";
		if(request.getSession().getAttribute("userID") == null) {
			goPage = "/event/event.jsp";
		}else if(request.getSession().getAttribute("userID").equals("admin")) {
			goPage="/event/eventAdmin.jsp";
		}else {
			goPage = "/event/event.jsp";
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "/event/getEvent.do")
	public String getEvent(@ModelAttribute("eventVO")EventVO eventVO, Model model) throws ClassNotFoundException, SQLException  {
		
		model.addAttribute("vo1",eventService.getEvent(eventVO));
		
		model.addAttribute("commentlist",eventCommentService.getEventComment(eventVO));
		
		return "event/event-details.jsp";
	}
	
	@RequestMapping(value = "/event/eventAdminInsertForm.do")
	public String eventInsertform(){
		return "event/eventAdminInsertForm.jsp";
	}
	
	@RequestMapping(value = "/event/eventInsert.do")
	public String eventInsert(@ModelAttribute("eventVO")EventVO eventVO, Model model, HttpServletRequest request) throws IOException {
		
		eventService.EventInsert(eventVO, request);
		
		return "redirect:/event/getAllEvent.do";
	}
	
	@RequestMapping(value = "/event/eventDelete.do")
	public String eventDelete(@ModelAttribute("eventVO")EventVO eventVO, Model model) {
		
		eventCommentService.deleteAllEventComment(eventVO);
		
		eventService.EventDelete(eventVO);
		
		return "redirect:/event/getAllEvent.do";
	}
	
	@RequestMapping(value = "/event/eventUpdateFrom.do")
	public String eventUpdateform(@ModelAttribute("eventVO")EventVO eventVO, Model model) {
		
		model.addAttribute("vo1",eventService.getEventForUpdate(eventVO));
		
		return "event/eventAdminUpdateForm.jsp";
	}
	
	@RequestMapping(value = "/event/eventUpdate.do")
	public String eventUpdate(@ModelAttribute("eventVO")EventVO eventVO, Model model, HttpServletRequest request) throws IOException{
		
		eventService.EventUpdate(eventVO, request);
		
		return "redirect:/event/getAllEvent.do";
	}
	
	//============ comment C D
	@RequestMapping(value = "/event/eventCommentInsert.do")
	public String eventCommentInsert(@ModelAttribute("eventVO")EventVO eventVO,@ModelAttribute("eventCommentVO")EventCommentVO eventCommentVO,Model model){
		
		eventCommentService.insertComment(eventVO,eventCommentVO);
		
		model.addAttribute("title_name", eventVO.getTitle_name());
		model.addAttribute("event_id", eventVO.getEvent_id());
		
		return "redirect:/event/getEvent.do";
	}
	
	@RequestMapping(value ="/event/eventCommentCommentInsert.do")
	public String eventCommentCommentInsert(@ModelAttribute("eventVO")EventVO eventVO,@ModelAttribute("eventCommentVO")EventCommentVO eventCommentVO,Model model) {
		
		eventCommentService.insertCommentComment(eventVO,eventCommentVO);
		
		model.addAttribute("title_name", eventVO.getTitle_name());
		model.addAttribute("event_id", eventVO.getEvent_id());
		
		return "redirect:/event/getEvent.do";
	}

	@RequestMapping(value = "/event/deleteCommentParent.do")
	public String eventCommentDeleteParent(@ModelAttribute("eventVO")EventVO eventVO,@ModelAttribute("eventCommentVO")EventCommentVO eventCommentVO,Model model){
	
		eventCommentService.deleteCommentParent(eventCommentVO);
		
		model.addAttribute("title_name", eventVO.getTitle_name());
		model.addAttribute("event_id", eventVO.getEvent_id());
		
		return "redirect:/event/getEvent.do";
	}
	
	@RequestMapping(value = "/event/deleteComment.do")
	public String eventCommentDelete(@ModelAttribute("eventVO")EventVO eventVO,@ModelAttribute("eventCommentVO")EventCommentVO eventCommentVO,Model model){
		
		eventCommentService.deleteComment(eventCommentVO);
		
		model.addAttribute("title_name", eventVO.getTitle_name());
		model.addAttribute("event_id", eventVO.getEvent_id());
		
		return "redirect:/event/getEvent.do";
	}
}
