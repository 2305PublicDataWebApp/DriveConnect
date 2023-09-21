package kr.co.drive.often.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.notice.domain.Notice;
import kr.co.drive.notice.store.NoticeStore;
import kr.co.drive.often.domain.Often;
import kr.co.drive.often.service.OftenService;
import kr.co.drive.often.store.OftenStore;

@Service
public class OftenServiceImpl implements OftenService{

	@Autowired
	private SqlSession session;
	@Autowired
	private OftenStore oStore;
	
	
	@Override
	public int insertOften(Often often) {
		int result = oStore.insertOften(session, often);
		return result;
	}
	@Override
	public List<Often> selectOftenList(Often often) {
		List<Often> oList = oStore.selectOftenList(session, often);
		return oList;
	}
	@Override
	public Often selectOftenByNo(Integer oNo) {
		Often oftenOne = oStore.selectOftenByNo(session, oNo);
		return oftenOne;
	}
	@Override
	public int updateOften(Often often) {
		int result = oStore.updateOften(session, often);
		return result;
	}
	@Override
	public int deleteOften(Integer oNo) {
		int result = oStore.deleteOften(session, oNo);
		return result;
	}
}
