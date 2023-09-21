package kr.co.drive.reserve.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.reserve.domain.Reserve;

public interface ReserveStore {

	int insertReserve(SqlSession sqlSession, Reserve reserve);

}