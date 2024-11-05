package com.intheforest.control.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.BookVO;
import com.intheforest.vo.MemberVO;

public class DetailBookControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookNo = Integer.parseInt(req.getParameter("bookNo"));
		String siteNo = req.getParameter("siteNo");
		String memId = req.getParameter("memberId");
		
		BookService book_svc = new BookServiceImpl();
		
		BookVO book = book_svc.selectBook(bookNo);
		BookVO site = book_svc.selectSite(siteNo);
		book.setSiteMax(site.getSiteMax());
		book.setSiteName(site.getSiteName());
		
		MemberService mem_svc = new MemberServiceImpl();
		MemberVO member = mem_svc.searchMember(memId);
		
		req.setAttribute("optionList", book_svc.optionList());
		req.setAttribute("myOptions", book_svc.selectBookOption(bookNo));//비교용 배열
		req.setAttribute("book", book);
		req.setAttribute("member", member);
		
		BoardService board_svc = new BoardServiceImpl();
		req.setAttribute("isReview", board_svc.isReview(bookNo));
		
		req.getRequestDispatcher("book/detailBook.tiles").forward(req, resp);
	}

}
