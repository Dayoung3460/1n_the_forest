package com.intheforest.control.site;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.common.SearchDTO;
import com.intheforest.service.BoardService;
import com.intheforest.service.BoardServiceImpl;
import com.intheforest.vo.BoardVO;

public class IntroPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("site/intro.tiles").forward(req, resp);
	}

}
