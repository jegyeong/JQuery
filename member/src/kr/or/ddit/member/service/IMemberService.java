package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberService {

	public MemberVO getMemberInfo(Map<String, String> params);
	
	public List<MemberVO> getMemberList();

	public String insertMemberInfo(MemberVO memberInfo);
	
	public List<ZipVO>  getZipSearch(String dong);
	
}
