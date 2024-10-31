package com.intheforest.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;	
import com.intheforest.common.DataSource;
import com.intheforest.mapper.BookMapper;
import com.intheforest.vo.BookVO;

public class AppTest {
	public static void main(String[] args) {
		SqlSession sqlSession = DataSource.getInstance().openSession();
		BookMapper mapper = sqlSession.getMapper(BookMapper.class);
		
		List<BookVO> list = mapper.selectMyPageBookList("mid901");
		System.out.println(list);
	}
}
