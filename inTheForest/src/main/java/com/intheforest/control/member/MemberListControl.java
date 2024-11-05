package com.intheforest.control.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.common.PageDTO;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.MemberVO;

public class MemberListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.setCharacterEncoding("utf-8");
		
		String searchCondition = req.getParameter("searchCondition");
	    String keyword = req.getParameter("keyword") == null ? "" : req.getParameter("keyword");
	    String currentPage = req.getParameter("currentPage") == null ? "1" : req.getParameter("currentPage");
	    
	    SearchDTO search = new SearchDTO();
	    search.setSearchCondition(searchCondition);
	    search.setKeyword(keyword);
	    search.setCurrentPage(currentPage);
	    
		
		MemberService svc = new MemberServiceImpl();
		int totalCount = svc.totalCnt();
		List<MemberVO> list = svc.memberList(search);
		
		for(MemberVO member : list) {
			member.setAddress(member.getAddress().replace("|", " "));
		}
		
		req.setAttribute("memberList", list);
		req.setAttribute("search", search);
		req.setAttribute("paging", new PageDTO(Integer.parseInt(currentPage), totalCount));
		req.getRequestDispatcher("member/memberList.tiles").forward(req, resp);
	}

}
