package kr.co.drive.subs.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.subs.domain.PageInfo;
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

	@Override
	public List<Subs> selectBoardList(SqlSession sqlsession, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		// TODO Auto-generated method stub
		List<Subs> sList = sqlsession.selectList("SubsMapper.selectBoardList", null, rowBounds);
		return sList;
	}

	@Override
	public int selectListCount(SqlSession sqlsession) {
		// TODO Auto-generated method stub
		int result = sqlsession.selectOne("SubsMapper.selectListCount");
		return result;
	}

}
