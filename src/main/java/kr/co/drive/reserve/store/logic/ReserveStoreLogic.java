package kr.co.drive.reserve.store.logic;

import java.util.List;

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

	@Override
	public List<Reserve> getList(SqlSession sqlSession, int unum) {
		// TODO Auto-generated method stub
		List<Reserve> result = sqlSession.selectList("ReserveMapper.reserveList", unum);
		return result;
	}

	@Override
	public int getmyTotalPrice(SqlSession sqlSession, int unum) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("ReserveMapper.getmyTotalPrice", unum);
		return result;
	}

	@Override
	public List<Reserve> getStoreNameList(SqlSession sqlSession, String sarea) {
		// TODO Auto-generated method stub
		List<Reserve> result = sqlSession.selectList("ReserveMapper.getStoreNameList", sarea);
		return result;
	}

}