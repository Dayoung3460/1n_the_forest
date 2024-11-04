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

public class ModifyJoinControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 값을 받을 때 (클라이언트가 보낸 값) 문자 안깨지게 해주는 것 
		resp.setContentType("application/json;charset=utf-8"); // 값을 보낼 때 문자 안깨지게 해주는것
		
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		if(memberId == null) {
			req.setAttribute("msg", "세션이 만료되었습니다. 다시 로그인 해 주세요");
			req.getRequestDispatcher("member/logIn.tiles").forward(req, resp);
			return;
		}
		MemberService svc = new MemberServiceImpl();
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			MemberVO member = svc.searchMember(memberId);
			
			//MemverVO 에서 통합된 address 가져오기
			String fullAddress = member.getAddress();
			
			// fullAddress "|" 기준으로 3부분으로 나누기 
			String [] addressParts = fullAddress.split("\\|",3);
			
			String postcode = addressParts.length > 0 ? addressParts[0] : ""; 
			String address1 = addressParts.length > 1 ? addressParts[1] : "";
			String address2 = addressParts.length > 2 ? addressParts[2] : "";
			
			req.setAttribute("MemberVO", member);
			req.setAttribute("postcode", postcode);
			req.setAttribute("address1", address1);
			req.setAttribute("address2", address2);
			
			req.getRequestDispatcher("member/ModifyJoin.tiles").forward(req, resp);
		}else if (req.getMethod().equalsIgnoreCase("POST")) {
			String password = req.getParameter("password");
			String email = req.getParameter("email");
			String tel = req.getParameter("tel");
			String postcode = req.getParameter("postcode");
			String address1= req.getParameter("address1");
			String address2= req.getParameter("address2");
			String fullAddress = postcode +"|"+ address1 +"|"+ address2;
			
			
			MemberVO member = new MemberVO();
			member.setMemberId(memberId);
			member.setPassword(password);
			member.setEmail(email);
			member.setTel(tel);
			member.setAddress(fullAddress);
			System.out.println(member);
			
			try {
				if(svc.modifyJoin(member)) {
					member = svc.searchMember(memberId);
					// fullAddress 공백" " 기준으로 3부분으로 나누기 
					String [] addressParts = fullAddress.split("\\|",3);
					
					postcode = addressParts.length > 0 ? addressParts[0] : ""; 
					address1 = addressParts.length > 1 ? addressParts[1] : "";
					address2 = addressParts.length > 2 ? addressParts[2] : "";
					
					req.setAttribute("MemberVO", member);
					req.setAttribute("postcode", postcode);
					req.setAttribute("address1", address1);
					req.setAttribute("address2", address2);
					req.getRequestDispatcher("member/DetailJoin.tiles").forward(req, resp);
				}else {
					member = svc.searchMember(memberId);
					// fullAddress 공백" " 기준으로 3부분으로 나누기 
					String [] addressParts = fullAddress.split("\\|",3);
					
					postcode = addressParts.length > 0 ? addressParts[0] : ""; 
					address1 = addressParts.length > 1 ? addressParts[1] : "";
					address2 = addressParts.length > 2 ? addressParts[2] : "";
					
					req.setAttribute("MemberVO", member);
					req.setAttribute("postcode", postcode);
					req.setAttribute("address1", address1);
					req.setAttribute("address2", address2);
					
					req.setAttribute("msg", "수정할 회원정보가 없습니다.");
					req.getRequestDispatcher("member/ModifyJoin.tiles").forward(req, resp);
		
				}	
			}catch (Exception e) {
		        e.printStackTrace(); // 예외 로그 출력
		        req.setAttribute("msg", "회원 정보 수정 중 오류가 발생했습니다.");
		        req.getRequestDispatcher("member/ModifyJoin.tiles").forward(req, resp);
		    }
			
		}
		
		

	}

}
