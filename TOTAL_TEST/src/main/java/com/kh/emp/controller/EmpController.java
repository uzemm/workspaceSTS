package com.kh.emp.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.emp.service.empService;

@Controller
@RequestMapping("/emp")
public class EmpController {
	@Resource(name="empService")
	private empService empService;
	
	@GetMapping("/deptHome")
	public String deptHome(Model model) {
		model.addAttribute("menuList", empService.selectMenu());
		return "dept_home";
	}
	
}














