package com.kh.library.club.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.library.club.vo.ClubVO;

@Service("clubService")
public class ClubServiceImpl implements ClubService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertClubCreate(ClubVO clubVO) {
		sqlSession.insert("clubMapper.insertClubCreate", clubVO);
	}

}
