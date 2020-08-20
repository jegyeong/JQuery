package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.BuyerVO;

public interface IBuyerDao {
  
	public List<BuyerVO> getNameList() throws SQLException;
	
	public BuyerVO getBuyerDetail(String buyer_id) throws SQLException;
}
