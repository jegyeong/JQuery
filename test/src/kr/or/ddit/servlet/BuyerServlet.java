package kr.or.ddit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.service.IBuyerServiceImpl;
import kr.or.ddit.vo.BuyerVO;

@WebServlet("/BuyerServlet")
public class BuyerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public BuyerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IBuyerService  service = IBuyerServiceImpl.getInstance();
		List<BuyerVO> list = service.getNameList();
		
		request.setAttribute("list", list);
		RequestDispatcher   disp = request.getRequestDispatcher("0725_ajax/buyerNames.jsp");
	    disp.forward(request, response);
		
	}

	
}
