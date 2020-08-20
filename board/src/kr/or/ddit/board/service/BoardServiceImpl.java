package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements IBoardService {

	private static IBoardService  service = new BoardServiceImpl();
	
	public static IBoardService  getInstance(){
		return service;
	}
	
	private IBoardDao  dao ;
	
	private  BoardServiceImpl(){
		dao = BoardDaoImpl.getInstance();
	}
	
	@Override
	public List<BoardVO> selectAll() {
		List<BoardVO>  list = null;
		
		try {
			list = dao.selectAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public BoardVO selectView(int board_no) {
		BoardVO  vo = null;
		try {
			vo = dao.selectView(board_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int updateBoard(BoardVO vo) {
		int a=0;
		try {
			a = dao.updateBoard(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	@Override
	public int insertBoard(BoardVO vo) {
		int a =0;
		try {
			a = dao.insertBoard(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

	/*@Override
	public List<BoardVO> selectAll(Map<String, Integer> map) {
		List<BoardVO> list = null;
		try {
			list = dao.selectAll(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
*/
	/*@Override
	public int getListCount() {
		int count =0;
		try {
			count = dao.getListCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
*/
	@Override
	public int deleteBoard(Map<String, Object> map) {
		int a = 0;
		
		try {
			a = dao.deleteBoard(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

}
