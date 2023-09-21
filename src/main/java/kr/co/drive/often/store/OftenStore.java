package kr.co.drive.often.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.often.domain.Often;

public interface OftenStore {

	int insertOften(SqlSession session, Often often);

	List<Often> selectOftenList(SqlSession session, Often often);

	Often selectOftenByNo(SqlSession session, Integer oNo);

	int updateOften(SqlSession session, Often often);

	int deleteOften(SqlSession session, Integer oNo);

}
