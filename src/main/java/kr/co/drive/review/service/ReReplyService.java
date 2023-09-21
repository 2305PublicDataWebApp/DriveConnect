package kr.co.drive.review.service;

import java.util.List;

import kr.co.drive.review.domain.ReReply;

public interface ReReplyService {

	int insertReply(ReReply rreply);

	int updateReply(ReReply rreply);

	int deleteReply(ReReply rreply);

	List<ReReply> selectReReplyList(Integer rNo);


}
