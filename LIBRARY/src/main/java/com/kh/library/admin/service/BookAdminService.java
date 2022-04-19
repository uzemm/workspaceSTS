package com.kh.library.admin.service;

import com.kh.library.book.vo.ImgVO;
import com.kh.library.book.vo.ReserveVO;
import com.kh.library.book.vo.BookVO;

public interface BookAdminService {

	//책 등록
	void insertBook(BookVO bookVO, ImgVO bookImgVO);
	
	//책 이미지 정보 등록
	void insertBookImages(ImgVO bookImgVO);
	
	//다음 이미지 코드 조회
	int selectNextImgCode();
	
	//다음 도서 코드 조회
	String selectNextBookCode();
	
	//책 대여
	void insertReserve(ReserveVO reserveVO);
}
