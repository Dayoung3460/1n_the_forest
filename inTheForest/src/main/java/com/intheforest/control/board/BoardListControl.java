package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.common.PageDTO;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.BoardVO;
import com.intheforest.vo.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BoardListControl implements Control {
  
  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String searchCondition = req.getParameter("searchCondition") == null ? "" : req.getParameter("searchCondition");
    String category = req.getParameter("category") == null ? "notice" : req.getParameter("category");
    String keyword = req.getParameter("keyword") == null ? "" : req.getParameter("keyword");
    String currentPage = req.getParameter("currentPage") == null ? "1" : req.getParameter("currentPage");
    
    BoardService boardService = new BoardServiceImpl();
    
    SearchDTO search = new SearchDTO();
    search.setCurrentPage(currentPage);
    search.setSearchCondition(searchCondition);
    search.setKeyword(keyword);
    search.setCategory(category);
    
    
    String bno = req.getParameter("bno");
    // 게시판 목록
    if(bno == null) {
      List<BoardVO> list = boardService.boardListByPage(search);
      int totalCount = boardService.boardTotalCount(search);
      
      MemberService MemberService = new MemberServiceImpl();
      HttpSession session = req.getSession();
      String memberId = (String) session.getAttribute("memberId");
      MemberVO member = MemberService.searchMember(memberId);
      
      if(category.equals("review")) {
        ArrayList<Integer> bookNoList = boardService.getBookNoByMemberId(memberId);
        if(!bookNoList.isEmpty()) {
          req.setAttribute("bookNoListSize", bookNoList.size());
        }
      }
      
      req.setAttribute("member", member);
      req.setAttribute("search", search);
      req.setAttribute("boardList", list);
      req.setAttribute("category", req.getParameter("category"));
      req.setAttribute("paging", new PageDTO(Integer.parseInt(currentPage), totalCount));
      
      req.getRequestDispatcher("board/boardList.tiles").forward(req, resp);
      
      // 글 삭제 후 게시판 목록으로 이동
    } else {
      boolean isSuccess = boardService.removeBoard(Integer.parseInt(bno));
      if (isSuccess) {
        String redirectPage = "boardList.do?currentPage=" + currentPage + "&searchCondition=" + searchCondition + "&keyword=" + keyword + "&category=" + category;
        resp.sendRedirect(redirectPage);
      }
    }
  }
}