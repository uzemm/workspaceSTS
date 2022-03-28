package com.kh.shop.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.shop.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Resource(name = "studentService")
	private StudentService studentService;
	
	@GetMapping("/studentList")
	public String studentList(Model model) {
		model.addAttribute("classList", studentService.selectClass());
		model.addAttribute("studentList", studentService.selectStudent());
		return "student_manage";
	}
}
