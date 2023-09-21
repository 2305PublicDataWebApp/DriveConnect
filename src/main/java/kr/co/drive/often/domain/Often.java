package kr.co.drive.often.domain;

public class Often {

	private int oNo;
	private String oSubject;
	private String oContent;
	private String userId;
	private int userNo;
	
	
	
//	public Often(int oNo, String oSubject, String oContent, String userId, int userNo) {
//		super();
//		this.oNo = oNo;
//		this.oSubject = oSubject;
//		this.oContent = oContent;
//		this.userId = userId;
//		this.userNo = userNo;
//	}
	
	
	public int getoNo() {
		return oNo;
	}
	public void setoNo(int oNo) {
		this.oNo = oNo;
	}
	public String getoSubject() {
		return oSubject;
	}
	public void setoSubject(String oSubject) {
		this.oSubject = oSubject;
	}
	public String getoContent() {
		return oContent;
	}
	public void setoContent(String oContent) {
		this.oContent = oContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	@Override
	public String toString() {
		return "자주 묻는 질문 [질문번호=" + oNo + ", 질문제목=" + oSubject + ", 질문내용=" + oContent + ", 회원아이디=" + userId
				+ ", 회원번호=" + userNo + "]";
	}
	
	
}
