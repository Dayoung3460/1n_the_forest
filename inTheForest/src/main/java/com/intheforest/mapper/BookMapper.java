package com.intheforest.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intheforest.vo.BookVO;

public interface BookMapper {
	//예약 조회용
	BookVO selectBook(int bookNo);
	List<String> selectBookOption(int bookNo);
	
	//예약용
	List<BookVO> siteList();
	List<BookVO> siteListAdmin();
	int bookLast();
	List<BookVO> optionList();
	BookVO selectSite(String siteNo);
	int selectSiteDate(@Param("siteNo") int siteNo, @Param("startDate") String startDate);
	int selectSiteTerm(@Param("siteNo") int siteNo, @Param("startDate") String startDate, @Param("endDate") String endDate);
	 
	int insertBook(BookVO book);
	int insertBookOption(BookVO bookOption);
	int cancelBook(int bookNo);
	int modifyOptionPrice(@Param("newPrice") int newPrice, @Param("optionNo") int optionNo);
	
	int siteUse(@Param("siteNo") int siteNo, @Param("useFlag") String useFlag);
}