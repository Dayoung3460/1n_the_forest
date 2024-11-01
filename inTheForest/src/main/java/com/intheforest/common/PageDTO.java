package com.intheforest.common;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage, endPage;
	private boolean prev, next;
	private int currentPage;
	private int totalCount;
	
	public PageDTO(int currentPage, int totalCount) { 
		this.setTotalCount(totalCount);
		this.currentPage = currentPage;
		
		this.endPage = (int) Math.ceil(currentPage / 10.0) * 10; 
		this.startPage = this.endPage - 9; 
		
		int realEnd = (int) Math.ceil(this.getTotalCount() / 10.0);
		this.endPage = this.endPage > realEnd ? realEnd : this.endPage;
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
