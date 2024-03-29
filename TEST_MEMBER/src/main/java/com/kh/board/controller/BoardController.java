package com.kh.board.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.board.service.BoardService;
import com.kh.board.vo.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Resource(name="boardService")
	private BoardService boardService;
	
	@GetMapping("/boardList")
	public String boardList(Model model) {
		model.addAttribute("memberList", boardService.selectMemberInfoList());
		return "board_list";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, MemberVO memberVO, Model model) {
		MemberVO result = boardService.selectLogin(memberVO);
		model.addAttribute("result", result);
		
		if(result != null) {
			session.setAttribute("loginInfo", result);
		}

		return "login_result";
	}
	
	@GetMapping("/adminMenu")
	public String adminMenu() {
		return "admin";
	}
	
}














