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
    String savePath = req.getServletContext().getRealPath("image");
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
    
//    공지사항: 관리자 계정이여야함
//    문의하기: 로그인필요없 / 글 비밀번호 필요 / 비밀글 체크박스 필요
//    후기: 로그인해야함 / 글 비밀번호 필요 / 비밀글 체크박스 필요
    
    int secretFlag = (mr.getParameter("secretFlag") == null || mr.getParameter("secretFlag").equals("0")) ? 0 : 1; // category가 qna일 때만 0 or 1
    String boardPw = (mr.getParameter("boardPw") == null || mr.getParameter("boardPw").equals("")) ? "0" : mr.getParameter("boardPw");
    int noticeFlag = mr.getParameter("noticeFlag") == null ? 0 : 1; // 중요 공지 체크: 1, 아니면 0
    
    BoardVO board = new BoardVO();
    board.setTitle(title);
    board.setContent(content);
    board.setWriter(writer);
    board.setBoardFile(image);
    board.setBoardCategory(category);
    board.setBookNo(bookNo);
    board.setSecretFlag(secretFlag);
    board.setBoardPw(boardPw);
    board.setNoticeFlag(noticeFlag);
    
    BoardServiceImpl boardServiceImpl = new BoardServiceImpl();
    
    int newBoardNo = boardServiceImpl.registerBoard(board);
    if (newBoardNo > 0) {
      resp.sendRedirect("boardList.do?category=" + category);
    } else {
      req.setAttribute("msg", "등록하는 중 오류가 발생했습니다.");
      req.getRequestDispatcher("board/boardAddForm.tiles").forward(req, resp);
    }
  }
  
}