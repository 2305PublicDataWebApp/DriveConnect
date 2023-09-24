package kr.co.drive.reserve.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.reserve.domain.Reserve;

public interface ReserveStore {

	int insertReserve(SqlSession sqlSession, Reserve reserve);

	List<Reserve> getList(SqlSession sqlSession, int unum);

	int getmyTotalPrice(SqlSession sqlSession, int unum);

	List<Reserve> getStoreNameList(SqlSession sqlSession, String sarea);

}