package com.kh.shop.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.shop.service.ItemService;
import com.kh.shop.vo.CategoryVO;
import com.kh.shop.vo.ItemVO;

@Controller
@RequestMapping("/item")
public class ItemController {
	@Resource(name = "itemService")
	private ItemService itemService;
	
	@GetMapping("/itemList")
	public String itemList(Model model, String cateCode) {
		//카테고리 목록
		model.addAttribute("categoryList", itemService.selectCategoryList());
		
		//메뉴에서 클릭한 카테고리의 코드값
		model.addAttribute("selectedCategory", cateCode);
		
		//아이템 목록
		model.addAttribute("itemList", itemService.selectItemList());
		return "item/item_list";
	}
	
}
