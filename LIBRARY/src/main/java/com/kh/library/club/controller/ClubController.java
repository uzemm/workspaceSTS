package com.kh.library.club.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.library.club.service.ClubService;
import com.kh.library.club.vo.ClubBoardVO;
import com.kh.library.club.vo.ClubVO;
import com.kh.library.member.vo.MemberVO;

@Controller
@RequestMapping("/club")
public class ClubController {
	@Resource(name = "clubService")
	private ClubService clubService;
	
	//북클럽 목록 조회
	@GetMapping("/clubList")
	public String clubList(Model model, HttpSession session, ClubVO clubVO) {
		model.addAttribute("clubList", clubService.selectClubList());
		
		
		String memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		
		
		
		return "club/club_list";
	}
	
	//클럽관리
	@GetMapping("/clubAdmin")
	public String clubAdmin() {
		
		return "club/club_manage";
	}
	
	//북클럽 생성페이지 이동
	@GetMapping("/clubCreate")
	public String clubCreate(HttpSession session) {
		String memId = ((MemberVO)(session.getAttribute("loginInfo"))).getMemId();
		return "club/club_create";
	}
	//북클럽 생성
	@PostMapping("/clubCreate")
	public String clubCreate(ClubVO clubVO) {
		clubService.insertUpdateClubCreate(clubVO);
		return "redirect:/club/clubList";
	}
	//북클럽 상세조회
	@GetMapping("/clubDetail")
	public String clubDetail(ClubVO clubVO, Model model, String clubCOde) {
		model.addAttribute("club", clubService.selectClubDetail(clubVO));
		model.addAttribute("boardList", clubService.selectClubBoardList(clubVO));
		return "club/club_detail";
	}
	//북클럽 수정페이지 이동
	@GetMapping("/clubDetailUpdate")
	public String clubDetailUpdateWrite(ClubVO clubVO, Model model) {
		model.addAttribute("club", clubService.selectClubDetail(clubVO));
		return "club/club_detail_update";
	}
	//북클럽 수정
	@PostMapping("/clubDetailUpdate")
	public String clubDetailUpdate(ClubVO clubVO, Model model, String clubCode, RedirectAttributes redirectAttributes) {
		clubService.updateClubDetail(clubVO);
		redirectAttributes.addAttribute("clubCode", clubCode);
		return "redirect:/club/clubDetail";
	}
	//북클럽게시판 글쓰기 페이지 이동
	@GetMapping("/clubBoardWrite")
	public String clubBoardWrite(String clubCode, Model model) {
		model.addAttribute("clubCode", clubCode);
		return "club/club_board_write";
	}
	//게시글 등록
	@PostMapping("/regClubBoard")
	public String regClubBoard(ClubBoardVO clubBoardVO, String clubCode, RedirectAttributes redirectAttributes) {
		clubService.insertClubBoard(clubBoardVO);
		redirectAttributes.addAttribute("clubCode", clubCode);
		return "redirect:/club/clubDetail";
	}
	//게시글 상세조회
	@GetMapping("/clubBoardDetail")
	public String clubBoardDetail(Model model, ClubBoardVO clubBoardVO, String cbBoardNum) {
		model.addAttribute("clubBoard", clubService.selectClubBoardDetail(clubBoardVO));
		return "club/club_board_detail";
	}
	//게시글 수정 페이지 이동
	@GetMapping("/clubBoardUpdate")
	public String clubBoardUpdate(Model model, ClubBoardVO clubBoardVO) {
		model.addAttribute("clubBoard", clubService.selectClubBoardDetail(clubBoardVO));
		return "club/club_board_detail_update";
	}
	//게시글 수정
	@PostMapping("/clubBoardUpdate")
	public String clubBoardDetailUpdate(ClubBoardVO clubBoardVO, String cbBoardNum, RedirectAttributes redirectAttributes, String clubCode) {
		clubService.updateClubBoardDetail(clubBoardVO);
		redirectAttributes.addAttribute("clubCode", clubCode);
		redirectAttributes.addAttribute("cbBoardNum", cbBoardNum);
		return "redirect:/club/clubBoardDetail";
	}
	
	//게시글 삭제
	@GetMapping("/clubBoardDelete")
	public String clubBoardDelete(ClubBoardVO clubBoardVO, RedirectAttributes redirectAttributes, String clubCode) {
		clubService.deleteClubBoard(clubBoardVO);
		redirectAttributes.addAttribute("clubCode", clubCode);
		return "redirect:/club/clubDetail";
	}
	
	//댓등록
	@PostMapping("/clubBoardRegCmt")
	public String clubBoardRegCmt() {
		
		return "";
	}
	
}
