package kr.co.drive.subs.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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
import kr.co.drive.subs.domain.Subs;
import kr.co.drive.subs.domain.SubsFiles;
import kr.co.drive.subs.service.SubsService;

@Controller
public class SubsController {

	@Autowired
	private SubsService sService;
	
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
				int result = sService.insertBoard(subs);
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
}
