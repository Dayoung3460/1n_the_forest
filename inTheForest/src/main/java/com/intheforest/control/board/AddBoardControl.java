package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddBoardControl implements Control {
  
  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String savePath = req.getServletContext().getRealPath("image");
    int maxSize = 1024 * 1024 * 5;
    
    req.setCharacterEncoding("utf-8");
    
    MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
    
    String title = mr.getParameter("title");
    String content = mr.getParameter("content");
    String writer = mr.getParameter("writer");
    String image = mr.getFilesystemName("image");
    
    BoardVO board = new BoardVO();
    board.setTitle(title);
    board.setContent(content);
    board.setWriter(writer);
    //board.setImage(image);
    
    BoardServiceImpl boardServiceImpl = new BoardServiceImpl();
    boolean isSuccess = boardServiceImpl.RegisterBoard(board);
    if (isSuccess) {
      // page 재지정
      resp.sendRedirect("boardList.do");
    } else {
      req.setAttribute("msg", "등록하는 중 오류가 발생했습니다.");
      // req에서 받은 값을 다시 전달에서 페이지 이동
      req.getRequestDispatcher("board/boardAddForm.tiles").forward(req, resp);
    }
  }
  
}