package kr.co.drive.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.review.domain.ReReply;

public interface ReReplyStore {

	int insertReReply(SqlSession sqlSession, ReReply rreply);

	int updateReply(SqlSession sqlSession, ReReply rreply);

	int deleteReply(SqlSession sqlSession, ReReply rreply);

	List<ReReply> selectReReplyList(SqlSession sqlSession, Integer rNo);

}
