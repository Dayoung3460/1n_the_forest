package com.intheforest.service;

import java.util.List;

import com.intheforest.common.SearchDTO;
import com.intheforest.vo.MemberVO;

public interface MemberService {
	//회원목록 조회
	List<MemberVO> memberList(SearchDTO search);
	
	//회원 수 조회
	int totalCnt();
	
	
	//로그인 
	MemberVO memberLogin(String memberId ,String password);
	
	//회원가입 
	boolean addMember(MemberVO member);
	
	//아이디체크 
	MemberVO findMemberId(String memberName ,String email);
	
	// 아이디로 회원 정보 조회
	MemberVO searchMember(String memberId);
	
	//비밀번호체크 
	int pwCheck(MemberVO member);
	
	//임시비밀번호로 비번 변경
	void pwUpdate(MemberVO member);
	
	//임시비밀번호 생성 
	String generateRdPw();
	
	//아이디중복체크 
	int checkId(String memberId);
	
	//회원정보 수정
	boolean modifyJoin(MemberVO member);

	

}
