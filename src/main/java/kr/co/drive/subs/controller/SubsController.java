package kr.co.drive.subs.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
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

import kr.co.drive.reserve.domain.Reserve;
import kr.co.drive.subs.domain.PageInfo;
import kr.co.drive.subs.domain.Subs;
import kr.co.drive.subs.domain.SubsFiles;
import kr.co.drive.subs.service.SubsService;
import kr.co.drive.user.domain.User;

@Controller
public class SubsController {

	@Autowired
	private SubsService sService;
	
	
	@RequestMapping(value="/subs/subsdetail", method=RequestMethod.GET)
	public ModelAndView showSubsDetail(ModelAndView mv
			, @RequestParam("scNo") Integer scNo) {
		try {
			Subs sOne = sService.selectBoardByNo(scNo);
			if(sOne != null) {
				mv.addObject("subs", sOne);
				mv.setViewName("subs/subsdetail");
			}else {
				mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
				mv.addObject("error", "게시글 상세 조회 실패");
				mv.addObject("url", "/subs/subslist");
				mv.setViewName("common/serviceFailed");
			}			
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/subs/subslist");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/subs/subslist", method=RequestMethod.GET)
	public ModelAndView showSubsList(
			@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			,HttpSession session
			, ModelAndView mv) {
		try {
	        String userName = (String) session.getAttribute("userName");
	        
			int totalCount = sService.getListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<Subs> sList = sService.selectBoardList(pInfo);
			
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList)
					.addObject("pInfo", pInfo)
					.setViewName("/subs/subslist");			
			}else {
				mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
				mv.addObject("error", "게시글 상세 조회 실패");
				mv.addObject("url", "/subs/subslist");
				mv.setViewName("common/serviceFailed");
			}
			
			mv.addObject("user", new User(userName));
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/subs/subslist");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	} 
	
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		// TODO Auto-generated method stub
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		
		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi >  naviTotalCount) {
			endNavi = naviTotalCount;
		}
		
		PageInfo pInfo = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		
		return pInfo;
	}
	
	
	
	@RequestMapping(value="/subs/admin_s_write", method=RequestMethod.GET)
	public ModelAndView showWriteForm(ModelAndView mv) {
		mv.setViewName("subs/admin_s_write");
		return mv;
	}
	
	@RequestMapping(value="/subs/admin_s_write", method=RequestMethod.POST)
	public ModelAndView subsRegister(
			ModelAndView mv
			, @ModelAttribute Subs subs
			, @ModelAttribute SubsFiles subsFiles
			, @ModelAttribute Reserve reserve
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String userId = (String)session.getAttribute("userId");
			if(userId != null && !userId.equals("")) {
				reserve.setUserId(userId);
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					// 파일정보(이름, 리네임, 경로 크기 및 파일저장)
					Map<String, Object> bMap = this.saveFile(request, uploadFile);
					subsFiles.setFileName((String)bMap.get("fileName"));
					subsFiles.setFileRename((String)bMap.get("fileRename"));
					subsFiles.setFilePath((String)bMap.get("filePath"));
					subsFiles.setFileLength((long)bMap.get("fileLength"));					
				}
		        // 게시판 글 정보를 먼저 데이터베이스에 저장
				int result = sService.insertBoard(subs);
				
				// 파일 정보와 게시판 글 정보를 함께 데이터베이스에 저장
				if (result > 0 && uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					subsFiles.setScNo(result);
				    // 파일 정보를 데이터베이스에 저장하는 메서드 호출
				    result = sService.insertSubs(subsFiles);
				}
				mv.setViewName("redirect:/subs/subslist");
			}else {
				mv.addObject("msg", "로그인 정보가 존재하지 않습니다.");
				mv.addObject("error", "로그인이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
//			model.addAttribute("msg", "게시글 등록이 완료되지 않았습니다.");
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/subs/admin_s_write");
			mv.setViewName("common/serviceFailed");
		}
		return mv;
	}
	
	
	public Map<String, Object> saveFile(
			HttpServletRequest request
			, MultipartFile uploadFile) throws Exception {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		// 파일 저장경로 구하기
		String savePath = root + "\\buploadFiles";
		
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		
		// 파일 확장자 구하기
		String extension
				= fileName.substring(fileName.lastIndexOf(".")+1);
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
		fileMap.put("filePath", "../resources/buploadFiles/"+fileRename);
		fileMap.put("fileLength", fileLength);
		return fileMap;
		
	}
	
	
	
	
	@RequestMapping(value="/subs/delete", method=RequestMethod.POST)
	public ModelAndView subsDelete(ModelAndView mv
	        , @RequestParam("scNo") Integer scNo
	        , HttpSession session) {
	    try {
	        String userId = (String)session.getAttribute("userId");
	        
	        if ("admin".equals(userId)) {
	            int result = sService.deleteBoard(scNo); // scNo만으로 삭제하도록 수정
	            if (result > 0) {
	                mv.setViewName("redirect:/subs/subslist");
	            } else {
	                mv.addObject("msg", "게시글 삭제 미완료!");
	                mv.addObject("error", "게시글 삭제 실패");
	                mv.addObject("url", "/subs/subslist");
	                mv.setViewName("common/serviceFailed");
	            }
	        } else {
	            mv.addObject("msg", "관리자만 삭제할 수 있습니다!");
	            mv.addObject("error", "게시글 삭제 불가");
	            mv.addObject("url", "/subs/subslist");
	            mv.setViewName("common/serviceFailed");
	        }
	    } catch (Exception e) {
	        // TODO: handle exception
	        mv.addObject("msg", "관리자에게 문의 바랍니다!");
	        mv.addObject("error", e.getMessage());
	        mv.addObject("url", "/subs/subslist");
	        mv.setViewName("common/serviceFailed");
	    }
	    return mv;
	}

	
	
	@RequestMapping(value="/subs/admin_s_modify", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv, @RequestParam("scNo") Integer scNo) {
	    try {
	        Subs subs = sService.selectBoardByNo(scNo);
	        mv.addObject("subs", subs);
	        mv.setViewName("subs/admin_s_modify");
	    } catch (Exception e) {
	        mv.addObject("msg", "게시글 정보를 불러오는 데 실패했습니다.");
	        mv.addObject("error", e.getMessage());
	        mv.addObject("url", "/subs/subslist"); // 실패 시 리다이렉트할 URL 설정
	        mv.setViewName("common/serviceFailed");
	    }
	    return mv;
	}
	
	
	@RequestMapping(value="/subs/admin_s_modify", method=RequestMethod.POST)
	public ModelAndView boardModify(ModelAndView mv
	        , @ModelAttribute Subs subs
	        , @ModelAttribute SubsFiles subsFiles
	        , @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
	        , HttpSession session
	        , HttpServletRequest request) {
	    try {
	        String userId = (String)session.getAttribute("userId");

	        int result = 0; // result 변수 초기화

	        // 파일 업로드 처리 부분
	        if (uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
	            String fileRename = subsFiles.getFileRename();
	            if (fileRename != null) {
	                this.deleteFile(fileRename, request);
	            }
	            Map<String, Object> bMap = this.saveFile(request, uploadFile);
	            subsFiles.setFileName((String)bMap.get("fileName"));
	            subsFiles.setFileRename((String)bMap.get("fileRename"));
	            subsFiles.setFilePath((String)bMap.get("filePath"));
	            subsFiles.setFileLength((long)bMap.get("fileLength"));

	            // 첨부 파일이 있으면 업데이트
	            result = sService.updateBoard(subs);
	            if (result > 0) {
	                // 첨부 파일 업데이트
	                result = sService.updateBoardFiles(subsFiles);
	            }
	        } else {
	            // 첨부 파일이 없으면 게시글 정보만 업데이트
	            result = sService.updateBoard(subs);
	        }

	        if (result > 0) {
	            mv.setViewName("redirect:/subs/subsdetail?scNo="+subs.getScNo());
	        } else {
	            mv.addObject("msg", "게시글 수정 미완료!");
	            mv.addObject("error", "게시글 수정 실패");
	            mv.addObject("url", "/subs/admin_s_modify");
	            mv.setViewName("common/serviceFailed");
	        }
	    } catch (Exception e) {
	        mv.addObject("msg", "관리자에게 문의 바랍니다!");
	        mv.addObject("error", e.getMessage());
	        mv.addObject("url", "/subs/admin_s_modify?scNo="+subs.getScNo());
	        mv.setViewName("common/serviceFailed");
	    }
	    return mv;
	}
	
	
	
//	@RequestMapping(value="/subs/admin_s_modify", method=RequestMethod.POST)
//	public ModelAndView boardModify(ModelAndView mv
//			, @ModelAttribute Subs subs
//			, @ModelAttribute SubsFiles subsFiles
//			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
//			, HttpSession session
//			, HttpServletRequest request) {
//		try {
//			String userId = (String)session.getAttribute("userId");
//			
//			// 파일 업로드 처리 부분
//			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
//				String fileRename = subsFiles.getFileRename();
//				if(fileRename != null) {
//					this.deleteFile(fileRename, request);                                    
//				}
//				Map<String, Object> bMap = this.saveFile(request, uploadFile);
//				subsFiles.setFileName((String)bMap.get("fileName"));
//				subsFiles.setFileRename((String)bMap.get("fileRename"));
//				subsFiles.setFilePath((String)bMap.get("filePath"));
//				subsFiles.setFileLength((long)bMap.get("fileLength"));    
//			}
//			
//			int result = sService.updateBoard(subs);
//			if(result > 0) {
//				mv.setViewName("redirect:/subs/subsdetail?scNo="+subs.getScNo());
//			} else {
//				mv.addObject("msg", "게시글 수정 미완료!");
//				mv.addObject("error", "게시글 수정 실패");
//				mv.addObject("url", "/subs/admin_s_modify");
//				mv.setViewName("common/serviceFailed");
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			mv.addObject("msg", "관리자에게 문의 바랍니다!");
//			mv.addObject("error", e.getMessage());
//			mv.addObject("url", "/subs/admin_s_modify?scNo="+subs.getScNo());
//			mv.setViewName("common/serviceFailed");
//		}
//		return mv;
//	}


	private void deleteFile(String fileRename, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath= root + "\\buploadFiles\\" + fileRename;
		File delFile = new File(delPath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
