package com.intheforest.mapper;

import com.intheforest.common.SearchDTO;
import com.intheforest.vo.BoardVO;

import java.util.ArrayList;
import java.util.List;

public interface BoardMapper {
  List<BoardVO> boardList();
  List<BoardVO> boardListByPage(SearchDTO search);
  int boardTotalCount(SearchDTO search);
  List<BoardVO> boardListByNo();
  
  int insertBoard(BoardVO board);
  int updateReplyNo(BoardVO board);
  int updateBoard(BoardVO board);
  int deleteBoard(int boardNo);
  BoardVO selectBoard(int boardNo);
  BoardVO selectPrevBoard(BoardVO board);
  BoardVO selectNextBoard(BoardVO board);
  int updateCount(int boardNo);
  
  ArrayList<Integer> getBookNoByMemberId(String memberId);

  // 예약번호에 따른 리뷰 조회
  BoardVO reviewOnBook(int bookNo);
  
  // 답글이 있는 게시물인지?
  BoardVO myReply(int boardNo);
}
