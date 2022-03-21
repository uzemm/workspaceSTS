package com.kh.shop.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String categoryManage(Model model) {
		//관리자 메뉴 목록 조회
		model.addAttribute("menuList",adminService.selectMenuList());
		
		//상품관리 메뉴의 하위메뉴 목록 조회
		model.addAttribute("subMenuList", adminService.selectSubMenuList());
		
		return "admin/category_manage";
	}
	
	//상품등록 페이지로 이동
	@GetMapping("/regItem")
	public String regItem(Model model) {
		//카테고리 목록 조회
		model.addAttribute("categoryList", itemService.selectCategoryList());
		
		//관리자 메뉴 목록 조회
		model.addAttribute("menuList",adminService.selectMenuList());
		
		//상품관리 메뉴의 하위메뉴 목록 조회
		model.addAttribute("subMenuList", adminService.selectSubMenuList());
		
		return "admin/reg_item";
	}
	
	//상품등록
	@PostMapping("/regItem")
	public String regItem(ItemVO itemVO) {
		adminService.insertItem(itemVO);
		return "redirect:/admin/regItem";
	}

	//상품관리 페이지로 이동
	@GetMapping("/itemManage")
	public String itemManage(Model model) {
		//관리자 메뉴 목록 조회
		model.addAttribute("menuList",adminService.selectMenuList());
		
		//상품관리 메뉴의 하위메뉴 목록 조회
		model.addAttribute("subMenuList", adminService.selectSubMenuList());
		return "admin/item_manage";
	}
}
