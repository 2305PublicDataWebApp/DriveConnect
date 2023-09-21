package kr.co.drive.review.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.drive.review.domain.RePageInfo;
import kr.co.drive.review.domain.Review;

public interface ReviewStore {

	int insertReview(SqlSession sqlSession, Review review);

	int selectListCount(SqlSession sqlSession);

	List<Review> selectReviewList(SqlSession sqlSession, RePageInfo rpInfo);

	Review selectReviewByNo(SqlSession sqlSession, Integer rNo);

	int deleteReview(SqlSession sqlSession, Review review);

	int updateReview(SqlSession sqlSession, Review review);

	List<Review> selectReviewByKeyword(SqlSession sqlSession, RePageInfo pInfo, Map<String, String> paramMap);

}
