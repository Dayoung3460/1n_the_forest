package com.intheforest.service;

import java.util.List;

import com.intheforest.vo.BookVO;

public interface BookService {	
	List<BookVO> siteList();
	List<BookVO> siteListAdmin();
	int bookLast();
	List<BookVO> optionList();
	
	//상세조회
	BookVO selectBook(int bookNo);
	List<String> selectBookOption(int bookNo);
	BookVO selectSite(String siteNo);
	int selectBookDate(int siteNo, String startDate);
	int selectBookTerm(int siteNo, String startDate, String endDate);
	
	// 등록(삽입)
	boolean registerBook(BookVO book);
	boolean registerBookOption(BookVO bookOption);
	
	//취소
	int cancelBook(int bookNo);
	
	//옵션 가격 수정
	int modifyOptPrice(int price, int optNo);
	int siteUse(int siteNo, String useFlag);
}