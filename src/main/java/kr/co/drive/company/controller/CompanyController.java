package kr.co.drive.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyController {

	@GetMapping("/company/company")
	public String companyPage() {
		return "company/company";
	}
}
