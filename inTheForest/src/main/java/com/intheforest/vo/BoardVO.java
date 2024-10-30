package com.intheforest.vo;

import lombok.Data;

import java.util.Date;

@Data
public class BoardVO {
  private int boardNo;
  private String title;
  private String content;
  private String writer; // writerId memberId
  private String writerName;
  private int viewCnt;
  private Date writeDate;
  private Date updateDate;
  private int totalCount;

  private String image;
}