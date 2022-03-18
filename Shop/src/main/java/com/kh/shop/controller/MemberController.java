package com.kh.shop.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kh.shop.service.MemberService;
import com.kh.shop.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@PostMapping("/join")
	public String join(MemberVO meberVO) {
		memberService.insertJoin(meberVO);
		return "redirect:/item/itemList";
	}
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession session) {
		MemberVO result = memberService.selectLogin(memberVO);
		
		if(result != null) {
			session.setAttribute("loginInfo", result);
		}
		
		return "redirect:/item/itemList";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/item/itemList";
	}
}
