package com.kh.library.club.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.library.club.service.ClubService;
import com.kh.library.club.vo.ClubVO;

@Controller
@RequestMapping("/club")
public class ClubController {
	@Resource(name = "clubService")
	private ClubService clubService;

	@GetMapping("/clubList")
	public String clubList() {
		
		return "club/club_list";
	}
	
	@GetMapping("/clubAdmin")
	public String clubAdmin() {
		
		return "club/club_manage";
	}
	
	@GetMapping("/clubCreate")
	public String clubCreate() {
		return "club/club_create";
	}
	
	@PostMapping("/clubCreate")
	public String clubCreate(ClubVO clubVO) {
		clubService.insertClubCreate(clubVO);
		return "redirect:/club/clubList";
	}
}
