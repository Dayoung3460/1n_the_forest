package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

public class AddBoardControl implements Control {
  
  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String savePath = req.getServletContext().getRealPath("/WEB-INF/image");
    File saveDir = new File(savePath);
    
    // 폴더가 존재하지 않으면 생성
    if (!saveDir.exists()) {
      saveDir.mkdirs();
    }
    
    int maxSize = 1024 * 1024 * 5;
    
    req.setCharacterEncoding("utf-8");
    
    MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
    
    String title = mr.getParameter("title");
    String category = req.getParameter("category");
    String content = mr.getParameter("content");
    String writer = mr.getParameter("writer");
    String image = mr.getFilesystemName("image");
    String bookNo = req.getParameter("bookNo"); // category가 review일 때만
    int secretFlag = Integer.parseInt(mr.getParameter("secretFlag")); // category가 qna일 때만 0 or 1
    int boardPw = Integer.parseInt(mr.getParameter("boardPw"));
    int noticeFlag = Integer.parseInt(mr.getParameter("noticeFlag"));// category가 notice일 때만 1, 나머지 0
    
    System.out.println("title = " + title);
    System.out.println("category = " + category);
    System.out.println("content = " + content);
    System.out.println("writer = " + writer);
    System.out.println("image = " + image);
    System.out.println("bookNo = " + bookNo);
    System.out.println("secretFlag = " + secretFlag);
    System.out.println("boardPw = " + boardPw);
    System.out.println("noticeFlag = " + noticeFlag);
    
//    BoardVO board = new BoardVO();
//    board.setTitle(title);
//    board.setContent(content);
//    board.setWriter(writer);
//    board.setBoardFile(image);
//    board.setBoardCategory(category);
//    board.setBookNo(bookNo);
//    board.setSecretFlag(secretFlag);
//    board.setBoardPw(boardPw);
//    board.setNoticeFlag(noticeFlag);
//
//    BoardServiceImpl boardServiceImpl = new BoardServiceImpl();
//    boolean isSuccess = boardServiceImpl.RegisterBoard(board);
//    if (isSuccess) {
//      // page 재지정
//      resp.sendRedirect("boardList.do?category=" + category);
//    } else {
//      req.setAttribute("msg", "등록하는 중 오류가 발생했습니다.");
//      // req에서 받은 값을 다시 전달에서 페이지 이동
//      req.getRequestDispatcher("board/boardAddForm.tiles").forward(req, resp);
//    }
  }
  
}