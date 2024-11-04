package com.intheforest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intheforest.common.SearchDTO;
import com.intheforest.vo.MemberVO;

public interface MemberMapper{
	//회원목록 조회
	public List<MemberVO> listMember(SearchDTO search);
	
	//전체 회원 수
	public int totalCount();
	
	
	//id.password조회 (로그인)
	public MemberVO loginMember(@Param("memberId")String memberId,@Param("password")String password);
	
	//회원추가
	public int insertMember(MemberVO member);

	
	//아이디체크 
	public MemberVO findMemberId(@Param("memberName")String memberName,@Param("email")String email);
	
	// 아이디로 회원 정보 조회
	MemberVO searchMember(String memberId);
	
	//비밀번호체크
	public int pwCheck(MemberVO member);
	
	//임시비밀번호로비번저장
	public int pwUpdate(MemberVO member);
	
	//아이디중복체크
	int checkId(String memberId);
	
	//회원정보 수정 
	int updateJoin(MemberVO member);
	
	//회원정보 삭제 (quit 1로 변경)
	int removeJoin(String memberId);
	
}
