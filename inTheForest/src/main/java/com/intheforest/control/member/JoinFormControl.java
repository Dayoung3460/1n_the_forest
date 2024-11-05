package com.intheforest.control.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;
import com.intheforest.vo.MemberVO;

public class JoinFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8"); // 값을 받을 때 (클라이언트가 보낸 값) 문자 안깨지게 해주는 것 
		resp.setContentType("application/json;charset=utf-8"); // 값을 보낼 때 문자 안깨지게 해주는것
		
		String id = req.getParameter("memberId");
		String pw = req.getParameter("password");
		String name = req.getParameter("memberName");
		String phone = req.getParameter("tel");
		String email = req.getParameter("email");
		String postcode = req.getParameter("postcode");
		String address1= req.getParameter("address1");
		String address2= req.getParameter("address2");
		String fullAddress = postcode + "|" + address1 + "|" + address2;
		
		
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			//join.jsp페이지로 이동 
			req.getRequestDispatcher("member/join.tiles").forward(req, resp);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			//아이디 중복 체크 요청 (ckeckId.do 요청)
			if(req.getRequestURI().endsWith("checkId.do")) {
				MemberService svc = new MemberServiceImpl();
				int count = svc.checkId(id);
				resp.getWriter().write("{\"exists\":" + count + "}");
				return;
			}
			
			
			MemberService svc = new MemberServiceImpl();
			MemberVO mvo = new MemberVO();
			

			
			
			mvo.setMemberId(id);
			mvo.setPassword(pw);
			mvo.setMemberName(name);
			mvo.setTel(phone);
			mvo.setEmail(email);
			mvo.setAddress(fullAddress);

			try {
				svc.addMember(mvo);
				//값이 잘 넣어지는 경우 (login.jsp로 이동 )
				req.setAttribute("joinSuccess", "회원가입이 완료되었습니다");
				req.getRequestDispatcher("member/login.tiles").forward(req, resp);	
			}catch(Exception e) {
				req.setAttribute("joinError", "회원가입에 실패하였습니다. 다시 시도해 주세요.");
				req.getRequestDispatcher("member/join.tiles").forward(req, resp);
			}
			
		}
		
	}

}
