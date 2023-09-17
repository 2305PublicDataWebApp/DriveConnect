package kr.co.drive.qna.service;

import java.util.List;

import kr.co.drive.qna.domain.QReply;

public interface QReplyService {

	List<QReply> selectQnaReplyList(Integer qNo);

	int insertReply(QReply qreply);

	int updateReply(QReply qreply);

	int deleteReply(QReply qreply);


}
