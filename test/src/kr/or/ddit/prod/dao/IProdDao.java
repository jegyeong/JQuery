package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ProdVO;

public interface IProdDao {
	
	public List<ProdVO> getProdList(String lprod_gu) throws SQLException;
    public ProdVO getProdDetail(String prod_id) throws SQLException;


}
