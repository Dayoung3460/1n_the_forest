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

public class ModifyBoardControl implements Control {
  
  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("utf-8");
    
    BoardVO board;
    int bno = Integer.parseInt(req.getParameter("bno"));
    String currentPage = req.getParameter("currentPage");
    String searchCondition = req.getParameter("searchCondition");
    String keyword = req.getParameter("keyword");
    String category = req.getParameter("category");
    
    SearchDTO search = new SearchDTO();
    search.setCurrentPage(currentPage);
    search.setSearchCondition(searchCondition);
    search.setKeyword(keyword);
    search.setCategory(category);
    
    BoardService svc = new BoardServiceImpl();
    
    
    if(req.getMethod().equals("GET")) {
      board = svc.searchBoard(bno);
      
      req.setAttribute("board", board);
      req.setAttribute("search", search);
      req.getRequestDispatcher("board/boardModifyForm.tiles").forward(req, resp);
    } else {
      board = new BoardVO();
      
      String title = req.getParameter("title");
      String content = req.getParameter("content");
      
      board.setBoardNo(bno);
      board.setTitle(title);
      board.setContent(content);
      
      boolean isSuccess = svc.modifyBoard(board);
      if(isSuccess) {
        System.out.println("currentPage = " + currentPage);
        System.out.println("searchCondition = " + searchCondition);
        System.out.println("keyword = " + keyword);
        System.out.println("category = " + category);
        
        String redirectPage = "boardList.do?currentPage=" + currentPage + "&searchCondition=" + searchCondition + "&keyword=" + keyword + "&category=" + category;
        resp.sendRedirect(redirectPage);
      } else {
        req.setAttribute("msg", "수정하는 중 오류가 발생했습니다.");
        req.getRequestDispatcher("board/boardModifyForm.tiles").forward(req, resp);
      }
    }
    
    
  }
  
}