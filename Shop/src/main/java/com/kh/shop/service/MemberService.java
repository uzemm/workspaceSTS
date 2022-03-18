package com.kh.shop.service;

import com.kh.shop.vo.MemberVO;

public interface MemberService {
	//회원가입
	void insertJoin(MemberVO memberVO);
	
	//로그인
	MemberVO selectLogin(MemberVO memberVO);
}
