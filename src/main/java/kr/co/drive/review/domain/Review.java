package kr.co.drive.review.domain;

import java.sql.Timestamp;

public class Review {

	private int rNo;
	private String userId;
	private String scName;
	private String rSubject;
	private String rContent;
	private Timestamp rCreate;
	private String fileName;
	private String fileRename;
	private String filePath;
	private double fileLength;
	private int user_No;
	
	
	
	public int getrNo() {
		return rNo;
	}



	public void setrNo(int rNo) {
		this.rNo = rNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getScName() {
		return scName;
	}



	public void setScName(String scName) {
		this.scName = scName;
	}



	public String getrSubject() {
		return rSubject;
	}



	public void setrSubject(String rSubject) {
		this.rSubject = rSubject;
	}



	public String getrContent() {
		return rContent;
	}



	public void setrContent(String rContent) {
		this.rContent = rContent;
	}



	public Timestamp getrCreate() {
		return rCreate;
	}



	public void setrCreate(Timestamp rCreate) {
		this.rCreate = rCreate;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public String getFileRename() {
		return fileRename;
	}



	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	public double getFileLength() {
		return fileLength;
	}



	public void setFileLength(double fileLength) {
		this.fileLength = fileLength;
	}



	public int getUser_No() {
		return user_No;
	}



	public void setUser_No(int user_No) {
		this.user_No = user_No;
	}



	@Override
	public String toString() {
		return "후기 [후기글번호=" + rNo + ", 회원 아이디=" + userId + ", 차량명=" + scName + ", 후기 제목=" + rSubject
				+ ", 후기 내용=" + rContent + ", 후기 작성날짜=" + rCreate + ", 파일이름=" + fileName + ", 파일리네임="
				+ fileRename + ", 파일경로=" + filePath + ", 파일크기=" + fileLength + ", 회원 번호=" + user_No + "]";
	}
	
	
}
