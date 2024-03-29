package com.kh.shop.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.shop.vo.BuyVO;
import com.kh.shop.vo.CartVO;

@Service("buyService")
public class BuyServiceImpl implements BuyService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectNextBuyNum() {
		return sqlSession.selectOne("buyMapper.selectNextBuyNum");
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void insertBuyItem(BuyVO buyVO, CartVO cartVO) {
		sqlSession.insert("buyMapper.insertBuyItem", buyVO);
		sqlSession.delete("cartMapper.deleteCarts", cartVO);
	}

}
