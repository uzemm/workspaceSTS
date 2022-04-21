package com.kh.vaildation.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.vaildation.vo.MemberVO;

@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@GetMapping("/insertForm")
	public String insertForm() {
		
		return "insert_form";
	}
	
	@PostMapping("/insert")
	public String insert(MemberVO memberVO) {
		System.out.println("회원을 등록합니다.");
		return "";
	}
	
	//
	@GetMapping("/securityTest")//pw : oracle
	public String securityTest(MemberVO memberVO) {
		memberVO.setPw("oracle");
		//비밀번호 암호화
		String encodePw = pwEncoder.encode(memberVO.getPw());
		//System.out.println(encodePw);
		memberVO.setPw(encodePw);
		//memberService.insertMember(memberVO);
		
		pwEncoder.matches("oracle", "암호화된 비밀번호(디비에 저장된 비번)");
		
		return "";
	}
}
