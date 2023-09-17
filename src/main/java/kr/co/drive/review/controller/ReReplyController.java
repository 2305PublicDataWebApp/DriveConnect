package kr.co.drive.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import kr.co.drive.review.domain.ReReply;
import kr.co.drive.review.service.ReReplyService;

@Controller
public class ReReplyController {
	
	@Autowired
	private ReReplyService rrService;
	
	@RequestMapping(value="/readd", method=RequestMethod.POST)
	public ModelAndView insertReReply(ModelAndView mv
			, @ModelAttribute ReReply rreply
			, HttpSession session) {
		String url ="";
		try {
			String rereplyWriter = (String)session.getAttribute("userId");
			rreply.setUserId(rereplyWriter);
			int result = rrService.insertReply(rreply);
			url = "/review/redetail?rNo="+rreply.getRrNo();
			if(result > 0) {
				mv.setViewName("redirect:"+url);
			} else {
				mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
				mv.addObject("error", "댓글 등록 실패");
				mv.addObject("url", url);
				mv.setViewName("common/serviceFailed");
				
			}
		} catch (Exception e) {
			mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ModelAndView updateReply(ModelAndView mv
			, @ModelAttribute ReReply rreply
			, HttpSession session) {
		String url ="";
		try {
			String rereplyWriter = (String)session.getAttribute("userId");
			if(rereplyWriter != null && !rereplyWriter.equals("")) {
				rreply.setUserId(rereplyWriter);
				int result = rrService.updateReply(rreply);
				url= "/review/detail?No="+rreply.getRrNo();
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				}
			} else {
				mv.addObject("msg", "로그인이 되지 않았습니다.");
				mv.addObject("error", "로그인 정보확인 실패");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의 바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/serviceFailed");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public ModelAndView deleteReply(ModelAndView mv
			, @ModelAttribute ReReply rreply
			, HttpSession session ) {
		String url = "";
		try {
			String userId = (String)session.getAttribute("userId");
			String rereplyWriter = rreply.getUserId();
			url = "/review/redetail?rNo="+rreply.getRrNo();
			if(rereplyWriter != null && rereplyWriter.equals(userId)) {
				int result = rrService.deleteReply(rreply);
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				} else {
					mv.addObject("msg", "댓글 삭제가 완료되지 않았습니다.");
					mv.addObject("error", "댓글 삭제 실패");
					mv.addObject("url", url);
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "자신의 댓글만 삭제할 수 있습니다.");
				mv.addObject("error", "댓글 삭제 불가");
				mv.addObject("url", url);
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의 바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}

}
