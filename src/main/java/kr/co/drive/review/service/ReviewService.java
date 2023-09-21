package kr.co.drive.review.service;

import java.util.List;
import java.util.Map;

import kr.co.drive.review.domain.RePageInfo;
import kr.co.drive.review.domain.ReReply;
import kr.co.drive.review.domain.Review;

public interface ReviewService {

	int insertReview(Review review);

	Integer getListCount();

	List<Review> selectReviewList(RePageInfo rpInfo);


	Review selectReviewByNo(Integer rNo);

	int deleteReview(Review review);

	int updateReview(Review review);

	List<Review> searchReviewByKeyword(RePageInfo pInfo, Map<String, String> paramMap);


}
