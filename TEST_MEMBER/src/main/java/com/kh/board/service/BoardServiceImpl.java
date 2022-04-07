package com.kh.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.board.vo.MemberVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberVO> selectMemberInfoList() {
		return sqlSession.selectList("boardMapper.selectMemberInfoList");
	}

	@Override
	public MemberVO selectLogin(MemberVO memberVO) {
		return sqlSession.selectOne("boardMapper.selectLogin", memberVO);
	}

}
