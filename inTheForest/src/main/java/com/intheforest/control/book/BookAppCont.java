package com.intheforest.control.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;
import com.intheforest.vo.BookVO;

public class BookAppCont implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String siteNo = req.getParameter("siteNo");
		String category = req.getParameter("category");
		String memberId = req.getParameter("memberId");
		String memCnt = req.getParameter("memCnt");
		String siteDate = req.getParameter("siteDate");
		String endDate = req.getParameter("endDate");
		String carNum = req.getParameter("carNum");
		String totalPrice = req.getParameter("totalPrice");
		System.out.println("category:"+category);		
		
		BookService svc = new BookServiceImpl();
		BookVO book = new BookVO();
		book.setMemberId(memberId);
		book.setSiteNo(siteNo);
		book.setMemCnt(memCnt);
		book.setStartDate(siteDate);
		book.setEndDate(endDate);
		book.setCarNum(carNum);
		book.setTotalPrice(totalPrice);
		
		try {
			svc.registerBook(book);
			resp.sendRedirect("/inTheForest/main.do");
		}catch(Exception e){
			req.setAttribute("msg","등록하는중 오류가 발생했습니다.");
			req.getRequestDispatcher("/inTheForest/main.do")//
				.forward(req, resp);
		}
	}

}
