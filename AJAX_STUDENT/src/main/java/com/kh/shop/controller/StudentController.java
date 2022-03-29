package com.kh.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.shop.service.StudentService;
import com.kh.shop.vo.ClassVO;
import com.kh.shop.vo.StudentVO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Resource(name = "studentService")
	private StudentService studentService;
	
	@GetMapping("/studentList")
	public String studentList(Model model, ClassVO classVO) {
		model.addAttribute("classList", studentService.selectClass());
		model.addAttribute("studentList", studentService.selectStudent(classVO));
		
		return "student_manage";
	}
	
	@ResponseBody
	@PostMapping("/studentListAjax")
	public List<StudentVO> studentListAjax(ClassVO classVO) {
		List<StudentVO> list = studentService.selectStudent(classVO);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/stuDetail")
	public StudentVO stuDetail(String stuNum) {
		StudentVO stu = studentService.selectStuDetail(stuNum);
		return stu;
	}
}
