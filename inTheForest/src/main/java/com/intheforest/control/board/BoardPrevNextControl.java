package com.intheforest.control.board;

import com.intheforest.common.Control;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class BoardPrevNextControl implements Control {

  @Override
  public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String writeDate = req.getParameter("writeDate");
    String category = req.getParameter("category");
    String isPrev = req.getParameter("isPrev");
    
    BoardVO board = new BoardVO();
    board.setWriteDate(writeDate);
    board.setBoardCategory(category);

    BoardVO resultBoard = null;
    BoardService svc = new BoardServiceImpl();
    if(isPrev.equals("true")) {
      resultBoard = svc.selectPrevBoard(board);
    } else {
      resultBoard = svc.selectNextBoard(board);
    }
    
    ObjectMapper objectMapper = new ObjectMapper();
    
    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("result", resultBoard);
    
    try {
      String json = objectMapper.writeValueAsString(resultMap);
      resp.getWriter().print(json);
    } catch (JsonProcessingException e) {
      e.printStackTrace();
    }
  }
}
