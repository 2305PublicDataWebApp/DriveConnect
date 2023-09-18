package kr.co.drive.subs.service;

import kr.co.drive.subs.domain.Subs;

public interface SubsService {

	/**
	 * 게시글 등록 Service
	 * @param subs
	 * @return
	 */
	int insertBoard(Subs subs);

}
