package com.kh.emp.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.emp.service.EmpService;
import com.kh.emp.vo.DeptVO;

@Controller
@RequestMapping("/emp")
public class EmpController {
	@Resource(name = "empService")
	private EmpService empService;
	
	@GetMapping("/deptHome")
	public String deptHome() {
		return "dept_home";
	}
	
	@GetMapping("/deptManage")
	public String deptManage(Model model) {
		model.addAttribute("deptList", empService.selectDeptList());
		return "dept_manage";
	}
	
	@PostMapping("/deptEnrollment")
	public String deptEnrollment(DeptVO deptVO) {
		empService.insertDept(deptVO);
		return "redirect:/emp/deptManage";
	}
	
	@GetMapping("/empWrite")
	public String empWrite(Model model) {
		model.addAttribute("deptList", empService.selectDeptList());
		return "emp_write";
	}
	
	@PostMapping("/empEnrollment")
	public String empEnrollment() {
		return "emp_list";
	}
}














