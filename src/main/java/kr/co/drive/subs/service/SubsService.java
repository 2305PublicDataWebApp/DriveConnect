package kr.co.drive.subs.service;

import java.util.List;

import kr.co.drive.subs.domain.PageInfo;
import kr.co.drive.subs.domain.Subs;
import kr.co.drive.subs.domain.SubsFiles;

public interface SubsService {

	/**
	 * 게시글 등록 Service
	 * @param subs
	 * @param subsFiles 
	 * @return
	 */
	int insertBoard(Subs subs);

	/**
	 * 게시글 전체 조회 Service
	 * @param pInfo
	 * @return
	 */
	List<Subs> selectBoardList(PageInfo pInfo);

	/**
	 * 전체 게시물 갯수 Service
	 * @return
	 */
	int getListCount();

	/**
	 * 게시글 상세 조회 Service
	 * @param scNo
	 * @return
	 */
	Subs selectBoardByNo(Integer scNo);

	/**
	 * 게시글 삭제 Service
	 * @param scNo
	 * @return
	 */
	int deleteBoard(Integer scNo);

	/**
	 * 첨부파일 삽입 Service
	 * @param subs
	 */
	int insertSubs(Subs subs);

}
