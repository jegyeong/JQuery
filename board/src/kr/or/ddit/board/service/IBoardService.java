package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardService {
	public List<BoardVO> selectAll();
	/*public List<BoardVO> selectAll(Map<String, Integer> map);*/
	
	/*public int getListCount();*/
	
	public BoardVO  selectView(int board_no);
	public int updateBoard(BoardVO vo);
	
	public int insertBoard(BoardVO vo);
	public int deleteBoard(Map<String, Object> map);
}
