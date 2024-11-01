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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BookAppCont implements Control {
	
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String bookNo = req.getParameter("bookNo");
		String siteNo = req.getParameter("siteNo");
		String category = req.getParameter("category");
		String logId = req.getParameter("logId");
		String memCnt = req.getParameter("memCnt");
		String siteDate = req.getParameter("siteDate");
		String endDate = req.getParameter("endDate");
		String carNum = req.getParameter("carNum");
		String totalPrice = req.getParameter("totalPrice");
		
		BookService svc = new BookServiceImpl();
		BookVO book = svc.selectSite(siteNo);
		List<BookVO> list = svc.siteList();
		List<BookVO> optionList = svc.optionList();
		
		if(req.getMethod().equals("GET")) {
			
			req.setAttribute("bookvo", book);
			
			req.setAttribute("siteList", list);
			req.setAttribute("optionList", optionList);
			req.setAttribute("siteNo", siteNo);
			req.setAttribute("category",category);
			
			req.getRequestDispatcher("/WEB-INF/jsp/book/book_app.jsp").forward(req, resp);
			
		}else {
			
			book.setBookNo(bookNo);
			book.setMemberId(logId);
			book.setSiteNo(siteNo);
			book.setMemCnt(memCnt);
			book.setStartDate(siteDate);
			book.setEndDate(endDate);
			book.setCarNum(carNum);
			book.setTotalPrice(totalPrice);
			
			try {
				//svc.registerBoard(book);
				resp.sendRedirect("boardList.do");
			}catch(Exception e){
				req.setAttribute("msg","등록하는중 오류가 발생했습니다.");
				req.getRequestDispatcher("WEB-INF/jsp/boardForm.jsp")//
					.forward(req, resp);
			}
		}
	}
	
}
