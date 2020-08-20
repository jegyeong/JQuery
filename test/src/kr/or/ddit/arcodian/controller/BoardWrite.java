package kr.or.ddit.arcodian.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.arcodian.service.BoardServiceImpl;
import kr.or.ddit.arcodian.service.IBoardService;
import kr.or.ddit.arcodian.vo.BoardVO;

/**
 * Servlet implementation class BoardWrite
 */
@WebServlet("/BoardWrite")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWrite() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//입력한 값을 가져와서 vo에 저장 
		BoardVO  vo = new BoardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//ip
		vo.setWip(request.getRemoteAddr());
		
		IBoardService  service = BoardServiceImpl.getInstance();
		int a = service.insertBoard(vo);
		
		request.setAttribute("a", a);
		RequestDispatcher  disp = request.getRequestDispatcher("0108_arcodian/write.jsp");
		disp.forward(request, response);
	}

}
