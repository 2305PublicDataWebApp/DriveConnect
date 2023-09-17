package kr.co.drive.qna.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.drive.qna.domain.QReply;
import kr.co.drive.qna.service.QReplyService;

@Controller
public class QReplyController {

	@Autowired
	private QReplyService qrService;

	@RequestMapping(value="/qnaadd", method=RequestMethod.POST)
	public ModelAndView insertQReply(ModelAndView mv
			, @ModelAttribute QReply qreply
			, HttpSession session) {
		String url ="";
		try {
			String qreplyWriter = (String)session.getAttribute("userId");
			qreply.setUserId(qreplyWriter);
			int result = qrService.insertReply(qreply);
			url = "/qna/qnadetail?qNo="+qreply.getQnaReplyNo();
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
	@RequestMapping(value="/qnaupdate", method=RequestMethod.POST)
	public ModelAndView updateReply(ModelAndView mv
			, @ModelAttribute QReply qreply
			, HttpSession session) {
		String url ="";
		try {
			String qnareplyWriter = (String)session.getAttribute("userId");
			if(qnareplyWriter != null && !qnareplyWriter.equals("")) {
				qreply.setUserId(qnareplyWriter);
				int result = qrService.updateReply(qreply);
				url= "/qna/detail?No="+qreply.getQnaReplyNo();
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
	
	@RequestMapping(value="/qnadelete", method=RequestMethod.GET)
	public ModelAndView deleteReply(ModelAndView mv
			, @ModelAttribute QReply qreply
			, HttpSession session ) {
		String url = "";
		try {
			String userId = (String)session.getAttribute("userId");
			String qnareplyWriter = qreply.getUserId();
			url = "/qna/qnadetail?qNo="+qreply.getQnaReplyNo();
			if(qnareplyWriter != null && qnareplyWriter.equals(userId)) {
				int result = qrService.deleteReply(qreply);
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
