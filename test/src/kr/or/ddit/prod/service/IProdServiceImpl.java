package kr.or.ddit.prod.service;


import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.IProdDaoImpl;
import kr.or.ddit.vo.ProdVO;

public class IProdServiceImpl implements IProdService {
	private static IProdService service = new IProdServiceImpl();
	private IProdDao dao;
	
	private IProdServiceImpl(){
		dao = IProdDaoImpl.getInstance();
	}
	public static IProdService getInstance(){
		return (service == null) ? new IProdServiceImpl() : service;
	}
	@Override
	public List<ProdVO> getProdList(String lprod_gu) {
		List<ProdVO>  list = null;
		try {
			list = dao.getProdList(lprod_gu);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public ProdVO getProdDetail(String prod_id) {
		ProdVO  vo = null;
		try {
			vo = dao.getProdDetail(prod_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	
}
