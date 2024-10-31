package com.intheforest.mapper;

import java.util.List;

import com.intheforest.vo.BookVO;

public interface BookMapper {
	List<BookVO> selectMyPageBookList(String memberId);
}




