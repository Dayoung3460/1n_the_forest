package com.intheforest.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.intheforest.common.DataSource;

public class AppTest {
	public static void main(String[] args) {
		SqlSession sqlSession = DataSource.getInstance().openSession();
		// test test
		////ggg
		
	}
}
