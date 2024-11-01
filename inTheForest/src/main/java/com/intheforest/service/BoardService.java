package com.intheforest.service;

import com.intheforest.common.SearchDTO;
import com.intheforest.vo.BoardVO;

import java.util.List;
import java.util.Map;

public interface BoardService {
  List<BoardVO> boardList();
  List<BoardVO> boardListByPage(SearchDTO search);
  int boardTotalCount(SearchDTO search);
  boolean RegisterBoard(BoardVO board);
  boolean removeBoard(int boardNo);
  boolean modifyBoard(BoardVO board);
  BoardVO searchBoard(int boardNo);
  
  List<Map<String, Object>> countByWriter();
  
}