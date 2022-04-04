package com.kh.board.controller;

import javax.annotation.Resource;

//import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.board.service.BoardService;
import com.kh.board.vo.BoardVO;

import oracle.jdbc.proxy.annotation.Post;

//import com.kh.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@GetMapping("/boardList")
	public String boardList(Model model) {
		model.addAttribute("boardList", boardService.selectBoardList());
		return "board_list";
	}
	
	@GetMapping("/boardWriteForm")
	public String boardWriteForm() {
		
		return "board_write";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite(BoardVO boardVO) {
		boardService.insertBoard(boardVO);
		return "redirect:/board/boardList";
	}
	
	@GetMapping("/boardDetail")
	public String boardDetail(int boardNum, Model model) {
		model.addAttribute("board", boardService.selectBoardDetail(boardNum));
		return "board_detail";
	}
}














