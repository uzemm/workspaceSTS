package com.kh.shop.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shop.vo.CategoryVO;


@Service("itemService")
public class ItemServiceImpl implements ItemService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CategoryVO> selectCategoryList() {

		return sqlSession.selectList("itemMapper.selectCategoryList");
	}


	
}
