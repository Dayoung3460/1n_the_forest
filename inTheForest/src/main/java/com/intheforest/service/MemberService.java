package com.intheforest.service;

import com.intheforest.vo.MemberVO;

public interface MemberService {
	
	//로그인 
	MemberVO memberLogin(String memberId ,String password);
	
	//회원가입 
	boolean addMember(MemberVO member);
	
	//아이디체크 
	MemberVO findMemberId(String memberName ,String email);
	
	

}
