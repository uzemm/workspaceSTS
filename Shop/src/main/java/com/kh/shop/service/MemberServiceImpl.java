package com.kh.shop.service;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.shop.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertJoin(MemberVO memberVO) {
		sqlSession.insert("memberMapper.insertJoin", memberVO);
	}

	@Override
	public MemberVO selectLogin(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.selectLogin", memberVO);
	}
	
}
