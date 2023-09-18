package kr.co.drive.subs.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.subs.domain.Subs;

public interface SubsStore {

	int insertBoard(SqlSession sqlsession, Subs subs);

}
