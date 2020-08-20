package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardDao {
	
	public List<BoardVO> selectAll() throws SQLException;
	/*public List<BoardVO> selectAll(Map<String, Integer> map) throws SQLException;*/
	
	/*public int getListCount() throws SQLException;*/
	
	public BoardVO  selectView(int board_no) throws SQLException;
	
	public int updateBoard(BoardVO vo) throws SQLException;
	
	public int insertBoard(BoardVO vo) throws SQLException;
	public int deleteBoard(Map<String, Object> map) throws SQLException;
}
