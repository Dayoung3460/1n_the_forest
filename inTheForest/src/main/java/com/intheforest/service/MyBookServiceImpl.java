package com.intheforest.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intheforest.common.DataSource;
import com.intheforest.mapper.MyBookMapper;
import com.intheforest.vo.MyBookVO;

public class MyBookServiceImpl implements MyBookService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MyBookMapper mapper = sqlSession.getMapper(MyBookMapper.class);
	
	@Override
	public List<MyBookVO> myPageBookList(String bookNo) {
		return mapper.selectMyPageBookList(bookNo);
	}

}
