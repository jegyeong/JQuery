package kr.or.ddit.buyer.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.dao.IBuyerDaoImpl;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerServiceImpl implements IBuyerService {

	private static IBuyerService service = new IBuyerServiceImpl();
	private IBuyerDao dao;
	
	private IBuyerServiceImpl(){
		dao = IBuyerDaoImpl.getInstance();
	}
	
	public static IBuyerService getInstance(){
		if(service == null){
			service = new IBuyerServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<BuyerVO> getNameList() {
		List<BuyerVO> list = null;
		try {
			list = dao.getNameList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BuyerVO getBuyerDetail(String buyer_id) {
		BuyerVO  vo = null;
		try {
			vo = dao.getBuyerDetail(buyer_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

}
