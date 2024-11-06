package com.intheforest.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.control.board.AddBoardControl;
import com.intheforest.control.board.AddBoardFormControl;
import com.intheforest.control.board.BoardControl;
import com.intheforest.control.board.BoardListControl;
import com.intheforest.control.board.BoardPrevNextControl;
import com.intheforest.control.board.DeleteBoardControl;
import com.intheforest.control.board.ModifyBoardControl;
import com.intheforest.control.book.BookAppCont;
import com.intheforest.control.book.BookAppFormCont;
import com.intheforest.control.book.BookCalCont;
import com.intheforest.control.book.CancelBookControl;
import com.intheforest.control.book.DetailBookControl;
import com.intheforest.control.book.MyBookControl;
import com.intheforest.control.book.OptionListControl;
import com.intheforest.control.member.DetailJoinControl;
import com.intheforest.control.member.FindIdControl;
import com.intheforest.control.member.FindPwControl;
import com.intheforest.control.member.JoinFormControl;
import com.intheforest.control.member.LogOutControl;
import com.intheforest.control.member.LoginControl;
import com.intheforest.control.member.MemberListControl;
import com.intheforest.control.member.ModifyJoinControl;
import com.intheforest.control.member.removeJoinControl;
import com.intheforest.control.site.IntroPageControl;
import com.intheforest.control.site.MainPageControl;


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
		map.put("/book_calendar.do", new BookCalCont());
		map.put("/book_app.do", new BookAppCont());
		map.put("/bookCalendar.do", new BookCalCont());
		map.put("/bookApp.do", new BookAppCont());
		map.put("/bookAppForm.do", new BookAppFormCont());
		
		map.put("/cancelBook.do", new CancelBookControl());
		map.put("/detailBook.do", new DetailBookControl());
  
  
  
		
		// 마이페이지
		map.put("/myPageBookList.do", new MyBookControl());
		
  
  
  
  
  
    
    
    
    
		//관리자용 회원목록 조회
		map.put("/memberList.do", new MemberListControl());
		map.put("/optionList.do", new OptionListControl());
    
    
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
