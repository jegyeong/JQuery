package kr.or.ddit.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;


@WebServlet("/MemberJoinServlet")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원가입 폼에서 입력한 값들을 가져온다 
		//MemberVO에 저장 
		MemberVO  vo = new MemberVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IMemberService  service = IMemberServiceImpl.getInstance();
		//저장후 에 결과
		String  name = service.insertMemberInfo(vo);
		request.setAttribute("resname", name);
		
		//입력한 이름을 저장 
		request.setAttribute("inputname", vo.getMem_name());
		
		//응답결과를 jsp에 위임해서 만들도록 한다 
		RequestDispatcher  disp = request.getRequestDispatcher("member/memberJoin.jsp");
		disp.forward(request, response);
		
	}

}

