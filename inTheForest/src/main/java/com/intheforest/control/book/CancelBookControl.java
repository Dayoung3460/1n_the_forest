package com.intheforest.control.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;
import com.intheforest.vo.BookVO;

public class CancelBookControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int siteNo = Integer.parseInt(req.getParameter("siteNo"));
		String memberId = req.getParameter("memberId");
		String memCnt = req.getParameter("memCnt");
		String siteDate = req.getParameter("siteDate");
		String endDate = req.getParameter("endDate");
		String carNum = req.getParameter("carNum");
		String totalPrice = req.getParameter("sitePrice");
		String[] option = req.getParameterValues("option[]");
		
		siteDate = siteDate.replace("-","/");
		endDate = endDate.replace("-","/");
		
		BookService svc = new BookServiceImpl();
		BookVO book = new BookVO();
		
		book.setSiteNo(siteNo);
		book.setMemberId(memberId);
		book.setMemCnt(memCnt);
		book.setStartDate(siteDate);
		book.setEndDate(endDate);
		book.setCarNum(carNum);
		book.setTotalPrice(totalPrice);
		
		try {
			if(svc.registerBook(book)) {
				
				int lastNo = svc.bookLast();
				System.out.println("option: " +option.length);
				for(int i=0; i<option.length; i++) {	
					BookVO bookOption = new BookVO();
					bookOption.setOptionNo(option[i]);
					bookOption.setBookNo(lastNo);
					bookOption.setMemberId(memberId);
					bookOption.setSiteNo(siteNo);
					
					svc.registerBookOption(bookOption);
				}
				resp.sendRedirect("/inTheForest/bookCalendar.do");
			}
		}catch(Exception e){
			req.setAttribute("msg","등록하는중 오류가 발생했습니다.");
			req.getRequestDispatcher("/inTheForest/bookCalendar.do")
				.forward(req, resp);
		}
	}

}
