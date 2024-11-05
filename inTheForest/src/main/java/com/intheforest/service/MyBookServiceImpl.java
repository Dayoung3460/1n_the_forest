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
	public List<MyBookVO> myPageBookList(SearchDTO search, String memberId) {
		return mapper.listWithPage(search.getSearchCondition(), search.getKeyword(),
									search.getCurrentPage(), memberId);
	}

	@Override
	public int getTotalCount(SearchDTO search, String memberId) {
		return mapper.selectCount(search.getSearchCondition(), search.getKeyword(),
									memberId);
	}
}
