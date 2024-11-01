package com.intheforest.common;

import lombok.Data;

@Data
public class SearchDTO {
	private String currentPage;
	private String searchCondition;
	private String keyword;
	private String category; // notice, reply, review, qna
}
