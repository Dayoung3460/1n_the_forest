package com.intheforest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.intheforest.vo.MyBookVO;

public interface MyBookMapper {
	List<MyBookVO> selectMyPageBookList(String bookNo);
}




