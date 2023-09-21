package kr.co.drive.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.review.domain.ReReply;
import kr.co.drive.review.store.ReReplyStore;

@Repository
public class ReReplyStoreLogic implements ReReplyStore{

	@Override
	public int insertReply(SqlSession sqlSession, ReReply rreply) {
		int result = sqlSession.insert("ReReplyMapper.insertReReply", rreply);
		return result;
	}

	@Override
	public int updateReply(SqlSession sqlSession, ReReply rreply) {
		int result = sqlSession.update("ReReplyMapper.updateReReply", rreply);
		return result;
	}

	@Override
	public int deleteReply(SqlSession sqlSession, ReReply rreply) {
		int result = sqlSession.delete("ReReplyMapper.deleteReReply", rreply);
		return result;
	}

	@Override
	public List<ReReply> selectReReplyList(SqlSession sqlSession, Integer rNo) {
		List<ReReply> rrList = sqlSession.selectList("ReReplyMapper.selectReReplyList", rNo);
		return rrList;
	}

}
