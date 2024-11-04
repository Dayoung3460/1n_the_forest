package com.intheforest.service;

import java.util.List;

import com.intheforest.vo.BookVO;

public interface BookService {	
	List<BookVO> siteList();
	int bookLast();
	List<BookVO> optionList();
	
	//상세조회
	BookVO selectBook(int bookNo);
	BookVO selectSite(String siteNo);
	int selectBookDate(int siteNo, String startDate);
	
	// 등록(삽입)
	boolean registerBook(BookVO book);
	boolean registerBookOption(BookVO book);
}