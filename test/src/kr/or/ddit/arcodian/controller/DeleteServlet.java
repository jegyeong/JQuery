package kr.or.ddit.arcodian.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.arcodian.service.BoardServiceImpl;
import kr.or.ddit.arcodian.service.IBoardService;
import kr.or.ddit.arcodian.vo.BoardVO;


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

		int seq = Integer.parseInt(request.getParameter("seq"));
		String pass = request.getParameter("pass");
	
		Map<String, Object>  map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("pass", pass);
		
		IBoardService  service =  BoardServiceImpl.getInstance();
		int flag = service.deleteBoard(map);

		request.setAttribute("flag", flag);
		RequestDispatcher  disp = request.getRequestDispatcher("0108_arcodian/delete.jsp");
		disp.forward(request, response);
		
				
	}

}
