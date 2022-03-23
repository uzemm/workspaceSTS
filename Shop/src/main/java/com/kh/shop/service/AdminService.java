package com.kh.shop.service;

import java.util.List;

import com.kh.shop.vo.ImgVO;
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
	
	//상품 이미지 정보 등록
	void insertImages(ImgVO imgVO);
	
	//다음에 들어갈 IMG_CODE 조회
	int selectNextImgCode();
	
	//다음에 들어갈 ITEM_CODE 조회
	String selectNextItemCode();
}
