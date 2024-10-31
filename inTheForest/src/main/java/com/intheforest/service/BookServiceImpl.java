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
	public List<BookVO> myPageBookList(String memberId) {
		return mapper.selectMyPageBookList(memberId);
	}

}
