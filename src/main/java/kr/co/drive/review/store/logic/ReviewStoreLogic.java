package kr.co.drive.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import kr.co.drive.review.domain.RePageInfo;
import kr.co.drive.review.domain.Review;
import kr.co.drive.review.store.ReviewStore;

@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Override
	public int insertReview(SqlSession sqlSession, Review review) {
		int result = sqlSession.insert("ReviewMapper.insertReview", review);
		return result;
	}

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("ReviewMapper.selectListCount");
		return result;
	}

	@Override
	public List<Review> selectReviewList(SqlSession sqlSession, RePageInfo rpInfo) {
		int limit = rpInfo.getNaviCountPerPage();
		int offset = (rpInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = sqlSession.selectList("ReviewMapper.selectReviewList", null, rowBounds);
		return rList;
	}

}
