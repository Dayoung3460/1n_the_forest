package com.intheforest.service;

import org.apache.ibatis.session.SqlSession;

import com.intheforest.common.DataSource;
import com.intheforest.mapper.MemberMapper;
import com.intheforest.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	@Override
	public MemberVO MemberLogin(String memberId, String password) {
		return mapper.loginMember(memberId, password);
	}
			
	

}
