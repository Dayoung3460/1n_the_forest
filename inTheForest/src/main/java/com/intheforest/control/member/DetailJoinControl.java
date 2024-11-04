package com.intheforest.control.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.intheforest.common.Control;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.MemberVO;

public class DetailJoinControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 값을 받을 때 (클라이언트가 보낸 값) 문자 안깨지게 해주는 것 
		resp.setContentType("application/json;charset=utf-8"); // 값을 보낼 때 문자 안깨지게 해주는것
		
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		if(memberId == null) {
			req.getRequestDispatcher("member/logIn.tiles").forward(req, resp);
			return;
		} else if(req.getParameter("memberId") != null) {
			memberId = req.getParameter("memberId"); // 파라미터 값이 있으면 파라미터 값 이용
		}
		
		MemberService svc = new MemberServiceImpl();
		MemberVO member = svc.searchMember(memberId);
		
		// MemverVO 에서 통합된 address 가져오기
		String fullAddress = member.getAddress();
		
		// fullAddress 공백" " 기준으로 3부분으로 나누기 
		String [] addressParts = fullAddress.split("\\|",3);
		
		String postcode = addressParts.length > 0 ? addressParts[0] : ""; 
		String address1 = addressParts.length > 1 ? addressParts[1] : "";
		String address2 = addressParts.length > 2 ? addressParts[2] : "";
		
		req.setAttribute("MemberVO", member);
		req.setAttribute("postcode", postcode);
		req.setAttribute("address1", address1);
		req.setAttribute("address2", address2);
		
		req.getRequestDispatcher("member/DetailJoin.tiles").forward(req, resp);
		

	}

}
