package com.intheforest.service;

import com.intheforest.common.DataSource;
import com.intheforest.common.SearchDTO;
import com.intheforest.mapper.BoardMapper;
import com.intheforest.vo.BoardVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class BoardServiceImpl implements BoardService {
  SqlSession sqlSession = DataSource.getInstance().openSession(true);
  
  BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
  

  
  @Override
  public List<BoardVO> boardList() {
   
    return mapper.boardList();
  }
  
  @Override
  public List<BoardVO> boardListByPage(SearchDTO search) {
    return mapper.boardListByPage(search);
  }
  
  @Override
  public int boardTotalCount(SearchDTO search) {
    return mapper.boardTotalCount(search);
  }
  
  @Override
  public int registerBoard(BoardVO board) {
    return mapper.insertBoard(board);
  }
  
  @Override
  public boolean updateReplyNo(BoardVO board) {
    return mapper.updateReplyNo(board) == 1;
  }
  
  @Override
  public boolean removeBoard(int boardNo) {
    return mapper.deleteBoard(boardNo) == 1;
  }
  @Override
  public boolean modifyBoard(BoardVO board) {
    return mapper.updateBoard(board) == 1;
  }
  @Override
  public BoardVO searchBoard(int boardNo) {
    // 글이 조회될 때마다 viewCnt+1
    mapper.updateCount(boardNo);
    return mapper.selectBoard(boardNo);
  }
  
  @Override
  public BoardVO selectPrevBoard(BoardVO board) {
    return mapper.selectPrevBoard(board);
  }
  
  @Override
  public BoardVO selectNextBoard(BoardVO board) {
    return mapper.selectNextBoard(board);
  }
  
  @Override
  public ArrayList<Integer> getBookNoByMemberId(String memberId) {
    return mapper.getBookNoByMemberId(memberId);
  }
  
  @Override
  public boolean isReview(int bookNo) {
	  return mapper.reviewOnBook(bookNo) != null; // 리뷰 작성했다면 true, 작성 안 했으면 false 반환
  }

  @Override
  public BoardVO isReply(int boardNo) {
      return mapper.myReply(boardNo);
  }
  
}