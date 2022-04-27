package com.kh.spring.service;

import com.kh.spring.vo.MemberVO;

public interface MemberService {
	
	void join(MemberVO memberVO);

	MemberVO login(MemberVO memberVO);
}
