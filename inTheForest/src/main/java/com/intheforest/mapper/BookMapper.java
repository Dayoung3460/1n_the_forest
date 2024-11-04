package com.intheforest.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intheforest.vo.BookVO;

public interface BookMapper {
	List<BookVO> siteList();
	List<BookVO> optionList();
	BookVO selectSite(String siteNo);
	int selectSiteDate(@Param("siteNo") int siteNo, @Param("startDate") String startDate);
	
	// 게시글 등록 
	int insertBook(BookVO book);
}