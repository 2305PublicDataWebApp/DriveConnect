package kr.co.drive.subs.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.subs.domain.PageInfo;
import kr.co.drive.subs.domain.Subs;
import kr.co.drive.subs.domain.SubsFiles;
import kr.co.drive.subs.store.SubsStore;

@Repository
public class SubsStoreLogic implements SubsStore {

	@Override
	public int insertBoard(SqlSession sqlsession, Subs subs) {
		// TODO Auto-generated method stub
		sqlsession.insert("SubsMapper.insertSubs", subs);
		return subs.getScNo();
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

	@Override
	public Subs selectBoardByNo(SqlSession sqlsession, Integer scNo) {
		// TODO Auto-generated method stub
		Subs subs = sqlsession.selectOne("SubsMapper.selectBoardByNo", scNo);
		return subs;
	}

	@Override
	public int deleteBoard(SqlSession sqlsession, Integer scNo) {
		// TODO Auto-generated method stub
		int result = sqlsession.delete("SubsMapper.deleteBoard", scNo);
		return result;
	}

	@Override
	public int insertSubs(SqlSession sqlsession, SubsFiles SubsFiles) {
		// TODO Auto-generated method stub
		int result = sqlsession.insert("SubsMapper.insertSubsFiles", SubsFiles);
		return result;
	}



	@Override
	public int updateBoard(SqlSession sqlsession, Subs subs) {
		// TODO Auto-generated method stub
		int result = sqlsession.update("SubsMapper.updateBoard", subs);
		return result;
	}
	
	@Override
	public int updateBoardFiles(SqlSession sqlsession, SubsFiles SubsFiles) {
		// TODO Auto-generated method stub
		int result = sqlsession.update("SubsMapper.updateBoardFiles", SubsFiles);
		return result;
	}



	@Override
	public List<Subs> searchSubsByKeyword(SqlSession sqlsession, PageInfo pInfo, Map<String, String> paramMap) {
		// TODO Auto-generated method stub	
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Subs> searchList
			= sqlsession.selectList("SubsMapper.searchSubsByKeyword", paramMap, rowBounds);
		return searchList;
	}

}
