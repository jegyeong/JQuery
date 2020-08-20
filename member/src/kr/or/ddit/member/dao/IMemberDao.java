package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;


public interface IMemberDao {

		public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
		public List<MemberVO> getMemberList() throws SQLException;

		public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
		
		public List<ZipVO>  getZipSearch(String dong) throws SQLException;
		
}
