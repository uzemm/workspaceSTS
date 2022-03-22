package com.kh.shop.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shop.vo.ItemVO;
import com.kh.shop.vo.MenuVO;
import com.kh.shop.vo.SubMenuVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public void insertItem(ItemVO itemVO) {
		sqlSession.insert("adminMapper.insertItem", itemVO);
	}

	@Override
	public List<MenuVO> selectMenuList() {
		return sqlSession.selectList("adminMapper.selectMenuList");
	}

	@Override
	public List<SubMenuVO> selectSubMenuList(String menuCode) {
		return sqlSession.selectList("adminMapper.selectSubMenuList", menuCode);
	}




}
