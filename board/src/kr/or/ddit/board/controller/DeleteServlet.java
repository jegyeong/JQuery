package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;


/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int board_no = Integer.parseInt(request.getParameter("board_no"));
		String password = request.getParameter("password");
	
		Map<String, Object>  map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		map.put("password", password);
		
		IBoardService  service =  BoardServiceImpl.getInstance();
		int flag = service.deleteBoard(map);

		request.setAttribute("flag", flag);
		RequestDispatcher  disp = request.getRequestDispatcher("board_data/delete.jsp");
		disp.forward(request, response);
				
	}

}
