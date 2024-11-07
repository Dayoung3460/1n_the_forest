package com.intheforest.service;

import com.intheforest.common.SearchDTO;
import com.intheforest.vo.BoardVO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface BoardService {
  List<BoardVO> boardList();
  List<BoardVO> boardListByPage(SearchDTO search);
  int boardTotalCount(SearchDTO search);
  int registerBoard(BoardVO board);
  boolean updateReplyNo(BoardVO board);
  boolean removeBoard(int boardNo);
  boolean modifyBoard(BoardVO board);
  BoardVO searchBoard(int boardNo);
  BoardVO selectPrevBoard(BoardVO board);
  BoardVO selectNextBoard(BoardVO board);
  
  ArrayList<Integer> getBookNoByMemberId(String memberId);
  
  // 리뷰 작성 여부 확인용
  boolean isReview(int bookNo);
  
}