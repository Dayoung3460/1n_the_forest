package com.intheforest.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intheforest.common.DataSource;
import com.intheforest.common.SearchDTO;
import com.intheforest.mapper.MyBookMapper;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;


public class AppTest {
	public static void main(String[] args) {
		SqlSession sqlSession = DataSource.getInstance().openSession();
		MyBookMapper mapper = sqlSession.getMapper(MyBookMapper.class);
		
		
		//tttt
		
	    BoardService svc = new BoardServiceImpl();
	    
	    SearchDTO search = new SearchDTO();
	    search.setCurrentPage("1");
	    
	    List<BoardVO> list = svc.boardListByPage(search);
	    
	    
	    
	    System.out.println(list);

	}
}
