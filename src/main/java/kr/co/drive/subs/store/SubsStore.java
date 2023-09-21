package kr.co.drive.subs.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.subs.domain.PageInfo;
import kr.co.drive.subs.domain.Subs;
import kr.co.drive.subs.domain.SubsFiles;

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

	/**
	 * 게시글 상세 조회 Store
	 * @param sqlsession
	 * @param scNo
	 * @return
	 */
	Subs selectBoardByNo(SqlSession sqlsession, Integer scNo);

	/**
	 * 게시글 삭제 Store
	 * @param sqlsession
	 * @param scNo
	 * @return
	 */
	int deleteBoard(SqlSession sqlsession, Integer scNo);

	/**
	 * 게시글 파일첨부 Store
	 * @param sqlsession
	 * @param subsFiles
	 * @return
	 */
	int insertSubs(SqlSession sqlsession, SubsFiles subsFiles);

	/**
	 * 게시글 수정(SUBS_CAR) Store
	 * @param sqlsession
	 * @param subs
	 * @return
	 */
	int updateBoard(SqlSession sqlsession, Subs subs);

	/**
	 * 게시글 수정(SUBS_CAR_FILES) Store
	 * @param sqlsession
	 * @param subsFiles
	 * @return
	 */
	int updateBoardFiles(SqlSession sqlsession, SubsFiles subsFiles);

	/**
	 * 공지사항 조건에 따라 키워드로 조회 Store
	 * @param sqlsession
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	List<Subs> searchSubsByKeyword(SqlSession sqlsession, PageInfo pInfo, Map<String, String> paramMap);

	int selectListCount(SqlSession sqlsession, Map<String, String> paramMap);

}
