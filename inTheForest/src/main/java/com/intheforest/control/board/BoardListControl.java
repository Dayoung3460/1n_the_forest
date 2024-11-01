package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.common.PageDTO;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BoardListControl implements Control {
  
  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String searchCondition = req.getParameter("searchCondition") == null ? "" : req.getParameter("searchCondition");
    String keyword = req.getParameter("keyword") == null ? "" : req.getParameter("keyword");
    String currentPage = req.getParameter("currentPage") == null ? "1" : req.getParameter("currentPage");
    
    SearchDTO search = new SearchDTO();
    search.setCurrentPage(currentPage);
    search.setSearchCondition(searchCondition);
    search.setKeyword(keyword);
    
    BoardService svc = new BoardServiceImpl();
    
    
    List<BoardVO> list = svc.boardListByPage(search);
    
    int totalCount = svc.boardTotalCount(search);
    
    req.setAttribute("search", search);
    req.setAttribute("boardList", list);
    req.setAttribute("paging", new PageDTO(Integer.parseInt(currentPage), totalCount));
    req.getRequestDispatcher("board/boardList.tiles").forward(req, resp);
  }
  
}