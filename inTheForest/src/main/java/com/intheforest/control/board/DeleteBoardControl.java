package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.BoardServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteBoardControl implements Control {

  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    int bno = Integer.parseInt(req.getParameter("bno"));
    String currentPage = req.getParameter("currentPage");
    String searchCondition = req.getParameter("searchCondition");
    String keyword = req.getParameter("keyword");
    String isConfirmed = (String) req.getParameter("confirm");

    SearchDTO search = new SearchDTO();
    search.setCurrentPage(currentPage);
    search.setSearchCondition(searchCondition);
    search.setKeyword(keyword);

    if (isConfirmed == null) {
      req.setAttribute("bno", bno);
      req.setAttribute("search", search);

      req.getRequestDispatcher("board/boardDelete.tiles").forward(req, resp);
    } else {
      BoardServiceImpl boardServiceImpl = new BoardServiceImpl();
      boolean isSuccess = boardServiceImpl.removeBoard(bno);
      if (isSuccess) {
        String redirectPage = "boardList.do?currentPage=" + currentPage + "&searchCondition=" + searchCondition + "&keyword=" + keyword;
        resp.sendRedirect(redirectPage);
      } else {
        req.setAttribute("msg", "삭제하는 중 오류가 발생했습니다.");
        req.getRequestDispatcher("board/boardDelete.tiles").forward(req, resp);
      }
    }

  }}