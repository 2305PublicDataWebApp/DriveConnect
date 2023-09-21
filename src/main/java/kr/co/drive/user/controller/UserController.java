package kr.co.drive.user.controller;

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

import kr.co.drive.notice.domain.Notice;
import kr.co.drive.user.domain.User;
import kr.co.drive.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping(value="/user/register", method=RequestMethod.GET)
	public String showRegisterForm() {
		return "user/register";
	}
	
	@RequestMapping(value="/user/register", method=RequestMethod.POST)
	public String registerUser(
			@ModelAttribute User user
			, Model model) {
		try {
			int result = service.insertUser(user);
			if(result > 0) {
				return "redirect:/index.jsp";
			}else {
				model.addAttribute("msg", "회원가입이 완료되지 않았습니다.");
				model.addAttribute("error", "회원가입 실패");
				model.addAttribute("url", "/user/register");
				return "common/serviceFailed";
			}			
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", "관리자에게 문의바랍니다.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/user/register");
			return "common/serviceFailed";
			} 
		}

	@RequestMapping(value="/user/login", method=RequestMethod.GET)
	public String showLoginView() {
		return "user/login";
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	public String userLoginCheck(
			@ModelAttribute User user
			, HttpSession session
			, Model model) {
		try {
			User uOne = service.checkUserLogin(user);
			if(uOne != null) {
				// 성공하면 메인페이지로 이동
//				session.setAttribute("userNo", uOne.getUserNo());
				session.setAttribute("userId", uOne.getUserId());
				session.setAttribute("userName", uOne.getUserName());
				session.setAttribute("adminYn", uOne.getAdminYn());
				return "redirect:/index.jsp";
			}else {
				// 실패하면 에러페이지로 이동
				model.addAttribute("msg", "로그인이 완료되지 않았습니다.");
				model.addAttribute("error", "로그인 실패");
				model.addAttribute("url", "/index.jsp");
				return "common/serviceFailed";
			}			
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", "관리자에게 문의바랍니다.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "/index.jsp");
			return "common/serviceFailed";
		}
	}
	
	@RequestMapping(value="/user/logout", method=RequestMethod.GET)
	public String userLogout(HttpSession session, Model model) {
		if(session != null) {
			session.invalidate();
			return "redirect:/index.jsp";
		}else {
			model.addAttribute("error", "로그아웃을 완료하지 못하였습니다.");
			model.addAttribute("msg", "로그아웃 실패");
			model.addAttribute("url", "/index.jsp");
			return "common/serviceFailed";
		}
	}
	
	@RequestMapping(value="/user/admin_m_list", method=RequestMethod.GET)
	public String showUserList(@ModelAttribute User user
			, Model model) {
		try {
			List<User> uList = service.selectUserList(user);
			if(uList.size() > 0) {
				model.addAttribute("uList", uList);
				return "user/admin_m_list";
			} else {
				model.addAttribute("msg", "회원정보가 조회가 완료되지 않았습니다.");
				model.addAttribute("error", "회원정보 목록 조회 실패");
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
	@RequestMapping(value="/user/admin_m_detail", method=RequestMethod.GET)
	public String showUserDetail(
			@RequestParam("userNo") Integer userNo
			, Model model) {
		User userOne = service.selectUserByNo(userNo);
		model.addAttribute("user", userOne);
		return "user/admin_m_detail";
	}
	
	
	@RequestMapping(value="/user/admin_modify", method=RequestMethod.GET)
	public String showModifyForm(
			@RequestParam("userNo") Integer userNo
			, Model model) {
		User userOne = service.selectUserByNo(userNo);
		model.addAttribute("user", userOne);
		return "user/admin_modify";
	}
	
	@RequestMapping(value="/user/admin_modify", method=RequestMethod.POST)
	public String updateUser(@ModelAttribute User user
			, Model model
			, HttpSession session
			, HttpServletRequest request) {
		try {
			int result = service.updateUser(user);
			if(result > 0) {
				return "redirect:/user/admin_m_detail?userNo="+user.getUserNo();
			} else {
				model.addAttribute("msg", "회원정보 수정이 완료되지 않았습니다.");
				model.addAttribute("error", "회원정보 수정 실패");
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
	
	@RequestMapping(value="/user/delete", method=RequestMethod.POST)
	public String deleteUser(@ModelAttribute User user
			, Model model
			, HttpSession session
			, HttpServletRequest request) {
	    try {
	        int result = service.deleteUser(user);
	        if (result > 0) {
	            return "redirect:/user/admin_m_list";
	        } else {
	            model.addAttribute("msg", "회원정보 삭제가 완료되지 않았습니다.");
	            model.addAttribute("error", "회원정보 삭제 실패");
	            model.addAttribute("url", "/user/admin_m_detail?userNo=" + user.getUserNo());
	            return "common/serviceFailed";
	        }
	    } catch (Exception e) {
	        model.addAttribute("msg", "관리자에게 문의해주세요.");
	        model.addAttribute("error", e.getMessage());
	        model.addAttribute("url", "/user/admin_m_detail?userNo=" + user.getUserNo());
	        return "common/serviceFailed";
	    }
	}
	
	
	
	
	
	
	
}