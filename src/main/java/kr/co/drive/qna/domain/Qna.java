package kr.co.drive.qna.domain;

import java.sql.Timestamp;

public class Qna {

	private int qNo;
	private String userId;
	private String userName;
	private String qSubject;
	private String qContent;
	private Timestamp qCreate;
	private Timestamp rCreate;
	private String rYn;
	private int userNo;
	private int qnaReplyNo;
	
	
	public Qna() {
		// TODO Auto-generated constructor stub
	}
	
//	public Qna(int qNo, String userId, String userName, String qSubject, String qContent, Timestamp qCreate,
//			Timestamp rCreate, String rYn, int userNo) {
//		super();
//		this.qNo = qNo;
//		this.userId = userId;
//		this.userName = userName;
//		this.qSubject = qSubject;
//		this.qContent = qContent;
//		this.qCreate = qCreate;
//		this.rCreate = rCreate;
//		this.rYn = rYn;
//		this.userNo = userNo;
//	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getqSubject() {
		return qSubject;
	}
	public void setqSubject(String qSubject) {
		this.qSubject = qSubject;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public Timestamp getqCreate() {
		return qCreate;
	}
	public void setqCreate(Timestamp qCreate) {
		this.qCreate = qCreate;
	}
	public Timestamp getrCreate() {
		return rCreate;
	}
	public void setrCreate(Timestamp rCreate) {
		this.rCreate = rCreate;
	}
	public String getrYn() {
		return rYn;
	}
	public void setrYn(String rYn) {
		this.rYn = rYn;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public int getQnaReplyNo() {
		return qnaReplyNo;
	}

	public void setQnaReplyNo(int qnaReplyNo) {
		this.qnaReplyNo = qnaReplyNo;
	}

	@Override
	public String toString() {
		return "문의 [문의글 번호=" + qNo + ", 회원 아이디=" + userId + ", 회원이름=" + userName + ", 문의 제목=" + qSubject
				+ ", 문의 내용=" + qContent + ", 작성날짜=" + qCreate + ", 답변수정=" + rCreate + ", 답변여부=" + rYn
				+ ", 회원번호=" + userNo + ", 댓글번호=" + qnaReplyNo + "]";
	}
}
