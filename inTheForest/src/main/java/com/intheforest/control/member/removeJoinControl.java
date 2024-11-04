package com.intheforest.control.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.intheforest.common.Control;
import com.intheforest.service.MemberService;
import com.intheforest.service.MemberServiceImpl;

public class removeJoinControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 값을 받을 때 (클라이언트가 보낸 값) 문자 안깨지게 해주는 것 
		resp.setContentType("text/json;charset=utf-8"); // 값을 보낼 때 문자 안깨지게 해주는것
		
		// 멤버 아이디 parameter 받기
		String memberID = req.getParameter("memberId");
		
		MemberService svc = new MemberServiceImpl();
		Map<String,Object> result = new HashMap<>();
		
		try {
			///성공시에는 {retCode:OK} 반환
			svc.removeJoin(memberID);
			result.put("retCode", "OK");
			
		}catch(Exception e) {
			result.put("retCode","FAIL");
		}
		//Gson 활용해서 json으로 변경 
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(result));
	}

}