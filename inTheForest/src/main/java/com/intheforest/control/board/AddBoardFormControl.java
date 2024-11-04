package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
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
    }
    
    req.getRequestDispatcher("board/boardAddForm.tiles").forward(req, resp);
    
  }
  
}