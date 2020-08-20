package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ZipVO;

public interface IMemberService {
	
	//id중복검사
	public MemberVO getMemberInfo(Map<String, String> params);
	
	public List<MemberVO> getMemberList();
	
	//저장
	public String insertMemberInfo(MemberVO memberInfo);
	
	//우편번호검색
	public List<ZipVO>  getZipSearch(String dong);
	
}


