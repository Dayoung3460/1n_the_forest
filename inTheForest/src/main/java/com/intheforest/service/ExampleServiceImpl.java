package com.intheforest.service;

import org.apache.ibatis.session.SqlSession;

import com.intheforest.common.DataSource;
import com.intheforest.mapper.ExampleMapper;

public class ExampleServiceImpl implements ExampleService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ExampleMapper mapper = sqlSession.getMapper(ExampleMapper.class);

}
