package com.intheforest.control.site;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;
import com.intheforest.vo.BookVO;

public class SiteListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.siteListAdmin();
		
		req.setAttribute("siteListAdmin", list);	
		
		req.getRequestDispatcher("site/siteList.tiles").forward(req, resp);

	}

}
