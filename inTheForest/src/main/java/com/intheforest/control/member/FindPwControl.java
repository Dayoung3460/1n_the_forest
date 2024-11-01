package com.intheforest.control.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.MemberVO;

public class FindPwControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 값을 받을 때 (클라이언트가 보낸 값) 문자 안깨지게 해주는 것
		resp.setContentType("text/json;charset=utf-8"); // 값을 보낼 때 문자 안깨지게 해주는것
		
		// 아이디 이름 이메일 받아오기 
		String id = req.getParameter("memberId");
		String name = req.getParameter("memberName");
		String email = req.getParameter("email");
		
		
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			req.getRequestDispatcher("member/findPwForm.tiles").forward(req, resp);	
		}else if(req.getMethod().equalsIgnoreCase("POST")) {
			MemberVO mvo = new MemberVO();
			mvo.setMemberId(id);
			mvo.setMemberName(name);
			mvo.setEmail(email);
			
			MemberService svc = new MemberServiceImpl();
			int search = svc.pwCheck(mvo);
			
		}
		

	}

}
