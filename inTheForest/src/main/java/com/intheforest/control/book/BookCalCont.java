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

public class BookCalCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String siteNo = req.getParameter("siteNo");
		String siteName = req.getParameter("siteName");
		String category = req.getParameter("category");
		String siteMax = req.getParameter("siteMax");
		String sitePrice = req.getParameter("sitePrice");
		String startDate = req.getParameter("startDate");
		
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.siteList();
		
		//BookVO book = svc.selectBookDate(siteNo, startDate);
		req.setAttribute("siteList", list);
		//req.setAttribute("selectBookDate", book);
		
		req.setAttribute("siteNo", siteNo);
		req.setAttribute("siteName",siteName);
		req.setAttribute("category",category);
		req.setAttribute("siteMax",siteMax);
		req.setAttribute("sitePrice", sitePrice);
		
		
		req.getRequestDispatcher("book/book_calendar.tiles").forward(req, resp);
	}
}
