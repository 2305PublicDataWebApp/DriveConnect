package kr.co.drive.reserve.controller;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.drive.reserve.domain.Reserve;
import kr.co.drive.reserve.service.ReserveService;
import kr.co.drive.subs.domain.Subs;
import kr.co.drive.subs.domain.SubsFiles;
import kr.co.drive.subs.service.SubsService;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService rService;
	
	@Autowired
	private SubsService sService;

	@RequestMapping(value="/reserve/resewrite", method=RequestMethod.GET)
	public ModelAndView showWriteForm(ModelAndView mv
			,@RequestParam("scNo") int scNo) {
		Subs sOne = sService.selectBoardByNo(scNo);
		mv.addObject("sOne", sOne);
		mv.setViewName("reserve/resewrite");
		return mv;
	}

	@RequestMapping(value="/reserve/resewrite", method=RequestMethod.POST)
	public ModelAndView reseRegister(
			ModelAndView mv
			, @ModelAttribute Reserve reserve
			, @ModelAttribute SubsFiles subsFiles
			, @ModelAttribute Subs subs
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
					subsFiles.setFileName((String)rMap.get("fileName"));
					subsFiles.setFileRename((String)rMap.get("fileRename"));
					subsFiles.setFilePath((String)rMap.get("filePath"));
					subsFiles.setFileLength((long)rMap.get("fileLength"));
				}
				int result = rService.insertReserve(reserve);
				mv.addObject("subs/sOne");
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
	
	
	
	@RequestMapping(value="/reserve/getRname",produces="application/json;charset=utf8",method=RequestMethod.GET)
	public @ResponseBody String getSname(HttpServletRequest req, @RequestParam("sarea") String sarea){
		List<Reserve> list = rService.getStoreNameList(sarea);
		
//		String strJson="{\"result\":["
//				+ "{\"name\":\"name1\",\"num\":\"num1\"},"
//				+ "{\"name\":\"name2\",\"num\":\"num2\"},"
//				+ "{\"name\":\"name3\",\"num\":\"num3\"}]}";
		
		String strJson="{\"result\":[";
		for(Reserve reserve : list){
			strJson += "{\"num\":\""+ reserve.getScNo() +"\",\"name\":\""+ reserve.getUserName() +"\"},";
		}
		
		strJson=strJson.substring(0,strJson.length()-1); // 마지막 쉼표 제거
		strJson+="]}";
		
		return strJson;
	}
	
	
	
	// 장바구니에서 결제페이지로
	@RequestMapping("/reserve/reserve2")
	public ModelAndView reserve2(HttpSession session
			, @ModelAttribute Subs subs
			){
		ModelAndView model = new ModelAndView();
		
		Reserve reserve = (Reserve) session.getAttribute("loginInfo"); 
		if (reserve != null) {
			int unum = reserve.getScNo();			
			try {
				List<Reserve> list = rService.getList(unum);
				int mytotalPrice = rService.getmyTotalPrice(unum);
				
	            // 여기에서 Subs 객체를 가져와서 모델에 추가
	            Subs sOne = sService.selectBoardByNo(unum);
				
				model.addObject("list",list);
				model.addObject("mytotalPrice", mytotalPrice);			
				model.addObject("sOne", sOne); // Subs 객체를 모델에 추가

			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			
		}
		
		model.setViewName("/reserve/reserve2");
		return model;
		
		
	}
	
	
    @GetMapping("/reserve/ordersuccess")
    public String showOrderSuccessPage() {
        // 여기에 필요한 로직을 추가하세요.
        // 예를 들어 데이터를 가공하거나 필요한 작업을 수행할 수 있습니다.
        
        return "reserve/ordersuccess"; // 뷰 이름 (ordersuccess.jsp)
    }
    
    
}
	
	
