package kr.co.drive.qna.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.qna.domain.Qna;

public interface QnaStore {

	int insertQna(SqlSession sqlSession, Qna qna);


	List<Qna> selectQnaList(SqlSession sqlSession);


	Qna selectQnaByNo(SqlSession sqlSession, Integer qNo);


	int deleteQna(SqlSession sqlSession, Qna qna);


	int updateQna(SqlSession sqlSession, Qna qna);

}
