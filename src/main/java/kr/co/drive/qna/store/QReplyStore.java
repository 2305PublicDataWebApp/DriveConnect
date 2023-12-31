package kr.co.drive.qna.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.qna.domain.QReply;

public interface QReplyStore {

	List<QReply> selectQReplyList(SqlSession sqlSession, Integer qNo);

	int insertQReply(SqlSession sqlSession, QReply qreply);

	int updateQReply(SqlSession sqlSession, QReply qreply);

	int deleteQReply(SqlSession sqlSession, QReply qreply);

}
