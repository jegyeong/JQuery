package kr.or.ddit.lprod.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.LprodVO;

public interface ILprodDao {
   public List<LprodVO> getLprodList() throws SQLException;
}
