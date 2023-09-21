package kr.co.drive.qna.service;

import java.util.List;

import kr.co.drive.qna.domain.QReply;
import kr.co.drive.qna.domain.Qna;

public interface QReplyService {

	List<QReply> selectQnaReplyList(Integer qNo);

	int insertQReply(QReply qreply);

	int updateQReply(QReply qreply);

	int deleteQReply(QReply qreply);

	List<QReply> selectQReplyList(Integer qNo);



}
