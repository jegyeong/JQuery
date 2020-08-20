package kr.or.ddit.lprod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;

import kr.or.ddit.vo.LprodVO;

public class ILprodDaoImpl  implements ILprodDao{

	private static ILprodDao dao = new ILprodDaoImpl();
	private SqlMapClient client;
	
	private ILprodDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClinet();
	}
	
	public static ILprodDao getInstance(){
		if(dao == null){
			dao = new ILprodDaoImpl();
		}
		return dao;
	}

	@Override
	public List<LprodVO> getLprodList() throws SQLException {
		// TODO Auto-generated method stub
		return client.queryForList("lprod.lprodList");
	}

}
