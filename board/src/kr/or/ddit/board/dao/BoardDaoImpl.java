package kr.or.ddit.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.util.BuildedSqlMapClient;

public class BoardDaoImpl implements IBoardDao {

	Connection con;
	PreparedStatement stmt;
	ResultSet rs;
	private SqlMapClient smc;

	private static IBoardDao dao = new BoardDaoImpl();

	public static IBoardDao getInstance() {
		if (dao == null)
			dao = new BoardDaoImpl();
		return dao;
	}

	private BoardDaoImpl() {
		smc = BuildedSqlMapClient.getSqlMapClient();
	}

	@Override
	public List<BoardVO> selectAll() throws SQLException {

		List<BoardVO> list = new ArrayList<>();
		try {
			list = smc.queryForList("jdbcBoard.getAllBoard");
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		} 
		return list;
	}

	@Override
	public BoardVO selectView(int board_no) throws SQLException {
		BoardVO vo = null;
		try {
			vo = (BoardVO) smc.queryForObject("jdbcBoard.getBoard", board_no);
		} catch (SQLException e) {
			vo = null;
			e.printStackTrace();
		} 
		return vo;
	}

	@Override
	public int updateBoard(BoardVO vo) throws SQLException {
		int result = 0;
		try {
			result = smc.update("jdbcBoard.updateBoard", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return result;
	}

	@Override
	public int insertBoard(BoardVO vo) throws SQLException {
		int result = 0;
		
		try {
			Object obj = smc.insert("jdbcBoard.insertBoard", vo);
			if(obj==null){
				result = 1;
			}
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		} 
		return result;

	}

	/*@Override
	public List<BoardVO> selectAll(Map<String, Integer> map) throws SQLException {
		List<BoardVO> list = new ArrayList<BoardVO>();

		String sql = "select A.* from ( " + "     select rownum as rnum, B.*  from ( "
				+ "          select * from jdbc_board order by board_no desc) B " + "     where rownum <= ?) A "
				+ "  where A.rnum >= ? ";

		stmt = con.prepareStatement(sql);
		stmt.setInt(1, map.get("end"));
		stmt.setInt(2, map.get("start"));

		rs = stmt.executeQuery();

		while (rs.next()) {
			BoardVO vo = new BoardVO();
			vo.setSeq(rs.getInt("board_no"));
			vo.setWriter(rs.getString("board_writer"));
			vo.setSubject(rs.getString("board_title"));
			// vo.setMail(rs.getString("mail"));
			// vo.setPassword(rs.getString("password"));
			vo.setContent(rs.getString("board_content"));

			vo.setWdate(rs.getString("board_date"));
			vo.setHit(rs.getInt("board_cnt"));

			list.add(vo);
		}
		rs.close();
		stmt.close();

		return list;
	}*/

	/*@Override
	public int getListCount() throws SQLException {
		int count = 0;

		String sql = "select count(*) cnt from jdbc_board";

		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		if (rs.next()) {
			count = rs.getInt("cnt");
		}

		rs.close();
		stmt.close();

		return count;
	}
*/
	@Override
	public int deleteBoard(Map<String, Object> map) throws SQLException {
		int a = 0;

		String sql = "delete jdbc_board where seq=? and  password= ?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, (int) map.get("board_no"));
		stmt.setString(2, (String) map.get("pass"));

		a = stmt.executeUpdate();

		stmt.close();

		return a;
	}

}
