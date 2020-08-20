
package kr.or.ddit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.IProdServiceImpl;
import kr.or.ddit.vo.ProdVO;

/**
 * Servlet implementation class ProdServlet
 */
@WebServlet("/ProdServlet")
public class ProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String lprod_gu = request.getParameter("gu");
		
		IProdService  service = IProdServiceImpl.getInstance();
		List<ProdVO> list = service.getProdList(lprod_gu);
		
		request.setAttribute("list", list);
	    
		//RequestDispatcher   disp = request.getRequestDispatcher("0726_ajax/prodjson.jsp");
		//RequestDispatcher   disp = request.getRequestDispatcher("0726_ajax/prodjsondata.jsp");
		RequestDispatcher   disp = request.getRequestDispatcher("0726_ajax/prod.jsp");
		disp.forward(request, response);
	}

}




