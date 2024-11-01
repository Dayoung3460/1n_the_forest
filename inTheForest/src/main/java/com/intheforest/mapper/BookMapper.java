package com.intheforest.mapper;
import java.util.List;

import com.intheforest.vo.BookVO;

public interface BookMapper {
	List<BookVO> siteList();
	List<BookVO> optionList();
	BookVO selectSite(String siteNo);
	BookVO selectSite(String siteNo, String startDate, String endDate);
	
	// 게시글 등록 
	int insertBook(BookVO book);
}