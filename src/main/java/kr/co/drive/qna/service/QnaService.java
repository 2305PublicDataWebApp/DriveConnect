package kr.co.drive.qna.service;

import java.util.List;

import kr.co.drive.qna.domain.QReply;
import kr.co.drive.qna.domain.Qna;

public interface QnaService {

	int insertqna(Qna qna);

	List<Qna> selectQnaList();


	Qna selectQnaByNo(Integer qNo);

	int deleteQna(Qna qna);

	int updateQna(Qna qna);

}
