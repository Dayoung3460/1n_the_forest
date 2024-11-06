package com.intheforest.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intheforest.common.DataSource;
import com.intheforest.mapper.BookMapper;
import com.intheforest.vo.BookVO;

public class BookServiceImpl implements BookService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	BookMapper mapper = sqlSession.getMapper(BookMapper.class);

	@Override
	public List<BookVO> siteList(){
		return mapper.siteList();
	}
	
	@Override
	public List<BookVO> siteListAdmin(){
		return mapper.siteListAdmin();
	}
	
	@Override
	public int bookLast(){
		return mapper.bookLast();
	}
	
	@Override
	public List<BookVO> optionList(){
		return mapper.optionList();
	}
	
	@Override
	public BookVO selectBook(int bookNo) {
		return mapper.selectBook(bookNo);
	}
	
	@Override
	public List<String> selectBookOption(int bookNo) {
		return mapper.selectBookOption(bookNo);
	}
	
	@Override
	public BookVO selectSite(String siteNo){
		return mapper.selectSite(siteNo);
	}
	
	@Override
	public int selectBookDate(int siteNo, String startDate){
		return mapper.selectSiteDate(siteNo, startDate);
	}
	
	@Override
	public int selectBookTerm(int siteNo, String startDate, String endDate){
		return mapper.selectSiteTerm(siteNo, startDate, endDate);
	}
	
	//등록
	@Override
	public boolean registerBook(BookVO book) {
		return mapper.insertBook(book) == 1;
	}
	
	//등록
	@Override
	public boolean registerBookOption(BookVO bookOption) {
		return mapper.insertBookOption(bookOption) == 1;
	}
	
	//취소
	@Override
	public int cancelBook(int bookNo) {
		return mapper.cancelBook(bookNo);
	}
	
	//옵션 가격 수정
	@Override
	public int modifyOptPrice(int price, int optNo) {
		return mapper.modifyOptionPrice(price, optNo);
	}
	
	//취소
	@Override
	public int siteUse(int siteNo, String useFlag) {
		return mapper.siteUse(siteNo, useFlag);
	}
}