package kr.co.drive.reserve.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.reserve.domain.Reserve;
import kr.co.drive.reserve.service.ReserveService;
import kr.co.drive.reserve.store.ReserveStore;

@Service
public class ReserveServiceImpl implements ReserveService{

	@Autowired
	private ReserveStore rStore;
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertReserve(Reserve reserve) {
		int result = rStore.insertReserve(sqlSession, reserve);
		return result;
	}
}