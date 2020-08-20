package kr.or.ddit.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("test/IDCheckServlet")
public class IDCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public IDCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//입력한 id값을 가져온다 
		String id = request.getParameter("id");
		
		IMemberService  service = IMemberServiceImpl.getInstance();
		
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("id", id);
		
		//입력한 id를 DB에서 select한 결과값 은 vo
		MemberVO  vo = service.getMemberInfo(param);
		
		//json데이타를 jsp에서 만들도록 위임 
		request.setAttribute("vo", vo);
		request.setAttribute("inputid", id);
		RequestDispatcher  disp = request.getRequestDispatcher("member/idcheck.jsp");
		disp.forward(request, response);
		
		
	}

}















