package com.intheforest.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intheforest.common.DataSource;
import com.intheforest.common.SearchDTO;
import com.intheforest.mapper.MemberMapper;
import com.intheforest.mapper.MyBookMapper;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;
import com.intheforest.vo.MemberVO;
import com.intheforest.vo.MyBookVO;

public class AppTest {
	public static void main(String[] args) {
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
		MyBookMapper mapper = sqlSession.getMapper(MyBookMapper.class);

		List<MyBookVO> list = mapper.selectMyPageBookList("mid901");
		System.out.println(list);

		MemberMapper mapper2 = sqlSession.getMapper(MemberMapper.class);
		int count = mapper2.checkId("test");
		System.out.println(count);
		

	}
}
