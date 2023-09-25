package kr.co.drive.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
				return "user/signupsuccess";
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
	
	//아이디 중복확인
	@RequestMapping(value = "/user/idCheck", method = RequestMethod.GET)
	public @ResponseBody String postIdCheck(HttpServletRequest req,@RequestParam("userId") String userId){
		int n = service.idCheck(userId);
		int result = 0;
		if(n >= 1) {
			result = 1;
		}
		System.out.println("idresult:"+result);
		return "{\"exist\":"+result+"}";
		
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
				session.setAttribute("userId", uOne.getUserId());
				session.setAttribute("userName", uOne.getUserName());
				session.setAttribute("adminYn", uOne.getAdminYn());
				return "redirect:/index.jsp";
			}else {
				// 실패하면 에러페이지로 이동
				model.addAttribute("msg", "failure");
//				model.addAttribute("error", "로그인 실패");
//				model.addAttribute("url", "/index.jsp");
				return "user/login";
			}			
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", "failure");
//			model.addAttribute("error", e.getMessage());
//			model.addAttribute("url", "/index.jsp");
			return "user/login";
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
		
	
	@RequestMapping(value="/user/mypage", method= {RequestMethod.GET, RequestMethod.POST})
	public String showMyPage(
			HttpSession session
			, Model model) {						
		// SELECT * FROM USER_TBL WHERE USER_ID = ?
		try {
			String userId = (String)session.getAttribute("userId");
			User user = null;
			if(userId != "" && userId != null) {
				user = service.getUserById(userId);
			}
			if(user != null) {
				model.addAttribute("user", user);
				return "user/mypage";
			}else {
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못했습니다.");
				model.addAttribute("error", "마이페이지 조회 실패");				
				model.addAttribute("url", "/index.jsp");
				return "common/serviceFailed";
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("error", "로그아웃을 완료하지 못하였습니다.");
			model.addAttribute("msg", "로그아웃 실패");
			model.addAttribute("url", "/index.jsp");
			return "common/serviceFailed";
		}
	}	
	
	
	
	@RequestMapping(value="/user/delete", method=RequestMethod.GET)
	public String deleteMember(
			@RequestParam("userId") String userId
			, Model model) {
		try {
			int result = service.deleteUser(userId);
			if(result > 0) {
				return "redirect:/user/logout";
			}else {
				model.addAttribute("msg", "회원 탈퇴가 완료되지 않았습니다.");
				model.addAttribute("error", "회원 탈퇴 실패");
				model.addAttribute("url", "/index.jsp");
				return "common/serviceFailed";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "관리자에게 문의바랍니다.");
			model.addAttribute("error", e.getMessage());
			model.addAttribute("url", "index.jsp");
			return "common/serviceFailed";
		}
		
	}
	
	
	
	@RequestMapping(value="/user/modify", method=RequestMethod.GET)
	public String showModifyForm(String userId, Model model) {
		User user = service.getUserById(userId);
		model.addAttribute("user", user);
		return "user/modify";
	}
	
	
	@RequestMapping(value="/user/modify", method=RequestMethod.POST)
	public String updateUser(
			@ModelAttribute User user
			, Model model) {
		try {
			int result = service.updateUser(user);
			if(result > 0) {
				model.addAttribute("msg", "회원정보 수정 완료!");
				model.addAttribute("url", "/index.jsp");
				return "user/mypage";
			}else {
				model.addAttribute("msg", "회원 정보 수정이 완료되지 않았습니다.");
				model.addAttribute("error", "회원정보 수정 실패");
				model.addAttribute("url", "/user/mypage?userId"+user.getUserId());
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
			int result = service.updateAdmin(user);
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
