package kr.co.drive.review.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import kr.co.drive.review.domain.RePageInfo;
import kr.co.drive.review.domain.Review;
import kr.co.drive.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rService;

	@RequestMapping(value="/review/rewrite", method=RequestMethod.GET)
	public ModelAndView showWriteForm(ModelAndView mv) {

		mv.setViewName("review/rewrite");
		return mv;
	}
	
	@RequestMapping(value="/review/rewrite", method=RequestMethod.POST)
	public ModelAndView reRegister(
			ModelAndView mv
			, @ModelAttribute Review review
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String userId = (String)session.getAttribute("userId");
			if(userId != null && !userId.equals("")) {
				review.setUserId(userId);
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					// 파일정보(이름, 리네임, 경로, 크기) 및 파일저장
					Map<String, Object> bMap = this.saveFile(request, uploadFile);
					review.setFileName((String)bMap.get("fileName"));
					review.setFileRename((String)bMap.get("fileRename"));
					review.setFilePath((String)bMap.get("filePath"));
					review.setFileLength((long)bMap.get("fileLength"));
				}
				int result = rService.insertReview(review);
				mv.setViewName("redirect:/review/relist");
			} else {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.addObject("error", "로그인이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/rewrite");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 저장경로 구하기
		String savePath = root + "\\ruploadFiles";
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = 
				fileName.substring(uploadFile.getOriginalFilename().lastIndexOf(".")+1);
		// 시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+extension;
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// 파일 저장
		File saveFile = new File(savePath+"\\"+fileRename);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		// 파일 정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/ruploadFiles/"+fileRename);
		fileMap.put("fileLength", fileLength);
		return fileMap;
	}
	
	@RequestMapping(value="/review/relist", method=RequestMethod.GET)
	public ModelAndView showReviewList(
			@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, ModelAndView mv) {
		try {
			Integer totalCount = rService.getListCount();
			RePageInfo rpInfo = this.getRePageInfo(currentPage, totalCount);
			List<Review> rList = rService.selectReviewList(rpInfo);
			if(!rList.isEmpty()) {
				mv.addObject("rList", rList).addObject("rpInfo", rpInfo).setViewName("review/relist");
			} else {
				mv.addObject("msg", "게시글 전체 조회가 완료되지 않았습니다.");
				mv.addObject("error", "게시글 조회 실패");
				mv.addObject("url", "/review/relist");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/relist");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	private RePageInfo getRePageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		RePageInfo rpInfo = new RePageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		
		return rpInfo;
	}
}
