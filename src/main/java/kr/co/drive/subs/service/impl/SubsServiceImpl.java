package kr.co.drive.subs.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.subs.domain.Subs;
import kr.co.drive.subs.service.SubsService;
import kr.co.drive.subs.store.SubsStore;

@Service
public class SubsServiceImpl implements SubsService {

	@Autowired
	private SubsStore sStore;
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int insertBoard(Subs subs) {
		// TODO Auto-generated method stub
		int result = sStore.insertBoard(sqlsession, subs);
		return result;
	}

}
