package com.intheforest.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intheforest.common.DataSource;
import com.intheforest.common.SearchDTO;
import com.intheforest.mapper.MyBookMapper;
import com.intheforest.vo.MyBookVO;

public class MyBookServiceImpl implements MyBookService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MyBookMapper mapper = sqlSession.getMapper(MyBookMapper.class);
	
	@Override
	public List<MyBookVO> myPageBookList(SearchDTO search) {
		return mapper.listWithPage(search);
	}

	@Override
	public int getTotalCount(SearchDTO search) {
		return mapper.selectCount(search);
	}
}
