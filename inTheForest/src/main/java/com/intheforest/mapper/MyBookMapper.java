package com.intheforest.mapper;

import java.util.List;

import com.intheforest.common.SearchDTO;
import com.intheforest.vo.MyBookVO;

public interface MyBookMapper {
	List<MyBookVO> selectMyPageBookList(String bookNo);
	
	//페이지 네이션
	//글목록
	List<MyBookVO> listWithPage(SearchDTO search);
	//페이징 계산 건수 체크
	int selectCount(SearchDTO search);
	
	
	
	
}




