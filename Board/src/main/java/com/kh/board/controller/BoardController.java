package com.kh.board.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kh.board.service.BoardService;
import com.kh.board.service.BoardServiceImpl;
import com.kh.board.vo.BoardVO;

//@Controller 어노테이션의 역할 
//1. 해당 클래스를 controller 인식
@Controller
//@RequestMapping("/board")
//요청 경로가 /board로 시작하면 BoardController 실행
@RequestMapping("/board")
public class BoardController {
	//boardService으로 이름으로 만들어진 객체를 가져오겠다.
	@Resource(name= "boardService")
	private BoardService boardService;
	
	//게시글 목록 페이지로 이동
	@GetMapping("/boardList")
	public String boardList(Model model) {
		List<BoardVO> list = boardService.selectBoardList();
		model.addAttribute("boardList", list);
		return "board_list"; // //WEB-INF/views/board_list.jsp
	}
	@GetMapping("/boardWrite")
	public String goBoardWrite() {
		return "board_write";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite(BoardVO boardVO) {
		boardService.insertBoard(boardVO);
		
		//컨트롤러에서 컨트롤러로 이동 시 
		return "redirect:/board/boardList";
	}
	
	@GetMapping("/boardDetail")
	public String boardDetail(int boardNum, Model model) {
		model.addAttribute("board", boardService.boardDetail(boardNum));
		return "board_detail";
	}
	
	
}
