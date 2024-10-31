package com.intheforest.service;

import java.util.List;

import com.intheforest.vo.BookVO;

public interface BookService {
	//List<ExampleVO> exampleList();
	List<BookVO> myPageBookList(String memberId);
}
