package kr.co.drive.qna.domain;

import java.sql.Timestamp;

public class QReply {

	private int qnaReplyNo;
	private String userId;
	private String qnaReplyContent;
	private Timestamp rUpdate;
	private int qnaNo;
	
	public int getQnaReplyNo() {
		return qnaReplyNo;
	}
	public void setQnaReplyNo(int qnaReplyNo) {
		this.qnaReplyNo = qnaReplyNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQnaReplyContent() {
		return qnaReplyContent;
	}
	public void setQnaReplyContent(String qnaReplyContent) {
		this.qnaReplyContent = qnaReplyContent;
	}
	public Timestamp getrUpdate() {
		return rUpdate;
	}
	public void setrUpdate(Timestamp rUpdate) {
		this.rUpdate = rUpdate;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	@Override
	public String toString() {
		return "문의답변 [문의글 답변=" + qnaReplyNo + ", 회원아이디=" + userId + ", 답변 내용=" + qnaReplyContent
				+ ", 답변수정=" + rUpdate + ", 후기글 번호=" + qnaNo + "]";
	}
	
}
