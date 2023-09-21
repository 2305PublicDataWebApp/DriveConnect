package kr.co.drive.often.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.often.domain.Often;
import kr.co.drive.often.store.OftenStore;

@Repository
public class OftenStoreLogic implements OftenStore{

	@Override
	public int insertOften(SqlSession session, Often often) {
		int result = session.insert("OftenMapper.insertOften", often);
		return result;
	}

	@Override
	public List<Often> selectOftenList(SqlSession session, Often often) {
		List<Often> oList = session.selectList("OftenMapper.selectOftenList", often);
		return oList;
	}

	@Override
	public Often selectOftenByNo(SqlSession session, Integer oNo) {
		Often oftenOne = session.selectOne("OftenMapper.selectOftenByNo", oNo);
		return oftenOne;
	}

	@Override
	public int updateOften(SqlSession session, Often often) {
		int result = session.update("OftenMapper.updateOften", often);
		return result;
	}

	@Override
	public int deleteOften(SqlSession session, Integer oNo) {
		int result = session.delete("OftenMapper.deleteOften", oNo);
		return result;
	}

	
}
