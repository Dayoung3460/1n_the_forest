package com.intheforest.service;

import java.security.SecureRandom;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intheforest.common.DataSource;
import com.intheforest.common.SearchDTO;
import com.intheforest.mapper.MemberMapper;
import com.intheforest.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	
	@Override
	public List<MemberVO> memberList(SearchDTO search) {
		return mapper.listMember(search);
	}
	@Override
	public int totalCnt(SearchDTO search) {
		return mapper.totalCount(search);
	}
	@Override
	public MemberVO memberLogin(String memberId, String password) {
		return mapper.loginMember(memberId, password);
	}
	@Override
	public boolean addMember(MemberVO member) {
		return mapper.insertMember(member)==1;
	}
	
	@Override
	public MemberVO searchMember(String memberId) {
		return mapper.searchMember(memberId);
	}
	@Override
	public int pwCheck(MemberVO member) {
		return mapper.pwCheck(member);
	}
	@Override
	public void pwUpdate(MemberVO member) {
		mapper.pwUpdate(member);
	}
	//임시비밀번호 랜덤으로 만들기
	public String generateRdPw(){
		int length = 8;
		SecureRandom random = new SecureRandom();
		StringBuilder sb = new StringBuilder();
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!#&*";
		
		for(int i=0; i<length; i++) {
			int index = random.nextInt(chars.length());
			sb.append(chars.charAt(index));
		}
		return sb.toString();
		
	}
	
	@Override
	public int checkId(String memberId) {
		return mapper.checkId(memberId);
	}
	
	
	@Override
	public boolean modifyJoin(MemberVO member) {
		return mapper.updateJoin(member)==1;
	}
	@Override
	public boolean removeJoin(String memberId) {
		return mapper.removeJoin(memberId)==1;
	}
	@Override
	public String findMemberId(String memberName, String email) {
		return mapper.findMemberId(memberName, email);
	}
	
	
	
}

