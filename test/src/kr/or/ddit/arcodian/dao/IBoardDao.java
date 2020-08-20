package kr.or.ddit.arcodian.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.arcodian.vo.BoardVO;

public interface IBoardDao {
	
	public List<BoardVO> selectAll() throws SQLException;
	public List<BoardVO> selectAll(Map<String, Integer> map) throws SQLException;
	
	public int getListCount() throws SQLException;
	
	public BoardVO  selectView(int seq) throws SQLException;
	
	public int updateBoard(BoardVO vo) throws SQLException;
	
	public int insertBoard(BoardVO vo) throws SQLException;
	public int deleteBoard(Map<String, Object> map) throws SQLException;
}
