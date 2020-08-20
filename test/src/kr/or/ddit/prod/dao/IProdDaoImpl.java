package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.vo.ProdVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class IProdDaoImpl implements IProdDao {
	private static IProdDao dao = new IProdDaoImpl();
	private SqlMapClient client;
	
	public IProdDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClinet();
	}
	
	public static IProdDao getInstance(){
		return (dao == null) ? new IProdDaoImpl() : dao ;
	}

	@Override
	public List<ProdVO> getProdList(String lprod_gu) throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("prod.getProdInfo", lprod_gu);
	}

	@Override
	public ProdVO getProdDetail(String prod_id) throws SQLException {
		// TODO Auto-generated method stub
		return (ProdVO) client.queryForObject("prod.getProdDetail", prod_id);
	}

	

}




