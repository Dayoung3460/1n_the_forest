package com.intheforest.vo;

import lombok.Data;

@Data
public class BookVO {
	private int bookNo;
	private String memberId;
	private int siteNo;
	private int memCnt;
	private String startDate;
	private String endDate;
	private String carNum;
	private int totalPrice;
	private int reviewFlag;
	private int cancelFlag;
	private String createDate;
	private String siteName;
	

}
