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
	public List<BookVO> optionList(){
		return mapper.optionList();
	}
	
	@Override
	public BookVO selectSite(String siteNo){
		return mapper.selectSite(siteNo);
	}
	
	@Override
	public int selectBookDate(int siteNo, String startDate){
		return mapper.selectSiteDate(siteNo, startDate);
	}
	
	//등록
	@Override
	public boolean registerBook(BookVO book) {
		return mapper.insertBook(book) == 1;
	}
}