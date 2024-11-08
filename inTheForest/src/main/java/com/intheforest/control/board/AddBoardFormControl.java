package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.service.*;
import com.intheforest.vo.BookVO;
import com.intheforest.vo.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class AddBoardFormControl implements Control {
  
  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String category = req.getParameter("category");
    String bookNo = req.getParameter("bookNo");
    String siteName = req.getParameter("siteName");
    req.setAttribute("category", category);
    
    MemberService MemberService = new MemberServiceImpl();
    HttpSession session = req.getSession();
    
    String memberId = (String) session.getAttribute("memberId");
    MemberVO member = MemberService.searchMember(memberId);
    req.setAttribute("member", member);
    
    if(category.equals("review")) {
      BoardServiceImpl boardService = new BoardServiceImpl();
      ArrayList<Integer> bookNoList = boardService.getBookNoByMemberId(memberId);
      if(!bookNoList.isEmpty()) {
        req.setAttribute("bookNoList", bookNoList);
      }
      
      // 예약 상세 페이지에서 넘어왔을 때
      if(bookNo != null) {
        BookService bookService = new BookServiceImpl();
        BookVO book = bookService.selectBook(Integer.parseInt(bookNo));
        req.setAttribute("book", book);
        req.setAttribute("siteName", siteName);
        req.setAttribute("bookNo", bookNo);
      }
      
    }
    
    req.getRequestDispatcher("board/boardAddForm.tiles").forward(req, resp);
    
  }
  
}