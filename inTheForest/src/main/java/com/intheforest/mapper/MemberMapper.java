package com.intheforest.mapper;

import org.apache.ibatis.annotations.Param;

import com.intheforest.vo.MemberVO;

public interface MemberMapper{
	//id.password조회 (로그인)
	public MemberVO loginMember(@Param("memberId")String memberId,@Param("password")String password);
	
	//회원추가
	public int insertMember(MemberVO member);
	
	//아이디체크 
	public MemberVO findMemberId(@Param("memberId")String memberId, @Param("memberName")String memberName);
	
}
