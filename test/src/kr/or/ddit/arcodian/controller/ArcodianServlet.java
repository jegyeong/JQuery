package kr.or.ddit.arcodian.controller;

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

import kr.or.ddit.arcodian.service.BoardServiceImpl;
import kr.or.ddit.arcodian.service.IBoardService;
import kr.or.ddit.arcodian.vo.BoardVO;

/**
 * Servlet implementation class ArcodianServlet
 */
@WebServlet("/BoardList")
public class ArcodianServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ArcodianServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		 ////////////////////////////////////////////////////////////////////////
		 //String cpge = request.getParameter("cpage");
		 
		 //IBoardService  service = BoardServiceImpl.getInstance();
		 
		 //List<BoardVO> list = service.selectAll();
		 
		 //view페이지 이동  - jsp에 위임해서 json데이타 생성 -응답한다
		 // request.setAttribute("list", list);
		 
		 //RequestDispatcher  disp = request.getRequestDispatcher("0108_arcodian/list.jsp");
		 //disp.forward(request, response);
		 
		 ////////////////////////////////////////////////////////////////////////
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
		 
		 
		 RequestDispatcher  disp = request.getRequestDispatcher("0108_arcodian/listpage.jsp");
		 disp.forward(request, response);
		 
		 
	}

}















