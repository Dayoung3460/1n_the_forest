package com.intheforest.control.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intheforest.common.Control;

public class NoticeJsonControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
/* 쿼리문 메모
SELECT *
FROM   board
WHERE  LOWER(board_category) = 'notice'
ORDER  BY notice_flag DESC, write_date DESC, board_no DESC;
*/
	}

}
