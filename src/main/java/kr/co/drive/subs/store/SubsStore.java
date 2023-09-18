package kr.co.drive.subs.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.subs.domain.PageInfo;
import kr.co.drive.subs.domain.Subs;

public interface SubsStore {

	/**
	 * 게시글 등록 Store
	 * @param sqlsession
	 * @param subs
	 * @return
	 */
	int insertBoard(SqlSession sqlsession, Subs subs);

	/**
	 * 게시글 전체 조회 Store
	 * @param sqlsession
	 * @param pInfo
	 * @return
	 */
	List<Subs> selectBoardList(SqlSession sqlsession, PageInfo pInfo);

	/**
	 * 게시글 전체 갯수 Store
	 * @param sqlsession
	 * @return
	 */
	int selectListCount(SqlSession sqlsession);

}
