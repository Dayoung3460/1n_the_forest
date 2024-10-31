package com.intheforest.service;

import com.intheforest.vo.MemberVO;

public interface MemberService {
	
	//로그인 
	MemberVO MemberLogin(String memberId ,String password);
	

}
