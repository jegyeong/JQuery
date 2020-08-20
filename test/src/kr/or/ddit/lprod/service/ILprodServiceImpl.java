package kr.or.ddit.lprod.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.ILprodDaoImpl;
import kr.or.ddit.vo.LprodVO;

public class ILprodServiceImpl  implements ILprodService{

	private static ILprodService service = new ILprodServiceImpl();
	private ILprodDao dao;
	
	private ILprodServiceImpl(){
		dao = ILprodDaoImpl.getInstance();
	}
	
	public static ILprodService getInstance(){
		if(service == null){
			service = new ILprodServiceImpl();
		}
		return service;
	}
	@Override
	public List<LprodVO> getLprodList() {
		List<LprodVO>  list = null;
		
		try {
			list = dao.getLprodList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
