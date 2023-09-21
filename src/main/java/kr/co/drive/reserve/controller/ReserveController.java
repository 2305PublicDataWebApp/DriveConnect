package kr.co.drive.reserve.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import kr.co.drive.reserve.service.ReserveService;
import kr.co.drive.subs.domain.SubsFiles;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService rService;
	
	@RequestMapping(value="/reserve/resewrite", method=RequestMethod.GET)
	public ModelAndView showWriteForm(ModelAndView mv) {

		mv.setViewName("reserve/resewrite");
		return mv;
	}
	
	@RequestMapping(value="/reserve/resewrite", method=RequestMethod.POST)
	public ModelAndView reseRegister(
			ModelAndView mv
			, @ModelAttribute Reserve reserve
			, @ModelAttribute SubsFiles subsF
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request) {
		try {
			String userId = (String)session.getAttribute("userId");
			if(userId != null && !userId.equals("")) {
				reserve.setUserId(userId);
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					// 파일정보(이름, 리네임, 경로, 크기) 및 파일저장
					Map<String, Object> rMap = this.saveFile(request, uploadFile);
					subsF.setFileName((String)rMap.get("fileName"));
					subsF.setFileRename((String)rMap.get("fileRename"));
					subsF.setFilePath((String)rMap.get("filePath"));
					subsF.setFileLength((long)rMap.get("fileLength"));
				}
				int result = rService.insertReserve(reserve);
				mv.setViewName("redirect:/reserve/reselist");
			} else {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.addObject("error", "로그인이 필요합니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/serviceFailed");
			}
		} catch (Exception e) {
			mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/reserve/resewrite");
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
}