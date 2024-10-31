package com.intheforest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intheforest.vo.BookVO;

public interface BookMapper {
	List<BookVO> selectMyPageBookList(String memberId);
}




