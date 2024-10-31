package com.intheforest.control.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;
import com.intheforest.vo.BookVO;

public class BookControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		String memberId = req.getParameter("memberId");
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.myPageBookList(memberId);
		System.out.println("list: " + list);
		req.setAttribute("myPageBookList", list);
		req.getRequestDispatcher("book/myPageBookList.tiles").forward(req, resp);
		
	}

}
