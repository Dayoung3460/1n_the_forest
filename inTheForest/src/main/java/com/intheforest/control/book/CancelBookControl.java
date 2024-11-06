package com.intheforest.control.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;

public class CancelBookControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookNo = Integer.parseInt(req.getParameter("bookNo"));
		
		BookService svc = new BookServiceImpl();
		
		if(svc.cancelBook(bookNo) >0){
			// 정상적으로 수정 되면 -> 목록 화면 출력 
			resp.sendRedirect("main.do");
		}else {
			req.setAttribute("msg", "잘못된 값입니다.");
			req.getRequestDispatcher("main.do").forward(req, resp);
		}
	}

}
