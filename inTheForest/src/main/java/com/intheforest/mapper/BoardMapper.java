package com.intheforest.mapper;

import com.intheforest.common.SearchDTO;
import com.intheforest.vo.BoardVO;

import java.util.List;
import java.util.Map;

public interface BoardMapper {
  List<BoardVO> boardList();
  List<BoardVO> boardListByPage(SearchDTO search);
  int boardTotalCount(SearchDTO search);
  List<BoardVO> boardListByNo();
  
  int insertBoard(BoardVO board);
  int updateBoard(BoardVO board);
  int deleteBoard(int boardNo);
  BoardVO selectBoard(int boardNo);
  int updateCount(int boardNo);
  
  // 사용자별 게시글 작성개수
  List<Map<String, Object>> countByWriter();
}
