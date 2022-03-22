package com.kh.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.shop.service.AdminService;
import com.kh.shop.service.ItemService;
import com.kh.shop.vo.ItemVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	private AdminService adminService;
	@Resource(name = "itemService")
	private ItemService itemService;
	
	
	//카테고리관리 페이지로 이동(상단에 관리자 메뉴 클릭 시 실행)
	@GetMapping("/categoryManage")
	public String categoryManage(Model model, String menuCode, String subMenuCode) {
		//관리자 메뉴 목록 조회
		model.addAttribute("menuList",adminService.selectMenuList());
		
		if(menuCode == null) {
			menuCode = "MENU_001";
		}
		if(subMenuCode == null) {
			subMenuCode = "SUB_MENU_001";
		}
		
		model.addAttribute("selectedMenu", menuCode); //MENU_001
		model.addAttribute("selectedSubMenu", subMenuCode); //SUB_MENU_001
		
		//상품관리 메뉴의 하위메뉴 목록 조회
		model.addAttribute("subMenuList", adminService.selectSubMenuList(menuCode));
		return "admin/category_manage";
	}
	
	//상품등록 페이지로 이동
	@GetMapping("/regItem")
	public String regItem(Model model, String menuCode, String subMenuCode) {
		//카테고리 목록 조회
		model.addAttribute("categoryList", itemService.selectCategoryList());
		
		//관리자 메뉴 목록 조회
		model.addAttribute("menuList",adminService.selectMenuList());
		
		//상품관리 메뉴의 하위메뉴 목록 조회
		model.addAttribute("subMenuList", adminService.selectSubMenuList(menuCode));
		
		model.addAttribute("selectedMenu", menuCode); //MENU_001
		model.addAttribute("selectedSubMenu", subMenuCode);
		
		return "admin/reg_item";
	}
	
	//상품등록
	@PostMapping("/regItem")
	public String regItem(ItemVO itemVO, MultipartHttpServletRequest multi) {
		//이미지 첨부(파일 업로드)
		//첨부파일이 들어가는 input태그들의 name 속성 값을 가져온다.
		Iterator<String> inputTagNames = multi.getFileNames();
		
		//첨부파일이 저장될 위치 지정
		String uploadPath = "D:\\Git\\workspaceSTS\\Shop\\src\\main\\webapp\\resources\\images\\";
		
		//첨부파일이 들어간 input 태그의 개수만큼 반복
		while(inputTagNames.hasNext()) {
			//"mainImg", "subImg"
			String inputTagName = inputTagNames.next();
			
			//다중 첨부
			if(inputTagName.equals("subImg")) {
				List<MultipartFile> fileList = multi.getFiles(inputTagName);
				
				for(MultipartFile file : fileList) {
					//원본 파일명
					String originFileName = file.getOriginalFilename();
					
					//첨부할 파일명
					String attachedFileName = System.currentTimeMillis() + "_" + originFileName;
					
					try {
						file.transferTo(new File(uploadPath + attachedFileName));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			//단일 첨부
			else{
				//name이 "mainImg"인 input태그의 파일 정보를 가져옴 
				MultipartFile file = multi.getFile(inputTagName);
				
				//첨부하고자 하는 파일명
				String originFileName = file.getOriginalFilename();
				
				//첨부할 파일명
				String attachedFileName = System.currentTimeMillis() + "_" + originFileName;
				
				//파일 업로드
				//매개변수로 경로 및 파일명을 넣어줌
				try {
					file.transferTo(new File(uploadPath + attachedFileName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		//-----------------------이미지 첨부 끝--------------------------
		
		//상품 정보를 INSERT(SHOP_ITEM)
		//adminService.insertItem(itemVO);
		
		//상품 이미지 정보 INSERT(ITEM_IMAGE)
		
		
		return "redirect:/admin/regItem?menuCode=MENU_001&subMenuCode=SUB_MENU_002";
	}

	//상품관리 페이지로 이동
	@GetMapping("/itemManage")
	public String itemManage(Model model, String menuCode, String subMenuCode) {
		//관리자 메뉴 목록 조회
		model.addAttribute("menuList",adminService.selectMenuList());
		
		//상품관리 메뉴의 하위메뉴 목록 조회
		model.addAttribute("subMenuList", adminService.selectSubMenuList(menuCode));
		
		model.addAttribute("selectedMenu", menuCode); //MENU_001
		model.addAttribute("selectedSubMenu", subMenuCode);
		
		return "admin/item_manage";
	}
	
	//회원목록 페이지로 이동
	@GetMapping("/memberList")
	public String memberList(Model model, String menuCode, String subMenuCode) {
		//관리자 메뉴 목록 조회
		model.addAttribute("menuList",adminService.selectMenuList());
		
		if(subMenuCode == null) {
			subMenuCode = "SUB_MENU_004";
		}
		
		//상품관리 메뉴의 하위메뉴 목록 조회
		model.addAttribute("subMenuList", adminService.selectSubMenuList(menuCode));
		
		model.addAttribute("selectedMenu", menuCode);
		model.addAttribute("selectedSubMenu", subMenuCode);
		return "admin/member_list";
	}
}
