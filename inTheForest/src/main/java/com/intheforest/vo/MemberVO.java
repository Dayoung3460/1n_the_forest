package com.intheforest.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String password;	
	private String memberName;	
	private String address;
	private String email;
	private String tel;	
	private Date joinedDate;
	private String permission;

}
