package kr.co.drive.reserve.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.reserve.domain.Reserve;
import kr.co.drive.reserve.store.ReserveStore;

@Repository
public class ReserveStoreLogic implements ReserveStore{

	@Override
	public int insertReserve(SqlSession sqlSession, Reserve reserve) {
		int result = sqlSession.insert("ReserveMapper.insertReserve", reserve);
		return result;
	}

}
