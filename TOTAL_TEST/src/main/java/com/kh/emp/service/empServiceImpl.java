package com.kh.emp.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.emp.vo.MenuVO;

@Service("empService")
public class empServiceImpl implements empService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MenuVO> selectMenu() {
		return sqlSession.selectList("empMapper.selectMenu");
	}

}
