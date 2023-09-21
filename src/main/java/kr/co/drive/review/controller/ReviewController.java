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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import kr.co.drive.review.domain.RePageInfo;
import kr.co.drive.review.domain.ReReply;
import kr.co.drive.review.domain.Review;
import kr.co.drive.review.service.ReReplyService;
import kr.co.drive.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rService;
	@Autowired
	private ReReplyService rrService;

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
					Map<String, Object> rMap = this.saveFile(request, uploadFile);
					review.setFileName((String)rMap.get("fileName"));
					review.setFileRename((String)rMap.get("fileRename"));
					review.setFilePath((String)rMap.get("filePath"));
					review.setFileLength((long)rMap.get("fileLength"));
				}
				int result = rService.insertReview(review);
				mv.setViewName("redirect:/review/relist");
			} else {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.addObject("error", "로그인이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/rewrite");
			mv.setViewName("common/serviceFailed");
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
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/relist");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/review/redetail", method=RequestMethod.GET)
	public ModelAndView showReviewDetail(ModelAndView mv
			, @RequestParam("rNo") Integer rNo) {
		try {
			Review reviewOne = rService.selectReviewByNo(rNo);
			if(reviewOne != null) {
				List<ReReply> rrList = rrService.selectReReplyList(rNo);
				if(rrList.size() > 0) {
					mv.addObject("rrList", rrList);
				}
					mv.addObject("review", reviewOne);
					mv.setViewName("review/redetail");
			} else {
				mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
				mv.addObject("error", "게시글 상세 조회 실패");
				mv.addObject("url", "/review/relist");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/relist");
			mv.setViewName("common/serviceFailed");
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
	
	@RequestMapping(value="/review/delete", method=RequestMethod.GET)
	public ModelAndView deleteReview(ModelAndView mv
			, @RequestParam("rNo") Integer rNo
			, HttpSession session) {
		try {
			String userId = (String)session.getAttribute("userId");
			Review review = new Review();
			review.setrNo(rNo);
			review.setUserId(userId);
			if(userId != null && userId.equals(userId)) {
				int result = rService.deleteReview(review);
				if(result > 0) {
					mv.setViewName("redirect:/review/relist");
				} else {
					mv.addObject("msg", "게시글 삭제가 완료되지 않았습니다.");
					mv.addObject("error", "게시글 삭제 실패");
					mv.addObject("url", "/review/relist");
					mv.setViewName("common/serviceFailed");
				}
			} else {
				mv.addObject("msg", "본인이 작성한 글만 삭제할 수 있습니다.");
				mv.addObject("error", "게시글 삭제 불가");
				mv.addObject("url", "/review/relist");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/relist");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/review/remodify", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv
			, @RequestParam("rNo") Integer rNo) {
		try {
			Review review = rService.selectReviewByNo(rNo);
			mv.addObject("review", review);
			mv.setViewName("review/remodify");
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/redetail?rNo="+rNo);
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	@RequestMapping(value="/review/remodify", method=RequestMethod.POST)
	public ModelAndView ReviewModify(ModelAndView mv
			, @ModelAttribute Review review
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String userId = (String) session.getAttribute("userId");
			String writeuserId = review.getUserId();
			if(writeuserId != null && writeuserId.equals(userId)) {
				if(uploadFile != null && !uploadFile.isEmpty()) {
					String fileRename = review.getFileRename();
					if(fileRename != null) {
						this.deleteFile(fileRename, request);
					}
				Map<String, Object> rFileMap = this.saveFile(request,  uploadFile);
				review.setFileName((String)rFileMap.get("fileName"));
				review.setFileRename((String)rFileMap.get("fileRename"));
				review.setFilePath((String)rFileMap.get("filePath"));
				review.setFileLength((long)rFileMap.get("fileLength"));
			// 수정이라는 과정은 대체하는 것, 대체하는 방법은 삭제 후 등록
				}
//				if(board.getBoardFilename() == null) {
//					board.setBoardFilename("");
//					board.setBoardFileRename("");
//					board.setBoardFilepath("");
//				}
			int result = rService.updateReview(review);
			if(result > 0) {
				mv.setViewName("redirect:/review/redetail?rNo="+review.getrNo());
			} else {
				mv.addObject("msg", "게시글 수정이 완료되지 않았습니다.");
				mv.addObject("error", "게시글 수정 실패");
				mv.addObject("url", "/review/remodify?rNo="+review.getrNo());
				mv.setViewName("common/serviceFailed");
			}
			} else {
				mv.addObject("msg", "게시글 수정 권한이 없습니다.");
				mv.addObject("error", "게시글 수정 실패");
				mv.addObject("url", "/review/remodify?rNo="+review.getrNo());
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의바랍니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/review/remodify?rNo="+review.getrNo());
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}

	private void deleteFile(String fileRename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "\\ruploadFiles\\" + fileRename;
		File delFile = new File(delPath);
		if(delFile.exists()) {
			delFile.delete();
		}
		
	}
	@RequestMapping(value="/review/research", method=RequestMethod.GET)
	public String searchReviewList(
			@RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, Model model) {
				Map<String, String> paramMap = new HashMap<String, String>();
				paramMap.put("searchCondition", searchCondition);
				paramMap.put("searchKeyword", searchKeyword);
				int totalCount = rService.getListCount();
				RePageInfo pInfo = this.getRePageInfo(currentPage, totalCount);
		List<Review> searchList = rService.searchReviewByKeyword(pInfo, paramMap);
		if(!searchList.isEmpty()) {
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("pInfo", pInfo);
			model.addAttribute("sList", searchList);
			return "review/relist";
		} else {
			model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.");
			model.addAttribute("error", "공지사항 제목으로 조회 실패");
			model.addAttribute("url", "/review/relist");
			return "common/serviceFailed";
		}
			
	}
}
