package com.intheforest.service;

import java.util.List;

import com.intheforest.vo.BookVO;

public interface BookService {	
	List<BookVO> siteList();
	List<BookVO> optionList();
	
	//상세조회
	BookVO selectSite(String siteNo);
	BookVO selectBookDate(String siteNo, String startDate, String endDate);
	
	// 등록(삽입)
	boolean registerBook(BookVO book);
}