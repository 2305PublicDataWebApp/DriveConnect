package kr.co.drive.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.drive.admin.domain.AdminNotice;
import kr.co.drive.admin.repository.AdminNoticeRepository;

@Controller
@RequestMapping("/admin")
public class AdminNoticeController {

	@Autowired
	private AdminNoticeRepository adminNoticeRepository;
	
	
	   @GetMapping("/notices")
	    public String listNotices(Model model) {
		    Iterable<AdminNotice> notices = adminNoticeRepository.findAll();
		    List<AdminNotice> noticeList = new ArrayList<>();
		    notices.forEach(noticeList::add);
		    model.addAttribute("notices", noticeList);
		    return "admin/notice-list";
	    }

	   @GetMapping("/notices/{id}")
	    public String noticeDetails(@PathVariable Long id, Model model) {
	        Optional<AdminNotice> notice = adminNoticeRepository.findById(id);
	        if (notice.isPresent()) {
	            model.addAttribute("notice", notice.get());
	        } else {
	            // 공지사항이 존재하지 않을 경우 처리
	        }
	        return "admin/notice-details";
	    }

	    @GetMapping("/notices/{id}/edit")
	    public String editNoticeForm(@PathVariable Long id, Model model) {
	        Optional<AdminNotice> notice = adminNoticeRepository.findById(id);
	        if (notice.isPresent()) {
	            model.addAttribute("notice", notice.get());
	        } else {
	            // 공지사항이 존재하지 않을 경우 처리
	        }
	        return "admin/notice-edit";
	    }

	    @PostMapping("/notices/{id}/edit")
	    public String editNotice(@PathVariable Long id, @ModelAttribute AdminNotice editedNotice) {
	        // editedNotice를 사용하여 공지사항 정보 업데이트
	        // adminNoticeRepository.save(...) 등으로 업데이트 가능
	        return "redirect:/admin/notices/" + id;
	    }

	    @GetMapping("/notices/{id}/delete")
	    public String deleteNotice(@PathVariable Long id) {
	        // 공지사항 삭제 로직 작성
	        adminNoticeRepository.deleteById(id);
	        return "redirect:/admin/notices";
	    }

}
