package com.kh.spring.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kh.spring.vo.MemberVO;
import com.kh.spring.vo.SecurityVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void join(MemberVO memberVO) {
		sqlSession.insert("memberMapper.join", memberVO);
	}

	@Override
	public MemberVO login(String memId) {
		return sqlSession.selectOne("memberMapper.login", memId);
	}

	@Override
	//실제 시큐리티를 사용해서 구현하는 로그인 메소드
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		//디비에서 로그인 시도하는 사용자의 정보를 조회
		MemberVO vo = login(username);
		
		//그 정보를 SecurityVO에 넣어줌.
		SecurityVO sVO = new SecurityVO();
		sVO.setUsername(vo.getMemId());
		sVO.setPassword(vo.getMemPw());
		
		//SecurityVO에 해당 사용자의 권한 정보도 넣어줌
		
		//그 SecurityVO를 리턴
		
		return null;
	}

}
