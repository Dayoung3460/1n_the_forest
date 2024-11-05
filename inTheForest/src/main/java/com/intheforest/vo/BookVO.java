package com.intheforest.vo;
import lombok.Data;

@Data
public class BookVO {
	private int siteNo;
	private String siteName;
	private String category;
	private String siteMax;
	private String sitePrice;
	
	private String memberId;
	private String memCnt;
	private String startDate;
	private String endDate;
	private String carNum;
	private String totalPrice;
	private String cancelFlag;
	
	private int bookNo;
	private String optionNo;
	private String optionName;
	private String optionPrice;
}
