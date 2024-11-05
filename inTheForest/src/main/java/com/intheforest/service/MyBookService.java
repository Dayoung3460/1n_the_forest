package com.intheforest.service;

import java.util.List;

import com.intheforest.common.SearchDTO;
import com.intheforest.vo.MyBookVO;

public interface MyBookService {
	//출력
	List<MyBookVO> myPageBookList(SearchDTO search);
	
	//
	int getTotalCount(SearchDTO search);
}
