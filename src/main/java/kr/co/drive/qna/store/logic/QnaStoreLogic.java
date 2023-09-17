package kr.co.drive.qna.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.drive.qna.domain.Qna;
import kr.co.drive.qna.store.QnaStore;
import kr.co.drive.review.domain.Review;

@Repository
public class QnaStoreLogic implements QnaStore{

	@Override
	public int insertqna(SqlSession sqlSession, Qna qna) {
		int result = sqlSession.insert("QnaMapper.insertQna", qna);
		return result;
	}

	@Override
	public List<Qna> selectQnaList(SqlSession sqlSession) {
		List<Qna> qList = sqlSession.selectList("QnaMapper.selectQnalList");
		return qList;
	}

	@Override
	public Qna selectQnaByNo(SqlSession sqlSession, Integer qNo) {
		Qna qna = sqlSession.selectOne("QnaMapper.selectQnaByNo", qNo);
		return qna;
	}

	@Override
	public int deleteQna(SqlSession sqlSession, Qna qna) {
		int result = sqlSession.delete("QnaMapper.deleteQna", qna);
		return result;
	}

	@Override
	public int updateQna(SqlSession sqlSession, Qna qna) {
		int result = sqlSession.update("QnaMapper.updateQna", qna);
		return result;
	}

}
