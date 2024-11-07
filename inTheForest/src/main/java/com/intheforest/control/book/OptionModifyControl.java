package com.intheforest.control.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;
import com.intheforest.service.BookService;
import com.intheforest.service.BookServiceImpl;
import com.intheforest.vo.BookVO;

public class OptionModifyControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BookService bsvc = new BookServiceImpl();
		List<BookVO> options = bsvc.optionList();
		
		//배열 형태의 파라미터값을 하나씩 가져옴.
		String[] optionNos = req.getParameterValues("optionNo");
		String[] prices = req.getParameterValues("price");
		
				
		int cnt = 0;
		
		for(int i = 0; i < optionNos.length; i++) {
			//가격이 변한 경우에만 수정 컨트롤 실행
			if(!prices[i].equals(options.get(i).getOptionPrice())){ 
				try {
					cnt += bsvc.modifyOptPrice(Integer.parseInt(prices[i]), Integer.parseInt(optionNos[i]));
					System.out.println(Integer.parseInt(optionNos[i]) + "옵션의 가격을 변경했습니다. => " + Integer.parseInt(prices[i]));
				} catch (Exception e) {
					e.printStackTrace();
					resp.getWriter().print("{\"retCode\":\"FAIL\"}");
				}
			}
		}
		
		if(cnt == optionNos.length) {
			resp.getWriter().print("{\"retCode\":\"OK\"}");
		}
	
	}

}
