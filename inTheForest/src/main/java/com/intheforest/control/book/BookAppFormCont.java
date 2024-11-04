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

public class BookAppFormCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String siteNo = req.getParameter("siteNo");
		String category = req.getParameter("category");
		
		BookService svc = new BookServiceImpl();
		BookVO book = svc.selectSite(siteNo);
		List<BookVO> list = svc.siteList();
		List<BookVO> optionList = svc.optionList();
		
		
		req.setAttribute("bookvo", book);
		
		req.setAttribute("siteList", list);
		req.setAttribute("optionList", optionList);			
		req.setAttribute("siteNo", siteNo);
		req.setAttribute("category",category);
		
		req.getRequestDispatcher("book/bookApp.tiles").forward(req, resp);	
	}
}