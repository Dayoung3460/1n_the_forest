package com.intheforest.vo;

import lombok.Data;

import java.util.Date;

@Data
public class BoardVO {
  private int boardNo;
  private String boardCategory;
  private String bookNo;
  private String replyNo; //
  private int secretFlag; // 1, 0
  private String title;
  private String content;
  private int boardPw; // 숫자 네자리
  private int noticeFlag;// 1, 0
  private String boardFile;
  private String writer;
  private int viewCnt;
  private Date writeDate;
}