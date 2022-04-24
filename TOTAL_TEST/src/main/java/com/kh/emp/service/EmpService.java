package com.kh.emp.service;

import java.util.List;

import com.kh.emp.vo.DeptVO;
import com.kh.emp.vo.EmpVO;

public interface EmpService {

	//부서등록
	void insertDept(DeptVO deptVO);
	//조회
	List<DeptVO> selectDeptList();
	
	void insertRegEmp(EmpVO empVO);
	
	List<EmpVO> selectEmpList();
}
