package com.intheforest.control.site;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;

public class SiteUseControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int siteNo = Integer.parseInt(req.getParameter("siteNo"));
		String useFlag = req.getParameter("useFlag");
		BookService svc = new BookServiceImpl();
		
		Map<String,Object> result = new HashMap<>();
		
		try {
			svc.siteUse(siteNo, useFlag);
			result.put("retCode", "OK");
			
		}catch(Exception e) {
			e.printStackTrace();
			result.put("retCode", "FAIL");
		}
	}

}
