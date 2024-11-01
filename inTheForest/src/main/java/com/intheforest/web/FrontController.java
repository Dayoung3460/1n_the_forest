package com.intheforest.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.control.mypage.MyBookControl;
import com.intheforest.control.board.*;
import com.intheforest.control.mypage.MyBookControl;
import com.intheforest.control.site.MainPageControl;
import com.intheforest.control.member.JoinFormControl;
import com.intheforest.control.member.LoginControl;
import com.intheforest.control.book.BookAppCont;
import com.intheforest.control.book.BookCalCont;

public class FrontController extends HttpServlet{
	Map<String, Control> map;
	
	public FrontController() {
		map = new HashMap<>();
	}
	
	@Override
	public void init() throws ServletException {
		// 로그인, 회원가입
		map.put("/login.do", new LoginControl());
		map.put("/joinForm.do", new JoinFormControl());
		
		
		
		
  
		
		// 게시판
		map.put("/boardList.do", new BoardListControl());
		map.put("/board.do", new BoardControl());
		map.put("/addBoardForm.do", new AddBoardFormControl());
		map.put("/addBoard.do", new AddBoardControl());
		map.put("/modifyBoard.do", new ModifyBoardControl());
		map.put("/deleteBoard.do", new DeleteBoardControl());
		
		
		
  
		
		
		//캠핑예약
		map.put("/book_calendar.do", new BookCalCont());
		map.put("/book_app.do", new BookAppCont());
		
  
  
  
  
		
		// 마이페이지
		map.put("/myPageBookList.do", new MyBookControl());
		
  
  
  
  
  
    
    
    
    
    
    
    
    // 사이트
		map.put("/main.do", new MainPageControl());
	};
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI(); 
		String context = req.getContextPath(); 
		String page = url.substring(context.length()); 
		
		Control control = map.get(page);
		control.exec(req, resp);
	}
}
