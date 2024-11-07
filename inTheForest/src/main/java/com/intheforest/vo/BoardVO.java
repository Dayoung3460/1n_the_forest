package com.intheforest.vo;

import lombok.Data;

import java.util.Date;

// board table의 replyNo(parent_no)는 qna의 boardNo임
// qna의 replyNo는 무조건 null
// reply에는 reply_no가 있는데 해당 답글의 부모(문의글)임

@Data
public class BoardVO {
  private int boardNo;
  private String boardCategory;
  private String bookNo;
  private int replyNo; //
  private int secretFlag; // 1, 0
  private String title;
  private String content;
  private String boardPw; // 숫자 네자리. int type일 경우 비빌번호가 0000이면 0이 돼서 String type으로 변경
  private int noticeFlag;// 1, 0
  private String boardFile;
  private String writer;
  private int viewCnt;
  private String writeDate;
}