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
			
			if(search > 0) { //일치정보있는경우 
				String tempPw = svc.generateRdPw(); //임시비밀번호생성
				mvo.setPassword(tempPw); //생성된 비밀번호를 비밀번호에 설정
				svc.pwUpdate(mvo); // db 비밀번호 업데이트
				
				req.setAttribute("tempPw", tempPw);
				req.setAttribute("resultMsg", "임시비밀번호가 발급 되었습니다.");
			}else {//일치 정보 없는 경우 
				 req.setAttribute("resultMsg", "입력하신 정보와 일치하는 계정이 없습니다.");
				
			}
			req.getRequestDispatcher("member/findPw.tiles").forward(req, resp);
			
		}
		

	}

}
