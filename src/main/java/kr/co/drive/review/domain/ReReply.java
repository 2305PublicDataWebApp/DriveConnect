package kr.co.drive.review.domain;

public class ReReply {

	private int rrNo;
	private String userId;
	private String rrContent;
	private int rNo;
	
	
	
	public ReReply(int rrNo, String userId, String rrContent, int rNo) {
		super();
		this.rrNo = rrNo;
		this.userId = userId;
		this.rrContent = rrContent;
		this.rNo = rNo;
	}
	public int getRrNo() {
		return rrNo;
	}
	public void setRrNo(int rrNo) {
		this.rrNo = rrNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRrContent() {
		return rrContent;
	}
	public void setRrContent(String rrContent) {
		this.rrContent = rrContent;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	@Override
	public String toString() {
		return "후기댓글 [댓글번호=" + rrNo + ", 회원아이디=" + userId + ", 내용=" + rrContent + ", 후기 글번호=" + rNo + "]";
	}
	
	
}
