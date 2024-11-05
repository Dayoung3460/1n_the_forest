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

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 값을 받을 때 (클라이언트가 보낸 값) 문자 안깨지게 해주는 것 
		resp.setContentType("text/json;charset=utf-8"); // 값을 보낼 때 문자 안깨지게 해주는것
		
		String id = req.getParameter("memberId");
		String pw = req.getParameter("password");
		
		
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			// login.jsp페이지로 이동
			req.getRequestDispatcher("member/login.tiles").forward(req, resp);
		}else if (req.getMethod().equalsIgnoreCase("POST")) {
			MemberService svc = new MemberServiceImpl();
			MemberVO member = svc.memberLogin(id, pw);
			
			if (member == null) {
				//로그인 실패 (login.jsp로 이동)
				req.setAttribute("msg", "아이디와 비밀번호를 입력하세요");
				req.getRequestDispatcher("member/login.tiles").forward(req, resp);
				return;
			} 
			if(member.getQuit() == 1) {
				req.setAttribute("quitmsg", "탈퇴 한 회원 입니다.");
				req.getRequestDispatcher("member/login.tiles").forward(req, resp);
				return;
			}
			//정상 로그인 시
			HttpSession session = req.getSession();
			session.setAttribute("memberId", id);
			session.setAttribute("permission", member.getPermission());
			
			if(member.getPermission().equals("admin")) {
				resp.sendRedirect("memberList.do");
			} else {
				resp.sendRedirect("main.do");
			}
		
		}

	}

}
