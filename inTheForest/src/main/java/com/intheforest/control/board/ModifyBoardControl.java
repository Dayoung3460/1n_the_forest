package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

public class ModifyBoardControl implements Control {
  
  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("utf-8");
    
    BoardVO board;
    int bno = Integer.parseInt(req.getParameter("bno"));
    
    String memberPermission = req.getParameter("memberPermission");
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
    /////////GET일 때
    if(req.getMethod().equals("GET")) {
      board = svc.searchBoard(bno);
      
      req.setAttribute("board", board);
      req.setAttribute("memberPermission", memberPermission);
      req.setAttribute("search", search);
      req.setAttribute("category", category);
      req.getRequestDispatcher("board/boardModifyForm.tiles").forward(req, resp);
      
      
      /////////post일 때
    } else {
      
      String savePath = req.getServletContext().getRealPath("image");
      File saveDir = new File(savePath);
      
      // 폴더가 존재하지 않으면 생성
      if (!saveDir.exists()) {
        saveDir.mkdirs();
      }
      
      int maxSize = 1024 * 1024 * 5;
      
      req.setCharacterEncoding("utf-8");
      
      MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
      
      board = new BoardVO();
      
      String title = mr.getParameter("title");
      String content = mr.getParameter("content");
      String image = mr.getFilesystemName("image");
      String postCurrentPage = mr.getParameter("currentPage");
      String postSearchCondition = mr.getParameter("searchCondition");
      String postKeyword = mr.getParameter("keyword");
      String postCategory = mr.getParameter("category");
      String postReplyNo = mr.getParameter("replyNo");
      int postSecretFlag = (mr.getParameter("secretFlag") == null || mr.getParameter("secretFlag").equals("0")) ? 0 : 1;
      String postBoardPw = (mr.getParameter("boardPw") == null || mr.getParameter("boardPw").equals("")) ? "0" : mr.getParameter("boardPw");
      int postNoticeFlag = mr.getParameter("noticeFlag") == null ? 0 : Integer.parseInt(mr.getParameter("noticeFlag"));
      
      board.setBoardNo(bno);
      board.setTitle(title);
      board.setContent(content);
      board.setNoticeFlag(postNoticeFlag);
      board.setBoardFile(image);
      board.setSecretFlag(postSecretFlag);
      board.setBoardPw(postBoardPw);
      board.setReplyNo(Integer.parseInt(postReplyNo));
      
      boolean isSuccess = svc.modifyBoard(board);
      if(isSuccess) {
        String redirectPage = "boardList.do?currentPage=" + postCurrentPage + "&searchCondition=" + postSearchCondition + "&keyword=" + postKeyword + "&category=" + postCategory;
        resp.sendRedirect(redirectPage);
      } else {
        req.setAttribute("msg", "수정하는 중 오류가 발생했습니다.");
        req.getRequestDispatcher("board/boardModifyForm.tiles").forward(req, resp);
      }
    }
    
    
  }
  
}