package kr.co.drive.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.review.domain.ReReply;
import kr.co.drive.review.service.ReReplyService;
import kr.co.drive.review.store.ReReplyStore;

@Service
public class ReReplyServiceImpl implements ReReplyService{
	
	@Autowired
	private ReReplyStore rrStore;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertReply(ReReply rreply) {
		int result = rrStore.insertReply(sqlSession, rreply);
		return result;
	}

	@Override
	public int updateReply(ReReply rreply) {
		int result = rrStore.updateReply(sqlSession, rreply);
		return result;
	}

	@Override
	public int deleteReply(ReReply rreply) {
		int result = rrStore.deleteReply(sqlSession, rreply);
		return result;
	}

	@Override
	public List<ReReply> selectReReplyList(Integer rNo) {
		List<ReReply> rrList = rrStore.selectReReplyList(sqlSession, rNo);
		return rrList;
	}


}
