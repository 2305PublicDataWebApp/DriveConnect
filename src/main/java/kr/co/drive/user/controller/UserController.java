package kr.co.drive.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="user/register", method=RequestMethod.POST)
	public String registerUser(
//			@RequestParam("userId") String userId
//			, @RequestParam("userPw") String userPw
//			, @RequestParam("userName") String userName
//			, @RequestParam("userEmail") String userEmail
//			, @RequestParam("userPhone") String userPhone
//			, @RequestParam("dLicense") String dLicense
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
	
	}
