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
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.IProdServiceImpl;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.ProdVO;


@WebServlet("/ProdDetailServlet")
public class ProdDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ProdDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String id = request.getParameter("id");
		
		IProdService  service = IProdServiceImpl.getInstance();
		ProdVO  vo = service.getProdDetail(id);
		
		request.setAttribute("vo", vo);
		RequestDispatcher   disp = request.getRequestDispatcher("0726_ajax/prodDetail.jsp");
	    disp.forward(request, response);
	}

}
