package com.intheforest.control.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.BookVO;
import com.intheforest.vo.MemberVO;

public class BookAppFormCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		if(memberId == null) {
			req.setAttribute("msg", "세션이 만료되었습니다. 다시 로그인 해 주세요");
			req.getRequestDispatcher("member/logIn.tiles").forward(req, resp);
			return;
		}
		MemberService msvc = new MemberServiceImpl();
		
		String siteNo = req.getParameter("siteNo");
		String category = req.getParameter("category");
		
		MemberVO member = msvc.searchMember(memberId);
		req.setAttribute("MemberVO", member);
		
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