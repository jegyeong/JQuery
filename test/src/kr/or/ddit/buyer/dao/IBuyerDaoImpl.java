package kr.or.ddit.buyer.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.vo.BuyerVO;

public class IBuyerDaoImpl implements IBuyerDao {

	private static IBuyerDao dao = new IBuyerDaoImpl();
	private SqlMapClient client;
	
	private IBuyerDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClinet();
	}
	
	public static IBuyerDao getInstance(){
		if(dao == null){
			dao = new IBuyerDaoImpl();
		}
		return dao;
	}

	@Override
	public List<BuyerVO> getNameList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("buyer.buyerNameList");
	}

	@Override
	public BuyerVO getBuyerDetail(String buyer_id) throws SQLException {
		// TODO Auto-generated method stub
		return (BuyerVO)client.queryForObject("buyer.buyerDetail", buyer_id);
	}

}




