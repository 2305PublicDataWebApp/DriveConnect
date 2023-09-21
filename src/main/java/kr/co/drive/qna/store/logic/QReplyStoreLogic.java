package kr.co.drive.qna.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.qna.domain.QReply;
import kr.co.drive.qna.store.QReplyStore;

@Repository
public class QReplyStoreLogic implements QReplyStore{

	@Override
	public List<QReply> selectQReplyList(SqlSession sqlSession, Integer qNo) {
		List<QReply> qrList = sqlSession.selectList("QReplyMapper.selectQReplyList", qNo);
		return qrList;
	}

	@Override
	public int insertQReply(SqlSession sqlSession, QReply qreply) {
		int result = sqlSession.insert("QReplyMapper.insertQReply", qreply);
		return result;
	}

	@Override
	public int updateQReply(SqlSession sqlSession, QReply qreply) {
		int result = sqlSession.update("QReplyMapper.updateQReply", qreply);
		return result;
	}

	@Override
	public int deleteQReply(SqlSession sqlSession, QReply qreply) {
		int result = sqlSession.delete("QReplyMapper.deleteQReply", qreply);
		return result;
	}

	
	
}
