package com.intheforest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intheforest.vo.MyBookVO;

public interface MyBookMapper {
	List<MyBookVO> selectMyPageBookList(String bookNo);
	
	//페이지 네이션
	//글목록
	List<MyBookVO> listWithPage(@Param("searchCondition") String searchCondition, @Param("keyword") String keyword, 
								@Param("currentPage") String currentPage, @Param("memberId") String memberId);
	//페이징 계산 건수 체크
	int selectCount(@Param("searchCondition") String searchCondition, @Param("keyword") String keyword, 
					@Param("memberId") String memberId);
	
	
	
	
}




