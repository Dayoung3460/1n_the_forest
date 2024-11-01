package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BoardControl implements Control {
  
  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String bno = req.getParameter("bno");
    String currentPage = req.getParameter("currentPage");
    String searchCondition = req.getParameter("searchCondition");
    String keyword = req.getParameter("keyword");
    String category = req.getParameter("category");
    
    BoardService svc = new BoardServiceImpl();
    BoardVO board = svc.searchBoard(Integer.parseInt(bno));
    
    req.setAttribute("board", board);
    
    SearchDTO search = new SearchDTO();
    search.setCurrentPage(currentPage);
    search.setSearchCondition(searchCondition);
    search.setKeyword(keyword);
    search.setCategory(category);
    
    req.setAttribute("search", search);
    req.setAttribute("category", category);
    
    req.getRequestDispatcher("board/board.tiles").forward(req, resp);
    
    
  }
  
}