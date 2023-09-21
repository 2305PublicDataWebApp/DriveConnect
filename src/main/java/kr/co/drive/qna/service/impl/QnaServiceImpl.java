package kr.co.drive.qna.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.qna.domain.QReply;
import kr.co.drive.qna.domain.Qna;
import kr.co.drive.qna.service.QnaService;
import kr.co.drive.qna.store.QnaStore;
import kr.co.drive.review.domain.Review;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaStore qStore;
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int insertQna(Qna qna) {
		int result = qStore.insertQna(sqlSession, qna);
		return result;
	}


	@Override
	public List<Qna> selectQnaList() {
		List<Qna> qList = qStore.selectQnaList(sqlSession);
		return qList;
	}


	@Override
	public Qna selectQnaByNo(Integer qNo) {
		Qna qna = qStore.selectQnaByNo(sqlSession, qNo);
		return qna;
	}



	@Override
	public int deleteQna(Qna qna) {
		int result = qStore.deleteQna(sqlSession, qna);
		return result;
	}


	@Override
	public int updateQna(Qna qna) {
		int result = qStore.updateQna(sqlSession, qna);
		return result;
	}






	
}
