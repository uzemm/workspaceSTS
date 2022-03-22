package com.kh.shop.service;

import java.util.List;

import com.kh.shop.vo.ItemVO;
import com.kh.shop.vo.MenuVO;
import com.kh.shop.vo.SubMenuVO;

public interface AdminService {

	//상품 등록
	void insertItem(ItemVO itemVO);
	
	//관리자 메뉴 목록 조회
	List<MenuVO> selectMenuList();
	
	//하위 메뉴 목록 조회 
	List<SubMenuVO> selectSubMenuList(String menuCode);
}
