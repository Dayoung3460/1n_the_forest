package com.intheforest.control.site;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;

public class MainPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    BoardService svc = new BoardServiceImpl();
	    
	    SearchDTO search = new SearchDTO();
	    search.setCurrentPage("1");
	    
	    List<BoardVO> list = svc.boardListByPage(search);
	    
	    req.setAttribute("boardList", list);
		req.getRequestDispatcher("main.tiles").forward(req, resp);
	}

}
