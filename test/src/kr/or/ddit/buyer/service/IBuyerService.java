package kr.or.ddit.buyer.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerService {
	
	public List<BuyerVO> getNameList();
	
	public BuyerVO getBuyerDetail(String buyer_id) ;
}
