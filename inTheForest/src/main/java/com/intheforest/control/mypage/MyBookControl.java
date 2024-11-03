package com.intheforest.control.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.MyBookService;
import com.intheforest.service.MyBookServiceImpl;
import com.intheforest.vo.MyBookVO;

public class MyBookControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String bookNo = req.getParameter("bookNo");
		MyBookService svc = new MyBookServiceImpl();
		List<MyBookVO> list = svc.myPageBookList(bookNo);
		req.setAttribute("myPageBookList", list);
		req.getRequestDispatcher("book/myPageBookList.tiles").forward(req, resp);
		
	}

}
