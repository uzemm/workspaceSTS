package com.kh.shop.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shop.vo.CartVO;
import com.kh.shop.vo.CartViewVO;
import com.kh.shop.vo.ItemVO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertCart(CartVO cartVO) {
		sqlSession.insert("cartMapper.insertCart", cartVO);
	}

	@Override
	public List<CartViewVO> selectCartList(String memId) {
		return sqlSession.selectList("cartMapper.selectCartList", memId);
	}


}
