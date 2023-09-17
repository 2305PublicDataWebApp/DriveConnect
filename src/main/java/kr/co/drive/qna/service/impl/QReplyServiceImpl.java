package kr.co.drive.qna.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.qna.domain.QReply;
import kr.co.drive.qna.service.QReplyService;
import kr.co.drive.qna.store.QReplyStore;
import kr.co.drive.review.domain.ReReply;

@Service
public class QReplyServiceImpl implements QReplyService{
	
	@Autowired
	private QReplyStore qrStore;
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<QReply> selectQnaReplyList(Integer qNo) {
		List<QReply> qrList = qrStore.selectQReplyList(sqlSession, qNo);
		return qrList;
	}
	@Override
	public int insertReply(QReply qreply) {
		int result = qrStore.insertQReply(sqlSession, qreply);
		return result;
	}
	@Override
	public int updateReply(QReply qreply) {
		int result = qrStore.updateReply(sqlSession, qreply);
		return result;
	}
	@Override
	public int deleteReply(QReply qreply) {
		int result = qrStore.deleteReply(sqlSession, qreply);
		return result;
	}

	
}
