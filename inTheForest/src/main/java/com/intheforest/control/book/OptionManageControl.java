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

public class OptionManageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BookService bsvc = new BookServiceImpl();
		
		
		if(req.getMethod().equals("GET")) {			
			
			List<BookVO> options = bsvc.optionList();
			req.setAttribute("options", options);
			req.getRequestDispatcher("book/optionManagement.tiles").forward(req, resp);
		
		} else if(req.getMethod().equals("POST")) {
		
			
			
		}
	
	}

}
