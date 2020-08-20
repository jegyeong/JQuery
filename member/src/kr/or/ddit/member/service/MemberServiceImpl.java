package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;


public class MemberServiceImpl implements IMemberService {
	private static IMemberService service = new MemberServiceImpl();
	private IMemberDao dao;
	
	private MemberServiceImpl(){
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance(){
		if(service == null){
			service = new MemberServiceImpl();
		}
		return service;
	}
	
	@Override
	public MemberVO getMemberInfo(Map<String, String> params) {
		MemberVO memberInfo = null;
		try {
			memberInfo = dao.getMemberInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberInfo;
	}

	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = null;
		try {
			memberList = dao.getMemberList();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return memberList;
	}

	@Override
	public String insertMemberInfo(MemberVO memberInfo) {
		String mem_name = null;
		try {
			mem_name = dao.insertMemberInfo(memberInfo);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return mem_name;
	}

	@Override
	public List<ZipVO> getZipSearch(String dong) {
		List<ZipVO>   list = null;
		
		try {
			list = dao.getZipSearch(dong);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	
}


