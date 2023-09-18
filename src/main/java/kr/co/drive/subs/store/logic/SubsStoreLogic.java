package kr.co.drive.subs.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.subs.domain.Subs;
import kr.co.drive.subs.store.SubsStore;

@Repository
public class SubsStoreLogic implements SubsStore {

	@Override
	public int insertBoard(SqlSession sqlsession, Subs subs) {
		// TODO Auto-generated method stub
		int result = sqlsession.insert("SubsMapper.insertSubs", subs);
		return result;
	}

}
