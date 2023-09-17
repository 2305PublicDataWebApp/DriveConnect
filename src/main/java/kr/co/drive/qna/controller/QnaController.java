package kr.co.drive.qna.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.drive.qna.domain.QReply;
import kr.co.drive.qna.domain.Qna;
import kr.co.drive.qna.service.QReplyService;
import kr.co.drive.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qService;
	@Autowired
	private QReplyService qrService;

	@RequestMapping(value="/qna/qnawrite", method=RequestMethod.GET)
	public ModelAndView showWriteForm(ModelAndView mv) {
		
		mv.setViewName("qna/qnawrite");
		return mv;
	}
	
	@RequestMapping(value="/qna/qnawrite", method=RequestMethod.POST)
	public ModelAndView qnaRegister(
			ModelAndView mv
			, @ModelAttribute Qna qna
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String userId = (String)session.getAttribute("userId");
			if(userId != null && !userId.equals("")) {
				qna.setUserId(userId);
				int result = qService.insertqna(qna);
				mv.setViewName("redirect:/qna/qnalist");
			} else {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.addObject("error", "로그인이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/qna/qnawrite");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	@RequestMapping(value="/qna/qnalist", method=RequestMethod.GET)
	public ModelAndView showQnaList(ModelAndView mv) {
		try {
			List<Qna> qList = qService.selectQnaList();
			if(!qList.isEmpty()) {
				mv.addObject("qList", qList).setViewName("qna/qnalist");
			} else {
				mv.addObject("msg", "게시글 전체 조회가 완료되지 않았습니다.");
				mv.addObject("error", "게시글 조회 실패");
				mv.addObject("url", "/qna/qnalist");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/qna/qnalist");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	@RequestMapping(value="/qna/qnadetail", method=RequestMethod.GET)
	public ModelAndView showqnaDetail(ModelAndView mv
			, @RequestParam("qNo") Integer qNo) {
		try {
			Qna qnaOne = qService.selectQnaByNo(qNo);
			if(qnaOne != null) {
				List<QReply> qnareplyList = qrService.selectQnaReplyList(qNo);
				if(qnareplyList.size() > 0) {
					mv.addObject("rList", qnareplyList);
				}
					mv.addObject("qna", qnaOne);
					mv.setViewName("qna/qnadetail");
			} else {
				mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
				mv.addObject("error", "게시글 상세 조회 실패");
				mv.addObject("url", "/qna/qnalist");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/qna/qnalist");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	@RequestMapping(value="/qna/delete", method=RequestMethod.GET)
	public ModelAndView deleteQna(ModelAndView mv
			, @RequestParam("qNo") Integer qNo
			, @RequestParam("userId") String userId
			, HttpSession session) {
		try {
			String writeuserId = (String)session.getAttribute("userId");
			Qna qna = new Qna();
			qna.setqNo(qNo);
			qna.setUserId(writeuserId);
			if(writeuserId != null && writeuserId.equals(userId)) {
				int result = qService.deleteQna(qna);
				if(result > 0) {
					mv.setViewName("redirect:/qna/qnalist");
				} else {
					mv.addObject("msg", "문의글 삭제가 완료되지 않았습니다.");
					mv.addObject("error", "게시글 삭제 실패");
					mv.addObject("url", "/qna/qnalist");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "본인이 작성한 글만 삭제할 수 있습니다.");
				mv.addObject("error", "게시글 삭제 불가");
				mv.addObject("url", "/qna/qnalist");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/qna/qnalist");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/qna/qnamodify", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv
			, @RequestParam("qNo") Integer qNo) {
		try {
			Qna qna = qService.selectQnaByNo(qNo);
			mv.addObject("qna", qna);
			mv.setViewName("qna/qnamodify");
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/qna/qnadetail?qNo="+qNo);
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/qna/qnamodify", method=RequestMethod.POST)
	public ModelAndView ReviewModify(ModelAndView mv
			, @ModelAttribute Qna qna
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String userId = (String) session.getAttribute("userId");
			String writeuserId = qna.getUserId();
			if(writeuserId != null && writeuserId.equals(userId)) {
			int result = qService.updateQna(qna);
			if(result > 0) {
				mv.setViewName("redirect:/qna/qnadetail?qNo="+qna.getqNo());
			} else {
				mv.addObject("msg", "게시글 수정이 완료되지 않았습니다.");
				mv.addObject("error", "게시글 수정 실패");
				mv.addObject("url", "/qna/qnamodify?qNo="+qna.getqNo());
				mv.setViewName("common/serviceFailed");
			}
			} else {
				mv.addObject("msg", "게시글 수정 권한이 없습니다.");
				mv.addObject("error", "게시글 수정 실패");
				mv.addObject("url", "/qna/qnamodify?qNo="+qna.getqNo());
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/qna/qnamodify?qNo="+qna.getqNo());
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
}
