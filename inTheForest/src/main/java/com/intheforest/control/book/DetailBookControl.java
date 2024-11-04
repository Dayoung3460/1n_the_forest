package com.intheforest.control.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;

public class DetailBookControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bookNo = req.getParameter("bookNo");
		
		
		req.getRequestDispatcher("book/detailBook.tiles").forward(req, resp);
	}

}
