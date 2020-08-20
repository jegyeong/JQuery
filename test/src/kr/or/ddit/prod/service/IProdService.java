package kr.or.ddit.prod.service;

import java.util.List;
import kr.or.ddit.vo.ProdVO;

public interface IProdService {
	
	public List<ProdVO> getProdList(String lprod_gu) ;
    public ProdVO getProdDetail(String prod_id) ;
}
