package com.kh.library.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.library.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//-----------------회원가입-------------//
	//아이디 중복 체크
	@Override
	public int checkId(String memId) {
		int cnt = sqlSession.selectOne("memberMapper.checkId", memId);
		return cnt;
	}

	//회원가입
	@Override
	public void joinMember(MemberVO memberVO) {
		sqlSession.insert("memberMapper.join", memberVO);
	}
	
	//-----------------로그인-------------//
	//로그인
	@Override
	public MemberVO login(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.login", memberVO);
	}
	//아이디 찾기
	@Override
	public String findId(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.findId", memberVO);
	}
	// 비밀번호찾기 : 임시 비번 발송 위한 이메일 조회
	@Override
	public String selectEmail(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.selectEmail", memberVO);
	}

	@Override
	public void updateTempPwd(MemberVO memberVO) {
		sqlSession.update("memberMapper.updateTempPwd", memberVO);
	}

	@Override
	public MemberVO selectMyPageDetail(String memId) {
		return sqlSession.selectOne("memberMapper.selectMyPageDetail", memId);
	}
}
