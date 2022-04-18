package com.kh.library.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.library.member.service.MemberService;
import com.kh.library.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	//--------------회원가입---------------
	//회원가입창 이동
	@GetMapping("/join")
	public String joinForm() {
		return "member/join_form";
	}
	//아이디 중복 체크
	@ResponseBody
	@PostMapping("/checkId")
	public int checkId(String memId) {
		return memberService.checkId(memId);
	}
	//가입
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@join");
		memberVO.setMemTell(memberVO.getMemTell().replace(",", "="));
		memberVO.setMemAddr(memberVO.getMemAddr());
		memberService.joinMember(memberVO);
		return "redirect:";
	}
	
	//----------------로그인-----------------
	//로그인창 이동
	@GetMapping("/login")
	public String loginForm() {
		return "member/login_form";
	}
	//로그인
	@ResponseBody
	@PostMapping("/login")
	public int login(MemberVO memberVO, HttpSession session) {
		MemberVO loginMem = memberService.login(memberVO);
		System.out.println("@@@@@@@@@@@@@@@@2" + loginMem);
		int result = 1;
		if(loginMem != null) {
			session.setAttribute("loginInfo", loginMem);
			result = 0;
		}
		System.out.println("@@@@@@@@@@@@@" + result);
		return result; //메인 화면 경로 정하기
	}
	
	//---------------마이페이지---------------
	//마이페이지 이동
	@GetMapping("/myPage")
	public String myPage() {
		return "member/my_page";
	}
	//대출 리스트 상세
	@GetMapping("/reserveListDetail")
	public String reserveListDetail() {
		return "member/reserveList_detail";
	}
	
}
