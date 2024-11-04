package com.intheforest.control.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.intheforest.common.Control;
import com.intheforest.common.PageDTO;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.MyBookService;
import com.intheforest.service.MyBookServiceImpl;
import com.intheforest.vo.MyBookVO;

public class MyBookControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/json;charset=utf-8");
		
		String page = req.getParameter("currentPage");
		String sc = req.getParameter("searchCondition");
		String kw = req.getParameter("keyword");
		page = page == null ? "1" : page;
		//리스트 출력
		
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("memberId");
		MyBookService svc = new MyBookServiceImpl();
		List<MyBookVO> list = svc.myPageBookList(memberId);
		
		//검색조건
		SearchDTO search = new SearchDTO();
		int totalCount = svc.getTotalCount(search);
		search.setKeyword(kw);
		search.setSearchCondition(sc);
		search.setCurrentPage(page);
		
		//request에 저장
		req.setAttribute("myPageBookList", list);
		req.setAttribute("currentPage", new PageDTO(Integer.parseInt(page),totalCount));
		req.setAttribute("searchCondition", sc);
		req.setAttribute("keyword", kw);
		
		//jsp 페이지 tiles로 출력
		req.getRequestDispatcher("book/myPageBookList.tiles").forward(req, resp);
	}

}
