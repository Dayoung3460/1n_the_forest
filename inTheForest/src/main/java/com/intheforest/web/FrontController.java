package com.intheforest.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.control.ExampleControl;
import com.intheforest.control.board.NoticeJsonControl;
import com.intheforest.control.site.MainPageControl;

public class FrontController extends HttpServlet{
	Map<String, Control> map;
	
	public FrontController() {
		map = new HashMap<>();
	}
	
	@Override
	public void init() throws ServletException {
		map.put("/example.do", new ExampleControl());
		
		map.put("/main.do", new MainPageControl());
		
		// 공지사항 main 출력
		// notice_flag DESC, write_date DESC, board_no DESC 기준 상위 5개 가져옴.
		map.put("/noticeJson.do", new NoticeJsonControl());
		
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
