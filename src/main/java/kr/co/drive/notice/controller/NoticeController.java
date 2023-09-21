package kr.co.drive.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import kr.co.drive.notice.domain.Notice;

import kr.co.drive.notice.service.NoticeService;
import kr.co.drive.often.domain.Often;
import kr.co.drive.often.service.OftenService;
import kr.co.drive.qna.domain.Qna;
import kr.co.drive.qna.service.QnaService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	@Autowired
	private QnaService qService;
	@Autowired
	private OftenService oService;
	
	@RequestMapping(value="/notice/insert", method=RequestMethod.GET)
	public String showInsertForm() {
		return "notice/insert";
	}
	@RequestMapping(value="/notice/insert", method=RequestMethod.POST)
	public String insertNotice(@ModelAttribute Notice notice
			, HttpServletRequest request
			, HttpSession session
			, Model model) {
		try {
//			String userNoParam = request.getParameter("userNo");
//			Integer userNo = Integer.parseInt(notice.getUserNo());
			String userId = (String)session.getAttribute("userId");
//			if (userNo != null && userNo != 0) {
			if (userId != "" && userId != null) {
				notice.setUserId(userId);
//				notice.setUserNo(userNo);
				int result = service.insertNotice(notice);
				if(result > 0) {
					return "redirect:/notice/list";
				} else {
					model.addAttribute("msg", "공지사항 등록이 완료되지 않았습니다.");
					model.addAttribute("error", "공지사항 등록 실패");
					model.addAttribute("url", "/notice/insert");
					return "common/serviceFailed";
				}
	        }else {
	        	model.addAttribute("msg", "데이터 등록이 완료되지 않았습니다.");
				model.addAttribute("error", "공지사항 등록 실패");
				model.addAttribute("url", "/index.jsp");
				return "common/serviceFailed";
	        }
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의해주세요.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/user/register");
			return "common/serviceFailed";
		}
	}
		
		@RequestMapping(value="/notice/list", method=RequestMethod.GET)
		public String showNoticeList(@ModelAttribute Notice notice
				, Model model) {
			try {
				List<Notice> nList = service.selectNoticeList(notice);
				if(nList.size() > 0) {
					model.addAttribute("nList", nList);
					return "notice/list";
				} else {
					model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
					model.addAttribute("error", "공지사항 목록 조회 실패");
					model.addAttribute("url", "/index.jsp");
					return "common/serviceFailed";
				}
			} catch (Exception e) {
				model.addAttribute("msg", "관리자에게 문의해주세요.");
				model.addAttribute("error", e.getMessage());
				model.addAttribute("url", "/index.jsp");
				return "common/serviceFailed";
			}
	}
		
	
		
		@RequestMapping(value="/notice/detail", method=RequestMethod.GET)
		public String showNoticeDetail(
				@RequestParam("nNo") Integer nNo
				, Model model) {
			Notice noticeOne = service.selectNoticeByNo(nNo);
			model.addAttribute("notice", noticeOne);
			return "notice/detail";
		}
		
		@RequestMapping(value="/notice/modify", method=RequestMethod.GET)
		public String showModifyForm(
				@RequestParam("nNo") Integer nNo
				, Model model) {
			Notice noticeOne = service.selectNoticeByNo(nNo);
			model.addAttribute("notice", noticeOne);
			return "notice/modify";
		}
		
		@RequestMapping(value="/notice/modify", method=RequestMethod.POST)
		public String updateNotice(@ModelAttribute Notice notice
				, Model model
				, HttpServletRequest request) {
			try {
				int result = service.updateNotice(notice);
				if(result > 0) {
					return "redirect:/notice/detail?nNo="+notice.getnNo();
				} else {
					model.addAttribute("msg", "공지사항 수정이 완료되지 않았습니다.");
					model.addAttribute("error", "공지사항 수정 실패");
					model.addAttribute("url", "/index.jsp");
					return "common/serviceFailed";
				}
			} catch (Exception e) {
				model.addAttribute("msg", "관리자에게 문의해주세요.");
				model.addAttribute("error", e.getMessage());
				model.addAttribute("url", "/index.jsp");
				return "common/serviceFailed";
			}
		}
		@RequestMapping(value="/notice/delete", method=RequestMethod.POST)
		public String deleteNotice(@RequestParam("nNo") Integer nNo, Model model) {
		    try {
		        int result = service.deleteNotice(nNo);
		        if (result > 0) {
		            return "redirect:/notice/list";
		        } else {
		            model.addAttribute("msg", "공지사항 삭제가 완료되지 않았습니다.");
		            model.addAttribute("error", "공지사항 삭제 실패");
		            model.addAttribute("url", "/notice/detail?nNo=" + nNo);
		            return "common/serviceFailed";
		        }
		    } catch (Exception e) {
		        model.addAttribute("msg", "관리자에게 문의해주세요.");
		        model.addAttribute("error", e.getMessage());
		        model.addAttribute("url", "/notice/detail?nNo=" + nNo);
		        return "common/serviceFailed";
		    }
		}
		@RequestMapping(value="/center/center", method=RequestMethod.GET)
		public String showCenterList(@ModelAttribute Notice notice
				, @ModelAttribute Qna qna
				, @ModelAttribute Often often
				, Model model) {
			try {
				List<Notice> nList = service.selectNoticeList(notice);
				List<Qna> qList = qService.selectQnaList();
				List<Often> oList = oService.selectOftenList(often);
				if(nList.size() > 0) {
					model.addAttribute("nList", nList);
					model.addAttribute("qList", qList);
					model.addAttribute("oList", oList);
					return "center/center";
				} else {
					model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
					model.addAttribute("error", "공지사항 목록 조회 실패");
					model.addAttribute("url", "/index.jsp");
					return "common/serviceFailed";
				}
			} catch (Exception e) {
				model.addAttribute("msg", "관리자에게 문의해주세요.");
				model.addAttribute("error", e.getMessage());
				model.addAttribute("url", "/index.jsp");
				return "common/serviceFailed";
			}
	}
}
