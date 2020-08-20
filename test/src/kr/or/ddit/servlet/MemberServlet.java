package kr.or.ddit.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMemberService  service =   IMemberServiceImpl.getInstance();
	    List<MemberVO>   list = 	service.getMemberList();
		
	   
	    request.setAttribute("list", list);
	    //RequestDispatcher   disp = request.getRequestDispatcher("0725_ajax/member.jsp");
	    RequestDispatcher   disp = request.getRequestDispatcher("fetchmember/member.jsp");
	    disp.forward(request, response);
	}
}











