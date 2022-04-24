package com.kh.emp.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.emp.vo.DeptVO;
import com.kh.emp.vo.EmpVO;

@Service("empService")
public class EmpServiceImpl implements EmpService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertDept(DeptVO deptVO) {
		sqlSession.insert("empMapper.insertDept", deptVO);
	}

	@Override
	public List<DeptVO> selectDeptList() {
		return sqlSession.selectList("empMapper.selectDeptList");
	}

	@Override
	public void insertRegEmp(EmpVO empVO) {
		sqlSession.insert("empMapper.insertRegEmp", empVO);
	}

	@Override
	public List<EmpVO> selectEmpList() {
		return sqlSession.selectList("empMapper.selectEmpList");
	}

}
