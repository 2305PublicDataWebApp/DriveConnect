package kr.co.drive.notice.domain;

import java.sql.Timestamp;

public class Notice {

	private int nNo;
	private String nSubject;
	private String nContent;
	private Timestamp nDate;
	private String userNo;
	
	
	public Notice(int nNo, String nSubject, String nContent, Timestamp nDate, String userNo) {
		super();
		this.nNo = nNo;
		this.nSubject = nSubject;
		this.nContent = nContent;
		this.nDate = nDate;
		this.userNo = userNo;
	}
	
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnSubject() {
		return nSubject;
	}
	public void setnSubject(String nSubject) {
		this.nSubject = nSubject;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Timestamp getnDate() {
		return nDate;
	}
	public void setnDate(Timestamp nDate) {
		this.nDate = nDate;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "공지사항 [공지번호=" + nNo + ", 제목=" + nSubject + ", 내용=" + nContent + ", 작성날짜=" + nDate
				+ ", 회원번호=" + userNo + "]";
	}

	
}
