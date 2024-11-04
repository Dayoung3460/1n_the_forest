package com.intheforest.control.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.BookVO;
import com.intheforest.vo.MemberVO;

public class DetailBookControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bookNo = req.getParameter("bookNo");
		String memId = req.getParameter("memberId"); //아이디를 목록에서 가져와야 상세 조회 가능.
		
		BookService book_svc = new BookServiceImpl();
		BookVO book = book_svc.selectBook(Integer.parseInt(bookNo));
		
		MemberService mem_svc = new MemberServiceImpl();
		MemberVO member = mem_svc.searchMember(memId);
		
		req.setAttribute("book", book);
		req.setAttribute("member", member);
		
		req.getRequestDispatcher("book/detailBook.tiles").forward(req, resp);
	}

}
