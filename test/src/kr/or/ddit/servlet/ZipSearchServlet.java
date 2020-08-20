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
import kr.or.ddit.vo.ZipVO;

@WebServlet("/ZipSearchServlet")
public class ZipSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ZipSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�엯�젰�븳 �룞媛믪쓣 媛��졇�삩�떎 
		
		request.setCharacterEncoding("UTF-8");
		
		String dong = request.getParameter("dong");
		
		IMemberService   service = IMemberServiceImpl.getInstance();
		
		List<ZipVO> list = service.getZipSearch(dong);
		
		request.setAttribute("list", list);
		//RequestDispatcher  disp =
		//		  request.getRequestDispatcher("0727_ajax/zipgson.jsp");
		
		//RequestDispatcher  disp =
		//		  request.getRequestDispatcher("member/zipgson.jsp");
		
		RequestDispatcher  disp =
						  request.getRequestDispatcher("member/zip.jsp");
				
		disp.forward(request, response);
		
		
		
	}

}
















