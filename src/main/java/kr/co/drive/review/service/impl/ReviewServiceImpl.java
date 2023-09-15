package kr.co.drive.review.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.drive.review.domain.RePageInfo;
import kr.co.drive.review.domain.Review;
import kr.co.drive.review.service.ReviewService;
import kr.co.drive.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewStore rStore;
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertReview(Review review) {
		int result = rStore.insertReview(sqlSession, review);
		return result;
	}

	@Override
	public Integer getListCount() {
		int result = rStore.selectListCount(sqlSession);
		return result;
	}

	@Override
	public List<Review> selectReviewList(RePageInfo rpInfo) {
		List<Review> rList = rStore.selectReviewList(sqlSession, rpInfo);
		return rList;
	}

}
