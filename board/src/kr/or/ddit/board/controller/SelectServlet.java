package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
 * Servlet implementation class ArcodianServlet
 */
@WebServlet("/BoardList")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
    //페이징 처리 
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int cpage = Integer.parseInt(request.getParameter("cpage"));
		 IBoardService  service = BoardServiceImpl.getInstance();
		 
		 int totalcount = service.getListCount();
		 int perlist = 5;
		 
		 int totalpage =  (int)Math.ceil(totalcount  / (double)perlist);
		 
		 //출력할 글 목록 가져오기 1페이지 : 1~5  2페이지:6~10  3:11~15
		 int start = (cpage -1) * perlist +1;
		 int end = start + perlist -1;
		 
		 Map<String, Integer> map = new HashMap<String, Integer>();
		 map.put("start", start);
		 map.put("end", end);
		 
		 List<BoardVO>  list = service.selectAll(map);
		
		 request.setAttribute("list", list);
		 request.setAttribute("totalpage", totalpage);
	
		 RequestDispatcher  disp = request.getRequestDispatcher("board_data/list.jsp");
		 disp.forward(request, response);
	}
	*/
	
    //모든 데이터 리스트 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IBoardService  service = BoardServiceImpl.getInstance();
		 
		List<BoardVO>  list = service.selectAll();
		
		request.setAttribute("list", list);
		RequestDispatcher  disp = request.getRequestDispatcher("board_data/list.jsp");
		disp.forward(request, response);
	}

}















