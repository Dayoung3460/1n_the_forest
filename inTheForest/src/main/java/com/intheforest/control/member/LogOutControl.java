package com.intheforest.control.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.intheforest.common.Control;

public class LogOutControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//session 삭제 
		HttpSession session = req.getSession();
		session.invalidate(); // session 삭제 메소드 => invalidate()
		
		//로그인페이지로 이동 
		req.getRequestDispatcher("member/login.tiles").forward(req, resp);

	}

}
