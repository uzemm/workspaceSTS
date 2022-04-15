package com.kh.library.club.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("/club")
public class ClubController {

	@GetMapping("/clubList")
	public String clubList() {
		
		return "club/club_list";
	}
	
	@GetMapping("/clubAdmin")
	public String clubAdmin() {
		
		return "club/club_manage";
	}
}
