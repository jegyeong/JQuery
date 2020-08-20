package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ZipVO;

public interface IMemberDao {
	//id중복검사
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public List<MemberVO> getMemberList() throws SQLException;
	//저장
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
	
	//우편번호검색
	public List<ZipVO>  getZipSearch(String dong) throws SQLException;
	
}












