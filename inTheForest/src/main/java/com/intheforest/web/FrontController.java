package com.intheforest.web;

import com.intheforest.common.Control;
import com.intheforest.control.board.*;
import com.intheforest.control.book.BookAppCont;
import com.intheforest.control.book.BookAppFormCont;
import com.intheforest.control.book.BookCalCont;
import com.intheforest.control.member.*;
import com.intheforest.control.mypage.MyBookControl;
import com.intheforest.control.site.IntroPageControl;
import com.intheforest.control.site.MainPageControl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


public class FrontController extends HttpServlet{
	Map<String, Control> map;
	
	public FrontController() {
		map = new HashMap<>();
	}
	
	@Override
	public void init() throws ServletException {
		// 로그인, 회원가입
		map.put("/login.do", new LoginControl());
		map.put("/joinForm.do",new JoinFormControl());
		map.put("/findId.do", new FindIdControl());
		map.put("/findPw.do", new FindPwControl());
		map.put("/checkId.do",new JoinFormControl());
		map.put("/DetailJoin.do", new DetailJoinControl());
		map.put("/modifyJoin.do",new ModifyJoinControl());
		map.put("/removejoin.do", new removeJoinControl());
		map.put("/logOut.do", new LogOutControl());
		
		
		
		
		
  
		
		// 게시판
		map.put("/boardList.do", new BoardListControl());
		map.put("/board.do", new BoardControl());
		map.put("/addBoardForm.do", new AddBoardFormControl());
		map.put("/addBoard.do", new AddBoardControl());
		map.put("/modifyBoard.do", new ModifyBoardControl());
		map.put("/deleteBoard.do", new DeleteBoardControl());
		map.put("/boardPrevNext.do", new BoardPrevNextControl());

		
	
		
		
		//캠핑예약
		map.put("/bookCalendar.do", new BookCalCont());
		map.put("/bookApp.do", new BookAppCont());
		map.put("/bookAppForm.do", new BookAppFormCont());
		
  
  
  
  
		
		// 마이페이지
		map.put("/myPageBookList.do", new MyBookControl());
		
  
  
  
  
  
    
    
    
    
    //관리자용 메뉴
		map.put("/memberList.do", new MemberListControl());
    
    
    // 사이트
		map.put("/main.do", new MainPageControl());
		map.put("/intro.do", new IntroPageControl());
		
		
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
