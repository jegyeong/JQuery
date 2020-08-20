package kr.or.ddit.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.service.IBuyerServiceImpl;
import kr.or.ddit.vo.BuyerVO;

/**
 * Servlet implementation class BuyerDetailServlet
 */
@WebServlet("/BuyerDetailServlet")
public class BuyerDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyerDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		
		IBuyerService  service = IBuyerServiceImpl.getInstance();
		
		BuyerVO  vo =  service.getBuyerDetail(id);
		
		request.setAttribute("vo", vo);
		RequestDispatcher   disp = request.getRequestDispatcher("0725_ajax/buyerDetail.jsp");
	    disp.forward(request, response);
	}

}










