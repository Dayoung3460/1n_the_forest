package com.intheforest.service;

import com.intheforest.vo.MemberVO;

public interface MemberService {
	
	//로그인 
	MemberVO memberLogin(String memberId ,String password);
	
	//회원가입 
	boolean addMember(MemberVO member);
	
	//아이디체크 
	MemberVO findMemberId(String memberName ,String email);
	
	// 아이디로 회원 정보 조회
	MemberVO searchMember(String memberId);

}
