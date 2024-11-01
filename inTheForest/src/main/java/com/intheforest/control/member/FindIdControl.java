package com.intheforest.control.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.MemberVO;

public class FindIdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 값을 받을 때 (클라이언트가 보낸 값) 문자 안깨지게 해주는 것
		resp.setContentType("text/json;charset=utf-8"); // 값을 보낼 때 문자 안깨지게 해주는것

		String name = req.getParameter("memberName");
		String email = req.getParameter("email");

		if (req.getMethod().equalsIgnoreCase("GET")) {
			// findIdForm.jsp페이지로 이동
			req.getRequestDispatcher("member/findIdForm.tiles").forward(req, resp);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			MemberService svc = new MemberServiceImpl();
			MemberVO memberId = svc.findMemberId(name,email);
			req.setAttribute("findId", memberId); // 요청 받은 결과
			try {
				System.out.println(memberId);
				req.getRequestDispatcher("member/findId.tiles").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
