package kr.co.drive.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.review.domain.RePageInfo;
import kr.co.drive.review.domain.Review;

public interface ReviewStore {

	int insertReview(SqlSession sqlSession, Review review);

	int selectListCount(SqlSession sqlSession);

	List<Review> selectReviewList(SqlSession sqlSession, RePageInfo rpInfo);

}
