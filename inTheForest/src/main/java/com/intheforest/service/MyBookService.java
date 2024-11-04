package com.intheforest.service;

import java.util.List;

import com.intheforest.vo.MyBookVO;

public interface MyBookService {
	//List<ExampleVO> exampleList();
	List<MyBookVO> myPageBookList(String bookNo);
}
