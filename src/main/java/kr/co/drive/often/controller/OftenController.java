package kr.co.drive.often.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.drive.often.domain.Often;
import kr.co.drive.often.service.OftenService;

@Controller
public class OftenController {

	@Autowired
	private OftenService oService;
	
	@RequestMapping(value="/often/ofinsert", method=RequestMethod.GET)
	public String showInsertForm() {
		return "often/ofinsert";
	}
	@RequestMapping(value="/often/ofinsert", method=RequestMethod.POST)
	public String insertOften(@ModelAttribute Often often
			, HttpServletRequest request
			, HttpSession session
			, Model model) {
		try {
			String userId = (String)session.getAttribute("userId");
			if (userId != "" && userId != null) {
				often.setUserId(userId);
				int result = oService.insertOften(often);
				if(result > 0) {
					return "redirect:/often/oflist";
			} else {
				model.addAttribute("msg", "자주묻는 질문 등록이 완료되지 않았습니다.");
				model.addAttribute("error", "자주묻는 질문 등록 실패");
				model.addAttribute("url", "/often/ofinsert");
				return "common/serviceFailed";
			}
        }else {
        	model.addAttribute("msg", "데이터 등록이 완료되지 않았습니다.");
			model.addAttribute("error", "자주묻는 질문 등록 실패");
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
		
		@RequestMapping(value="/often/oflist", method=RequestMethod.GET)
		public String showOftenList(@ModelAttribute Often often
				, Model model) {
			try {
				List<Often> oList = oService.selectOftenList(often);
				if(oList.size() > 0) {
					model.addAttribute("oList", oList);
					return "often/oflist";
				} else {
					model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
					model.addAttribute("error", "자주묻는 질문 목록 조회 실패");
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
		
		@RequestMapping(value="/often/ofdetail", method=RequestMethod.GET)
		public String showOftenDetail(
				@RequestParam("oNo") Integer oNo
				, Model model) {
			Often oftenOne = oService.selectOftenByNo(oNo);
			model.addAttribute("often", oftenOne);
			return "often/ofdetail";
		}
		
		@RequestMapping(value="/often/ofmodify", method=RequestMethod.GET)
		public String showModifyForm(
				@RequestParam("oNo") Integer oNo
				, Model model) {
			Often oftenOne = oService.selectOftenByNo(oNo);
			model.addAttribute("often", oftenOne);
			return "often/ofmodify";
		}
		
		@RequestMapping(value="/often/ofmodify", method=RequestMethod.POST)
		public String updateOften(@ModelAttribute Often often
				, Model model
				, HttpServletRequest request) {
			try {
				int result = oService.updateOften(often);
				if(result > 0) {
					return "redirect:/often/ofdetail?oNo="+often.getoNo();
				} else {
					model.addAttribute("msg", "자주묻는 질문 수정이 완료되지 않았습니다.");
					model.addAttribute("error", "자주묻는 질문 수정 실패");
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
		@RequestMapping(value="/often/delete", method=RequestMethod.POST)
		public String deleteOften(@RequestParam("oNo") Integer oNo, Model model) {
		    try {
		        int result = oService.deleteOften(oNo);
		        if (result > 0) {
		            return "redirect:/often/oflist";
		        } else {
		            model.addAttribute("msg", "자주묻는 질문 삭제가 완료되지 않았습니다.");
		            model.addAttribute("error", "자주묻는 질문 삭제 실패");
		            model.addAttribute("url", "/often/ofdetail?oNo=" + oNo);
		            return "common/serviceFailed";
		        }
		    } catch (Exception e) {
		        model.addAttribute("msg", "관리자에게 문의해주세요.");
		        model.addAttribute("error", e.getMessage());
		        model.addAttribute("url", "/often/ofdetail?oNo=" + oNo);
		        return "common/serviceFailed";
		    }
		}
}
